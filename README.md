# Chromosome-Analysis
1. Brief Description:
The code reads base sequence of a human chromosome segment and calculates the number of proteins encoded in this sequence, their average, maximum, and minimum lengths, and also the most and least frequent stop codons.

2. Model and Theory
The DNA is a sequence of nucleotides that encodes the genetic information. The four nucleotides that are used are adenine (A), cytosine (C), guanine (G), and thymine (T). The following convention is used to substitute letters with numbers: A=1, C=2, G=3, T=4. A set of three nucleotides is called a codon and can encode for an amino acid in a protein-coding segment. A protein-coding segment is enclosed with a start codon and a stop codon. The start codon is ATG (143), and the stop codon can be any of the three: TAA (411), TAG (413), or TGA (431). Any start codons that appear before the stop codon in a protein-coding segment should be ignored. Likewise, any stop codons that appear before the start codon between protein-coding segments should be ignored as well.

3. Discussions and Conclusions
It can be seen that in the sample of 1,261,563 bases of human chromosome 1, there are 4339 protein-coding segments in total with an average length of 87.69 bases, and maximum and minimum lengths of 1797 and 6 bases, respectively.

Using function sum(proteinLengthsArr) to calculate the number of bases in all protein-coding segments yields 380,472 bases, including start and stop codons. Finding the percentage of protein-coding bases in the sample chromosome yields 380,472/1,261,563×100%=30.16%.
Retrieving the values of counters for each of the stop codons shows that TGA is the most frequently used stop codon with 1897 occurrences. The least frequently used stop codon is TAG with 980 occurrences.

To account for the effect of single base replacement mutations, only two out of three bases in a codon need to be checked for matching. For example, the start codon is 143. Considering that the first base of the codon can be replaced with another base in single base replacement, the following combinations result: 143, 243, 343, 443. Notice that the set of four combinations includes the correct codon (143) as well as three mutated codons. The script only needs to check for the second (k+1) and the third (k+2) codons because the first one can be anything in single base mutation. There is no need to check the first codon. Similarly, the second base can be replaced while the first (k) and third (k+2) bases stay the same. And finally, the third base can be replaced while the first and second bases stay the same.

Additionally, stop codons can be seen as mutations of one another at specific bases. For example, codon 411 and codon 413 can be seen as the same codons with the mutated third base. Therefore, the checking statements for the first and second bases in these two codons will be the same, so only one of these checking statements will be included to avoid redundancy.
