# PCA
# Language: R
# Input: TXT (key, value pairs)
# Output: Prefix
# Tested with: PluMA 1.1, R 4.0.0
# Dependency: ggbiplot_0.55

PluMA plugin to run Principal Component Analysis (Pearson, 1901) to determine, given
two sets of data and the values of multiple observables in each set, how well the
two sets can be separated based on these values.

The plugin accepts as input a TXT file with keyword, value pairs.  The keyword
"input1" should be mapped to the name of the first input datafile (CSV).  If that
is the only specified keyword, the PCA plugin will run on only that dataset.

If an "input2" is specified, PCA will be used to specifically distinguish between
the two datasets.  The first will be labeled "Healthy" (or control), the second "Diseased".

The plugin accepts a "prefix" as an "outputfile" and will generate three output files:
1. (prefix).plotdata.csv -> Data for the PCA plot, in tabular format
2. (prefix).rotational.csv -> Rotational data for all PCA components
3. (prefix).graph.pdf -> PCA plot, in visual form

