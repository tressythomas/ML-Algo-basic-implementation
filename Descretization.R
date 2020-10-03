#Descretization
#Equal Width
tv=iris$Species;c=length(levels(tv)) #target variable class
tf=iris$Petal.Length

bins=floor(length(tf)/(3*c))
W=(max(tf)-min(tf))/bins
lb=min(tf);ub=lb+W
ix=order(tf) #get the idex before sorting
tf=sort(tf,decreasing=FALSE)
b=1
for (i in 1:length(tf)){
  
  if(tf[i]<=ub && tf[i]>=lb){
    tf.discrete[i]=b
    }else{
    tf.discrete[i]=b+1
    b=b+1
    lb=ub
    ub=ub+W
    
    }
}
tf.discrete=tf.discrete[ix]

#Equal Frequency
tv=iris$Species;c=length(levels(tv)) #target variable class
tf=iris$Petal.Length
bins=floor(length(tf)/(3*c))
ix=order(tf) #get the idex before sorting
tf=sort(tf,decreasing=FALSE)
W=floor(length(tf)/bins)
bound=W
b=1
for (i in 1:length(tf)){
  if(i<=bound){
    tf.discrete[i]=b
  }else{
    tf.discrete[i]=b+1
    b=b+1
    bound=bound+W
    
  }
}
tf.discrete=tf.discrete[ix]
