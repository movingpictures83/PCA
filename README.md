# PCA
# Language: R
# Input: TXT (key, value pairs)
# Output: Prefix
# Tested with: PluMA 1.0, R 3.2.5

PluMA plugin to run Principal Component Analysis (Pearson, 1901) to determine, given
two sets of data and the values of multiple observables in each set, how well the
two sets can be separated based on these values.

The plugin expects as input a text file with two key, value pairs.  The keys are
"input1" and "input2", and both should map to a CSV file with data set 1 and data set 2,
respectively.

The plugin accepts a "prefix" as an "outputfile" and will generate three output files:
1. (prefix).plotdata.csv -> Data for the PCA plot, in tabular format
2. (prefix).rotational.csv -> Rotational data for all PCA components
3. (prefix).graph.pdf -> PCA plot, in visual form

