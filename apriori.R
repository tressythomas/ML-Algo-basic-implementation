library(arules)
library(data.table)
library(stringr)
library(gtools)

# Test #1 data
data("Groceries")
itemset=Groceries
itemset=itemset[1:20]

#Test#2 data
A=c("M","O","N","K","E","Y")
B=c("D","O","N","K","E","Y")
C=c("M","A","K","E")
D=c("M","U","C","K","Y")
E=c("C","O","O","K","I","E")
it = list(A,B,C,D,E)
itemset=it

##############################################################################################################
ap=apriori(itemset, parameter=list(support=0.09,target="frequent itemsets"))
arules::inspect(ap)

fi=apr(itemset,0.09,0.8)
fi

apr<-function(itemset,s=0.6,c=0.8){
  # --------------------------------------------------------------
  # Apriori algorithm impementation for Frequent sets and Association rule
  # --------------------------------------------------------------
  FI.temp=NULL
  item.list=as(itemset, "list")                     # transform the input to a list
  print(s)
  min.supp=s*length(item.list)
  min.conf=c
  item.list=lapply(1:length(item.list),function(x) unique(item.list[[x]]))
  tran.item.n=data.frame(l=lengths(item.list))      # get number of items in each transaction
  tran.item.n$RN=as.numeric(rownames(tran.item.n))
  temp=tran.item.n[order(tran.item.n$l),]           #sort the transaction id aka index acc. to the number of items 
  max.items=max(tran.item.n$l)                      #get the maximum  number of items present in any single transaction in the candidate itemset
  
  #Get unique items
  a=unlist(item.list)  
  item=unique(a)
  n=length(item) #number of unique items
  c=1
  #sort the items in transactions
  item.list=lapply(1:length(item.list),function(x) unique(sort(item.list[[x]])))
  item.list.ord=lapply(temp$RN,function(x) item.list[[x]])
  z=unlist(lapply(item, function(x) sum(str_count(a, x))))
  #####  Initialization
  L1=data.frame(itemset=item,freq=z) #get the frequency from the k=1 candidate itemset 
  Lk=L1[L1$freq>=min.supp,] #get the frequent itemsets by filtering the frq by min-support.
  row.names(Lk)=NULL
  FI.temp[[c]]=Lk
  for (k in 2:max.items){
    ix=which(lengths(item.list.ord)>=k) #get the itemsets with k or more items 
    temp.list=lapply(ix,function(x) item.list.ord[[x]])
    #SELFJOIN candidate list
    titems=unique(unlist(Lk[,-ncol(Lk)]))
    n=length(titems)
    sj=as.data.frame(combinations(n,k,titems))
    #get frequency of each itemset
    z=NULL
    for (i in 1:nrow(sj)){
      b=unlist(lapply(temp.list,function(x) sum(x%in%unlist(sj[i,]))==k)) #check in the transaction for the candidate itemsets
      z=append(z,sum(b)) 
    } 
    Ltemp=sj
    Ltemp$freq=z
    #Check min Support criteria
    Lk=Ltemp[Ltemp$freq>=min.supp,]
    row.names(Lk)=NULL
    if (nrow(Lk)>0){
      c=c+1
      print(c)
      print(Lk)
      FI.temp[[c]]=Lk
      if (nrow(Lk)==1)
        break
    }
    else
      break
  }        
  #Get rules
  if (length(FI.temp) >1){
    rules.temp=NULL;arule=data.frame(NA,NA,NA);r=0;colnames(arule)=c('ant','desc','conf')
    for (i in 2:length(FI.temp)){
      s=FI.temp[[i-1]]
      a=FI.temp[[i]]
      for (j in 1:nrow(a)){
        if (i > 1)
          rules.temp=permutations(ncol(a)-1,ncol(a)-1,unlist(a[j,-ncol(a)])) 
        else 
          rules.temp=a[,-ncol(a)]
        for (k in 1:nrow(rules.temp)){
          ant=c(rules.temp[k,1:ncol(rules.temp)-1])
          des=c(rules.temp[k,ncol(rules.temp)])
          t=ncol(s)-1
          for (l in 1:nrow(s)){
            if (sum(ant%in%unlist(s[l,1:t]))==t){
              supp=s[l,ncol(s)];  
              break
            }
          }
          conf=a[j,"freq"]/supp; 
          if (conf >= min.conf){
            r=r+1
            arule[r,1]=toString(sort(c(ant)))
            arule$desc[r]=des
            arule$conf[r]=conf
          }
        }
      }
    }
    arule =unique(arule) 
    print("Association Rules")
    print(arule)
  }
  return(FI.temp)
  
}



