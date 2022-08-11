%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   Title: Chromosome Analysis
%   Description: This script reads base sequence of a human chromosome segment and
%   calculates the number of proteins encoded in this sequence, their
%   average, maximum, and minimum lengths, and also the most and least
%   frequent stop codons.
%   
%   Author: Slava Ermolaev
%   Date: 07/15/2022
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Clear Cache
clear all %#ok<*CLALL>
close all
clc

%%  DNA Analysis

% Import DNA sequence. After import, variable dna is created to
% store the sequence
load('chr1_sect.mat');

% Determine the number of bases
numBases = length(dna);

% Set startPoint and all stop codon counters to 0
startPoint = 0;
numProteins = 0;
counterTAA = 0;
counterTAG = 0;
counterTGA = 0;

% for all codons in dna
for k = 1:3:numBases-2
    % If startPoint is not assigned
    if startPoint == 0
        % If start codon is found
        if dna(k) == 1 && dna(k+1) == 4 && dna(k+2) == 3
            startPoint = k; % Assign startPoint of segment
        end % % End start codon assignment
    else % Else if startPoint is assigned
        % If stop codon is found
        if (dna(k) == 4 && dna(k+1) == 1 && (dna(k+2) == 1 || dna(k+2) == 3)) ...
                || (dna(k) == 4 && dna(k+1) == 3 && dna(k+2) == 1)
            % If stop codon is TAA
            if (dna(k) == 4 && dna(k+1) == 1 && dna(k+2) == 1)
                counterTAA = counterTAA + 1; % Increment counterTAA
                % If stop codon is TAG
            elseif (dna(k) == 4 && dna(k+1) == 1 && dna(k+2) == 3)
                counterTAG = counterTAG + 1; % Increment counterTAG
                % If stop codon is TGA
            elseif (dna(k) == 4 && dna(k+1) == 3 && dna(k+2) == 1)
                counterTGA = counterTGA + 1; % Increment counterTGA
            end % End counter statements

            % Found protein, increment numProteins
            numProteins = numProteins + 1;
            % Calculate the length of protein-coding segment
            proteinLength = k - startPoint + 3;

            % Store length in array
            proteinLengthsArr(numProteins) = proteinLength;

            % Reset startPoint
            startPoint = 0;
        end % End if statement for stop codon
    end % End if statement for codon checking
end % end for loop for all codons

% Calculate average, maximum, and minimum lengths
average = mean(proteinLengthsArr);
maximum = max(proteinLengthsArr);
minimum = min(proteinLengthsArr);

% Display number of protein segments, average, maximum, and minimum
fprintf('\nTotal Protein-Coding Segments: %i\n', numProteins)
fprintf('Average Length: %.2f\n', average);
fprintf('Maximum Length: %i\n', maximum);
fprintf('Minimum Length: %i\n', minimum);
%=====================================================================