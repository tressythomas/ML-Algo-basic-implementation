<b>Data Mining - Frequent pattern Mining/Association Rule Mining</b>
______________________________________________________________
Notes from Data Mining:Concepts and Techniques Jiawei Han, Micheline Kamber, and Jian Pei University of Illinois at Urbana-Champaign &
Simon Fraser University
©2010 Han, Kamber & Pei. All rights reserved

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

<b>FP Growth</b> More efficient, cost effective method. FP CONDITIONAL TREE 

**Pattern Mining in Multi-Level, Multi-Dimensional Space**

Based on the abstraction levels, number of dimensions involved in the rule or pattern, types of values handled,  constraints or criteria used to mine selective patterns


*Mining Multi-Level Association* - 
Based on the abstraction levels.

A concept hierarchy defines a sequence of mappings from a set of low-level concepts to a
higher-level, more general concept set.


If the rules within a given set do not reference items at different abstraction
levels, then the set contains single-level association rules. Association rules generated from mining data at multiple abstraction levels are
calledmultiple-level ormultilevel association rules. Uniform, reduced and group based supports can be used generate the association rules. 
A serious side effect of mining multilevel association rules is its generation of many
redundant rules across multiple abstraction levels due to the “ancestor” relationships among items.a rule can be considered redundant if its support and confidence are close to their “expected” values, based on an ancestor of the rule.


*Mining Multidimensional Associations*- each distinct predicate in a rule as a dimension.single dimensional
or intradimensional association rule because it contains a single distinct predicate (e.g., buys) with multiple occurrences (i.e., the predicate occurs more than
once within the rule). Such rules are commonly mined from transactional data.Association rules that involve two or more dimensions or predicates can be referred
to as multidimensional association rules. Data stores that has transactional/sales/demographic relational db etc are used to generate these. Multidimensional association rules with no repeated predicates are called interdimensional association rules.We can also mine multidimensional association rules with repeated predicates, which contain multiple occurrences of some predicates. These rules are called hybrid-dimensional association rules. Techniques for mining multidimensional association rules can be
categorized into two basic approaches regarding the treatment of quantitative attributes. In the first approach mining multidimensional association rules using static
discretization of quantitative attributes, quantitative attributes are discretized using predefined concept hierarchies.discretization occurs before mining. In the second approach-(dynamic) quantitative association rules, quantitative attributes are discretized or clustered into “bins” based on the data distribution.The discretization process is dynamic and established so as to satisfy some mining criteria such as maximizing the confidence of the rules mined.

rather than searching for frequent itemsets (as is done for single-dimensional association rule mining), in multidimensional association rule mining we search for frequent predicate sets. A k-predicate set is a set containing k conjunctive predicates.
to discover novel association relationships: 

(1) a data cube method, 

(2) a clustering-based method, and 

(3) a statistical analysis method to uncover exceptional behaviors. It is possible to discover quantitative association rules that disclose exceptional behavior,
where “exceptional” is defined based on a statistical theory.
population subset--> mean of values for the subset,  

where the mean of the subset is significantly different from the mean of its complement
in the database (and this is validated by an appropriate statistical test)

*Mining Rare Patterns and Negative Patterns* An infrequent (or rare) pattern is a pattern with a frequency support that is below
(or far below) a user-specified minimum support threshold
**Constraint-Based Frequent Pattern Mining**

users specify such intuition or expectations as constraints to confine the search space.
*Rule constraints*: These specify the form of, or conditions on, the rules to be mined.
Such constraints may be expressed as metarules (rule templates), as the maximum or
minimum number of predicates that can occur in the rule antecedent or consequent,
or as relationships among attributes, attribute values, and/or aggregates.

*Metarule-Guided Mining of Association Rules*

In general, a metarule forms a hypothesis regarding the relationships that the user is interested in probing or confirming. 

*Pruning Pattern Space and Pruning Data Space* 

A constraint that may facilitate pattern  space pruning is called a pattern pruning constraint, whereas one that can be used for data space pruning is called a data pruning constraint.There are five categories of pattern mining constraints: (1) antimonotonic, (2) monotonic, (3) succinct, (4) convertible, and (5) inconvertible.
In the association rule mining contest, *antimonotonic* refers to the property that if an itemset does not satisfy a rule constraint, none of its supersets can satisfy
the constraint.

If a rule constraint obeys this property-if an itemset satisfies a rule constraint, so do do all of its supersets, it is *monotonic* . eg" sum >= C

