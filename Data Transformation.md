R Data Mining and ML algo implementations(Learning Basics and notes)

Data transformation and data discretization
 Data transformation: Replace an entire set of attribute values with to a new set. 
                      Old Values can be identified with new value.
                     
• Normalization: 1) Min-Max, 2) Z score, 3) Decimal Scaling

Test for Normality
Ho: The distribution is normal
HA: The distribution is NOT normal
!!!! When the p.value is less than set alpha, it implies there is  enough EVIDENCE AGAINST Normality

                    oShapiro-Wilk Test
                    oKolmogorov-Smirnov Test
                    oAnderson-Darling Test 
                    Histograms and Boxplots
                    
• Remove Skewness: Tukey’s Ladder of Powers. To remove RIGHT SKEWNESS, use square root, cube root, log, or reciprocal of the variable. To remove LEFT SKEWNESS, use squares, cubes of the varaible. 
                      
• Discretization: Partitioning continous varaibles into categories.For more summarised, compat data. 
                  Required for better performance of DT nd Classifiers.Requirement for many algos.
                  Discretization process<Complexity should be low, cosidering this is a preprocessing step>
                  
                  o static attribute discretization - descretization is performed on each attribute independently.
                  
                  o dynamic attribute discretization -selection of intervals on ALL attributes considered simultaneously
                  
      • Unsupervised Discretization Algorithms: Binning
            o Equal Width: uniform grid Divides the range into N intervals of equal size- Width=(Range)/Bins.
            ??problem - Outliers
            o Equal Frequency: Divides the range into N intervals, each interval with same number of observations. 
            ??problem - not meaningful for cat variables in the dataset.
    
                            1. Decide the number of intervals, N. When N is large- more orig info is retained. when N is small- good for subsequent learner algo. 
                            Rule of thumb. N= #observation/(3*number of classes)
                            2. Width of each interval, W.
             o Clustering             
       • Supervised Discretization Algorithms:
             o CAIM
             o chi-squared Discretization
• Smoothing: Remove noise from data

• Attribute/feature construction: New attributes constructed from the given ones

• Aggregation: Summarization, data cube construction


