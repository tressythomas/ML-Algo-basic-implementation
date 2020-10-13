
**Gradient Boosting Machines**
Boosting is a framework that iteratively improves any weak learning model
Notes from http://uc-r.github.io/gbm_regression

popular machine learning algorithm GBMs build an ensemble of shallow and weak successive trees with each tree learning and improving on the previous.
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
