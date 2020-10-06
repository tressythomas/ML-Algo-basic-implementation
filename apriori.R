library(arules)
library(data.table)
library(stringr)
library(gtools)
data("Groceries")
#Ck: Candidate itemset of size k
itemset=Groceries
class(itemset);
summary(itemset)
inspect(itemset)
min.supp=2
min.conf=3

# --------------------------------------------------------------
# Apriori algorithm impementation
# --------------------------------------------------------------

item.list=as(itemset, "list")                     # transform the input to a list
item.list=item.list[1:50]
tran.item.n=data.frame(l=lengths(item.list))      # get number of items in each transaction
tran.item.n$RN=as.numeric(rownames(tran.item.n))
temp=tran.item.n[order(tran.item.n$l),]           #sort the transaction id aka index acc. to the number of items 
max.items=max(tran.item.n$l)                      #get the maximum  number of items present in any single transaction in the candidate itemset
 
#Get unique items
a=unlist(item.list)  
item=unique(a)
n=length(item) #number of unique items
#sort the items in transactions
item.list=lapply(1:length(item.list),function(x) sort(item.list[[x]]))
item.list.ord=lapply(temp$RN,function(x) item.list[[x]])
z=unlist(lapply(item, function(x) sum(str_count(a, x))))
#####  Initialization
L1=data.frame(itemset=item,freq=z) #get the frequency from the k=1 candidate itemset 
Lk=L1[L1$freq>=min.supp,] #get the frequent itemsets by filtering the frq by min-support.
FI.temp=Lk
for (k in 2:max.items){
  ix=which(lengths(item.list.ord)>=k) #get the itemsets with k or more items 
  temp.list=lapply(ix,function(x) item.list.ord[[x]])
  #SELFJOIN
  titems=unlist(Lk[,-ncol(Lk)]);n=length(titems)
  sj=as.data.frame(combinations(n,k,titems))
  #get frequency of each itemset
  z=NULL
  for (i in 1:nrow(sj)){
    b=unlist(lapply(temp.list,function(x) sum(str_count(x,unlist(sj[i,])))==k)) #check in the transaction for the candidate itemsets
    z=append(z,sum(b)) 
    # if (sum(b)>0)
    # y=which(b)
    # print(y)
    # print(temp.list[[y]])
  } 
  Ltemp=sj
  Ltemp$freq=z
  #Check min Support criteria
  Lk=Ltemp[Ltemp$freq>min.supp,]
  if (nrow(Lk)>0){
     FI.temp=list(FI.temp,Lk)
    }
  else
    break
}        
#Get rules
for (i in 1:length(FI.temp)){
  a=FI.temp[[i]]
  for (j in 1:nrow(a)){
    permutations(2,2,unlist(a[i,-ncol(a)])) 
  }
  
}
  
a.rules=apriori(Groceries, parameter=list(support=0.01, confidence=0.5))
a.rules
inspect(a.rules)
