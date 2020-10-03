<b>Data Mining - Frequent pattern Mining/Association Rule Mining</b>
______________________________________________________________

Frequent Pattern- an item or set of items, structure that frequently occur in the dataset

Item - a single entity in a transaction

Itemset - a set of one or more item. k-itemset X = {x1, …, xk}

Support(absolute) - Frequency or occurrence of an itemset X 

Support(relative) - Probability that a transaction contains X.(no:of X/No:of total transactions)

Minimum Support - Threshold support that makes a itemset eligible for frequent itemset.


Confidence - Probability that a transaction having X also contain Y.

<i>Downward closure property</i>- If the length of a frequent itemset is ‘k’ all of it 2^k subsets are also frequent.

<b>In case of very huge items, it is a challenge to mine the frequent itemset.</b> 
______________________________________________________________

Maximal patterns - An itemset is maximal frequest if the superset of that itemset is not frequent.

Closed patterns -  X is frequent and there exists no super-pattern Y כ X, with the same support as X (Hold the support information, so more relevant)

<b>Apriori</b> -A scalable frequent pattern mining approach using candidate generationa nd test approach. 
Start with itemset with 1 item. k=1
Step 1 Joining  - Generation of candidate itemsets of k+1 by self joining frequent itemset.
Step 2 Pruning  - If any itemset is INfrequent , do not generate the superset. 
Repeat until no further frequent itemset can be generated. 


