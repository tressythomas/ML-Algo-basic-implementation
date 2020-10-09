**Tree-based Models**
notes from https://bradleyboehmke.github.io/HOML/DT.html


Nonparametric algorithms that work by partitioning the feature space. 
*Decision Tree*- Simple, easy to interpret and visualize. Ensemble algorithms like  *random forests* and *gradient boosting machines* 
are constructed by combining together many decision trees in a clever way.
 
Trees are Set of rules that allows us to make predictions by asking simple yes-or-no questions about each feature. classification and regression tree (CART) algorithm is a commonly used/WELL KNOWN  DT. 

  --> partitions the training data into homogeneous subgroups
  
  --> then fits a simple constant in each subgroup
  
  Root node -- Branch -- Internal node -- leaf node
  
  For *regression problems*, the objective function to minimize is the total SSE. An alternative to explicitly specifying the depth of a decision tree is to grow a very large,
  complex tree and then prune it back to find an optimal subtree For *classification problems*, the partitioning is usually made to maximize the reduction in cross-entropy 
  or the Gini index 
  
  

