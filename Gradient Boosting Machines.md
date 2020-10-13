
**Gradient Boosting Machines**
Boosting is a framework that iteratively improves any weak learning model
Notes from http://uc-r.github.io/gbm_regression

Popular machine learning algorithm GBMs build an ensemble of shallow and weak successive trees with each tree learning and improving on the previous.
*A weak model is one whose error rate is only slightly better than random guessing*.
The main idea of boosting is to add new models to the ensemble sequentially.
At each particular iteration, a new weak, base-learner model is trained with respect to the error of the whole ensemble learnt so far.

~these, many weak successive trees produce a powerful “committee” that are often hard to beat with other algorithms

-->*Fit a decision tree to the data*

-->*Then fit the next decision tree to the residuals of the previous*

-->*Add this new tree to our algorithm*

**Repeat**

*Advantages*:

High accuracy, Flexibility, no data preprocessing required

*Disadvantages*:

Overfitting. Must use cross-validation to neutralize.Computationally expensive.Less interpretable 

**Tuning**
Part of the beauty and challenges of GBM is that they offer several tuning parameters. 

*Number of trees*: The total number of trees to fit.minimize the loss function of interest with cross validation.

*Depth of trees*: The number d of splits in each tree, which controls the complexity of the boosted ensemble. More commonly, d is greater than 1 but it is unlikely 
d > 10  will be required.

*Learning rate*: Controls how quickly the algorithm proceeds down the gradient descent. Smaller values reduce the chance of overfitting but also increases the time to find the optimal fit. This is also called shrinkage.

