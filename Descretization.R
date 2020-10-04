#Descretization
#Equal Width
tv=iris$Species;c=length(levels(tv)) #target variable class
tf=iris$Petal.Length

ew.disc<-function(tf,c){
  bins=floor(length(tf)/(3*c))+1 # Calculate the no:of bins by using the thump rule
  W=(max(tf)-min(tf))/bins       # Calculate width 
  lb=min(tf);ub=lb+W             # Calcualte initial lower and upper bound
  ix=data.frame(o=order(tf),rn=1:length(tf));ix=ix[order(ix$o),] # Get the index before sorting
  tf=sort(tf,decreasing=FALSE) 
  b=1
  for (i in 1:length(tf)){
    if(tf[i]<ub && tf[i]>=lb){
      tf.discrete[i]=b
    }else{
      b=b+1
      tf.discrete[i]=b 
      lb=ub
      ub=ub+W
    }
  }
  tf.discrete=tf.discrete[ix$rn]
  return(tf.discrete)
}

#Equal Frequency
tv=iris$Species;c=length(levels(tv)) #target variable class
tf=iris$Petal.Length
bins=floor(length(tf)/(3*c))
ix=data.frame(o=order(tf),rn=1:length(tf));ix=ix[order(ix$o),] # Get the index before sorting
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
 tf.discrete=tf.discrete[ix$rn]
