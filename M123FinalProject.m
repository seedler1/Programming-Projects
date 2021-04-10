%MATH 123 (Probability and Statistics II) Final Project
%Jennifer Chun
%6/11/20
%Objective: Check numerical work and generate graphs for my final project (applying different Hypothesis Tests)
%->Hypothesis Test: Choosing a null hypothesis (a specific value) and using p-values to determine whether the data is with the null hypothesis; if not, it is in the alternative hypothesis (a broad range of values that aren't in the null hypothesis)
%Data: Sample sets of the number of emails before and after the official start of the Santa Clara County Shelter-in-Place (March 16th, 2020 at 12 AM)
%Emails sorted in five categories:
%-Total number of emails
%-School emails (student body, school administration, club emails)
%-Handshake (student-job networking website) emails
%-"Spam"
%-All other emails (daily prayer emails, etc.)

%Program Installation Requirements:
%-GNU Octave (GUI)
%-Octave Statistics Package, found at https://octave.sourceforge.io/statistics/

%~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
%All sample days randomly selected by a number generator created by Octave on a separate Octave filesort (randperm(n,k))
%First random sample: Jan 4th - March 15th 2020
%Second random sample: March 16th - May 25th 2020
%Both random samples have 50 days within the time intervals


%B : Before March 16th 12 AM
B_total = [32 33 23 38 25 25 17 29 27 15 17 16 9 18 9 13 16 24 18 24 13 7 20 26 8 27 10 13 27 18 23 10 10 34 8 38 17 20 23 29 9 32 20 10 19 19 23 26 27 9 16]  ;
B_school = [12 17 15 21 15 14 11 24 15 7 11 3 4 10 3 6 8 12 9 14 6 3 13 15 4 13 6 6 12 13 9 6 6 24 5 23 10 13 15 19 5 16 7 6 11 10 15 20 11 3 11];
B_handshake = [7 7 3 6 1 3 1 0 2 1 1 4 0 1 0 0 1 2 2 2 0 0 1 1 0 5 0 0 5 1 4 0 0 2 0 6 0 0 1 2 2 7 3 0 2 2 2 1 7 0 1];
B_spam = [5 3 1 4 3 3 3 3 6 2 2 4 0 2 0 1 2 4 4 4 2 1 2 2 2 4 1 2 4 1 4 0 0 3 1 3 3 2 2 2 5 5 1 3 3 2 1 5 2 1];
B_other = [8 6 4 7 6 5 2 2 4 5 3 5 5 5 6 8 5 6 3 4 5 3 5 8 2 5 3 5 6 3 6 4 4 5 2 6 4 5 5 6 2 4 5 3 3 4 4 4 4 4 3];

%A : After March 16th 12 AM
A_total = [20 22 14 16 14 8 3 16 12 11 12 24 19 21 7 19 8 19 16 29 7 25 29 22 18 7 29 23 21 20 25 7 18 18 20 24 22 11 18 26 35 22 20 16 17 15 18 24 24 10];
A_school = [12 12 8 9 7 3 2 6 2 4 6 14 10 9 3 8 2 8 8 16 3 15 17 12 8 2 16 11 12 9 15 3 10 13 11 7 12 7 11 15 28 10 9 11 12 7 11 10 13 4];
A_handshake = [2 1 0 0 0 0 0 2 2 0 0 1 1 2 0 2 1 2 1 2 0 2 1 2 1 0 2 2 1 1 4 0 4 2 0 2 1 0 0 2 0 0 3 1 0 1 1 1 1 0];
A_spam = [3 2 3 3 3 3 0 3 5 5 3 5 5 9 2 5 2 5 5 4 2 5 4 6 3 2 5 4 3 5 2 1 1 1 4 9 5 3 3 5 3 10 5 2 4 3 4 10 8 5];
A_other = [3 7 3 4 4 2 1 5 3 2 3 4 3 1 2 4 3 4 2 7 2 3 7 2 6 3 6 6 5 5 4 3 3 2 5 6 4 1 4 4 4 2 3 1 1 4 2 3 2 1];

%N : Number of day (only applies to after data)
N = [1 2 3 4 5 6 7 8 9 0 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40 41 42 43 44 45 46 47 48 49 50]
%~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
%Initial Calculations 
%(Sums)
 B_total_sum = 0;
 B_school_sum = 0;
 B_handshake_sum = 0;
 B_spam_sum = 0;
 B_other_sum = 0;
 A_total_sum = 0;
 A_school_sum = 0;
 A_handshake_sum = 0;
 A_spam_sum = 0;
 A_other_sum = 0;

 for i = 1:50,
    B_total_sum += B_total(i);
    B_school_sum += B_school(i);
    B_handshake_sum += B_handshake(i);
    B_spam_sum += B_spam(i);
    B_other_sum += B_other(i);
    A_total_sum += A_total(i);
    A_school_sum += A_school(i);
    A_handshake_sum += A_handshake(i);
    A_spam_sum += A_spam(i);
    A_other_sum += A_other(i);
 endfor
 %Outputting all values
B_total_sum
B_school_sum 
B_handshake_sum
B_spam_sum
B_other_sum 
A_total_sum 
A_school_sum 
A_handshake_sum
A_spam_sum
A_other_sum

%(Mean Values)
B_total_mean = nanmean(B_total)
B_school_mean = nanmean(B_school)
B_handshake_mean = nanmean(B_handshake)
B_spam_mean = nanmean(B_spam)
B_other_mean = nanmean(B_other)
A_total_mean = nanmean(A_total)
A_school_mean = nanmean(A_school)
A_handshake_mean = nanmean(A_handshake)
A_spam_mean = nanmean(A_spam)
A_other_mean = nanmean(A_other)

%(Standard Deviation)
B_total_std = std(B_total)
B_school_std = std(B_school)
B_handshake_std = std(B_handshake)
B_spam_std = std(B_spam)
B_other_std = std(B_other)
A_total_std = std(A_total)
A_school_std = std(A_school)
A_handshake_std = std(A_handshake)
A_spam_mean = nanmean(A_spam)
A_other_mean

%Hypothesis Tests
%Least Squares Test

%Total Emails 
O = ones(50,1) ;
P = N';
Q =  A_total'; 
fprintf("Testing Least Squares Test For Total Emails:  ");
X = [O P];
Y =  Q;
NCOMP = 1;
[XLOADINGS,YLOADINGS,XSCORES,YSCORES,COEFFICIENTS,FITTED] = plsregress(X,Y,NCOMP);
b0 = COEFFICIENTS(1)
b1 = COEFFICIENTS(2)
COEFFICIENTS

figure(1)
x = 0:0.1:50;
plot(x, (b1*-(51/2) + A_total_mean + b1*x), A_total);
title("Least Squares for Total Emails During Sheltering");

%School Emails
 
O = ones(50,1) ;
P = N';
Q =  A_school'; 
fprintf("Testing for Least Squares Test For School Emails:  ");
X = [O P];
Y =  Q;
NCOMP = 1;
[XLOADINGS,YLOADINGS,XSCORES,YSCORES,COEFFICIENTS,FITTED] = plsregress(X,Y,NCOMP);
b0 = COEFFICIENTS(1)
b1 = COEFFICIENTS(2)
COEFFICIENTS

figure(2)
x = 0:0.1:50;
plot(x, (b1*-(51/2) + A_school_mean + b1*x), A_school);
title("Least Squares for School Emails During Sheltering");
%plot(N,A_school,A_handshake,A_spam,A_other, A_total)
%plot(N,A_total)



%Spam Emails  
O = ones(50,1) ;
P = N';
Q =  A_spam'; 
fprintf("Testing for Least Squares Test For Spam Emails:  ");
X = [O P];
Y =  Q;
NCOMP = 1;
[XLOADINGS,YLOADINGS,XSCORES,YSCORES,COEFFICIENTS,FITTED] = plsregress(X,Y,NCOMP);
b0 = COEFFICIENTS(1)
b1 = COEFFICIENTS(2)
COEFFICIENTS

figure(3)
x = 0:0.1:50;
plot(x, (b1*-(51/2) + A_spam_mean + b1*x), A_spam);
title("Least Squares for Spam Emails During Sheltering");
%plot(N,A_spam)

