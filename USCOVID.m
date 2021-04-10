%CS 169 Final Project: US COVID Cases
%Linnell
%By Jennifer Chun 
%6/4/20


%Program's Purposes: 
%-To look into the total number of cases and deaths in the US from Dec 31st 2019 to May 31st 2020
%-To plot the daily cases and deaths in the US from Dec 31st 2019 to May 31st 2020
%-To assess whether the Total Number of COVID-19 cases in the US is curving by comparing the Least Squares Equations of two datasets
%---data from April 1st to May 31st
%---data from May 1st to May 31st


%Learning Objectives:
%-Test the limitations of Octave's 2D plotting capabilities (including "animating" graphs)
%-Utilize Octave's ability to create and manipulate arrays and matrices 
%-Utilize some of the functions provided in Octave (matrix transposition, ones())
%-Utilize some of the functions in Octave's Statistics Package ( nanmax(), nanmean(), plsregress() *Partial Least Squares function*)


%Program-Running Requirements:
%-Octave IDE
%-Octave Statistics Package, found at https://octave.sourceforge.io/statistics/


%Data Obtained from EU Open Data Portal, accessed 5/31/20 
%https://data.europa.eu/euodp/en/data/dataset/covid-19-coronavirus-data/resource/55e8f966-d5c8-438e-85bc-c7a5a26f4863

%Outputing refers to outputing the data on the command window
%~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
%**Major Data Arrays Created for This Program**

%N = numbers array from 1 - 153 (representing Day 1 (Dec 31st 2019) to Day 153 (May 31st 2020))C = New Cases, D = New Deaths
N = [1	2	3	4	5	6	7	8	9	10	11	12	13	14	15	16	17	18	19	20	21	22	23	24	25	26	27	28	29	30	31	32	33	34	35	36	37	38	39	40	41	42	43	44	45	46	47	48	49	50	51	52	53	54	55	56	57	58	59	60	61	62	63	64	65	66	67	68	69	70	71	72	73	74	75	76	77	78	79	80	81	82	83	84	85	86	87	88	89	90	91	92	93	94	95	96	97	98	99	100	101	102	103	104	105	106	107	108	109	110	112	112	113	114	115	116	117	118	119	120	121	122	123	124	125	126	127	128	129	130	131	132	133	134	135	136	137	138	139	140	141	142	143	144	145	146	147	148	149	150	151	152	153];

%C = daily number of COVID cases in the US (index 1-153 reflects the Day number,(Dec 31st 2019) - (May 31st 2020))
% - Data from EU Open Data Portal
C = [0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	1	0	0	0	1	0	3	0	0	0	1	1	1	3	0	0	1	0	0	0	1	0	0	1	1	0	0	0	0	0	0	1	19	0	0	18	0	6	1	6	3	20	14	22	34	74	105	95	121	200	271	287	351	511	777	823	887	1766	2988	4835	5374	7123	8459	11236	8789	13963	16797	18695	19979	18360	21595	24998	27103	28819	32425	34272	25398	30561	30613	33323	33901	35527	28391	27620	25023	26922	30148	31667	30833	32922	24601	28065	37289	17588	26543	21352	48529	26857	22541	24132	27326	29917	33955	29288	24972	22593	23841	24128	28369	26957	25612	20258	18117	22048	20782	27143	25508	24487	18873	21841	19970	23285	25434	24147	21236	20568	19064	18910	18721	21817	25337	23297];

%D = daily number of COVID deaths in the US (index 1-153 reflects the Day number,(Dec 31st 2019) - (May 31st 2020))
% - Data from EU Open Data Portal
D = [0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	1	1	4	3	2	1	2	3	4	5	2	2	10	7	10	12	16	23	42	0	110	80	131	119	211	249	246	411	484	318	661	909	1059	915	1104	1344	1146	1342	1906	1922	1873	2087	1831	1500	1541	2408	4928	2299	3770	1856	1772	1857	2524	1721	3179	1054	2172	1687	1369	2110	2611	2040	2062	1317	1297	1252	2144	2353	2239	1510	1614	734	1156	1703	1746	1773	1662	1186	808	791	1568	1518	1263	1305	1080	633	500	696	1526	1175	1219	945];
%~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

%Part 1: Creating and manipulating a matrix of values to generate a matrix containing the total count of COVID cases and deaths from Day 1 (Dec 31st 2019) to Day i

fprintf("N : The array with the numbers 1 - 153, representing Day 1 - Day 153 (12/31/19-5/31/20)");
fprintf("C : The array with the number of daily COVID cases in the US on Day i, the index of C");
fprintf("D : The array with the number of daily COVID deaths in the US on Day i, the index of D");

  %Creating matrix B using the specially created arrays
  %Using matrix B to totaling up all the cases in the US over 1/1 to 5/31
  B(:,1) = N;
  B(:,2) = C;
  B(:,3) = D;
  
  %counters of total cases and deaths, initially set to the Day 1 value
  totalcases = B(1,2);
  totaldeaths = B(1,3);

  
  %Replacing the values of matrix B to generate a matrix containing the total cases in the second column and the total deaths in the third column
  for i = 2:153,
    %Country 1
    B(i,2) += totalcases;
    B(i,3) += totaldeaths;
    totalcases = B(i,2);
    totaldeaths = B(i,3);
  endfor
    
  %Outputs the number of total cases and total deaths
   fprintf("The total number of cases (Dec 31st 2019 to May 31st 2020): ");
   totalcases
   fprintf("The total number of deaths (Dec 31st 2019 to May 31st 2020): "); 
   totaldeaths
   
   
%Part 2: Generating a graph containing two different lines sharing the same x values
   
  %Figure 1: Total COVID Cases and Deaths from Day 1 (Dec 31st) to Day i
  figure (1);
  %----plotting both columns 2 and 3 of matrix B to the N array
  X = [B(:,2), B(:,3)];
  plot(B(:,1),X)
  %----setting the legend and the legend location
  legend('Total COVID Cases','Total COVID Deaths',"location","northwest");
  %----setting the title and labels of the graph
  title("Total  Cases and Total Deaths in the US (12/31/19 - 5/31/20) -- EU Open Data Portal");
  xlabel ("Day Number (12/31/19 = Day 1, 5/31/20 = Day 153)");
  ylabel ("Number of People");
  
 
%Part 3: Generating two scatterplots on the same figure by subplotting
  
  %Figure 2: Scatter plotting for Daily New Cases and Daily New Deaths 
  %Day 1 (Dec 31st) to Day 153 (May 31st)
  figure (2);
  
  %new cases subplot
  subplot (2, 1, 1)
  %---setting the color of the plots to orange
  scatter (N, C, 'o');
  legend('cases per day');
  title("Daily New Cases in the US (12/31/19 - 5/31/20)");
  xlabel ("Day Number (12/31/19 = Day 1, 5/31/20 = Day 153)");
  ylabel ("Number of People");
  
  %new deaths subplot
  subplot(2,1,2)
  %---setting the color of the plots to red
  scatter(N,D, 'r');
  legend('deaths per day)');
  title("Daily New Deaths in the US (12/31/19 - 5/31/20) -- EU Open Data Portal");
  xlabel("Day Number (12/31/19 = Day 1, 5/31/20 = Day 153)");
  ylabel("Number of People");

  
%Part 4: Calculating the max value of the new daily COVID cases and deaths and the days of the max values
%---using the nanmax function from the Statistics Package

%finding the max value of the C array , the daily number of cases array 
maxC = nanmax(C)

%finding the day when the max value of daily cases is reached and outputing the result
for maxic=1:153
  if C(maxic) == maxC
    break
  endif
endfor 
fprintf("The i when C has the highest value is ")
maxic

%finding the max value of the D array, the daily number of deaths array
maxD = nanmax(D)

%finding the day when the max value of daily deaths is reached and outputing the result
for maxid=1:153
  if C(maxid) == maxD
    break
  endif
endfor 
fprintf("The i when D has the highest value is ")
maxid

%outputs the mean values of arrays C and D respectively (daily number of cases and daily number of deaths)
meanC = nanmean(C)
meanD = nanmean(D)


%Part 5: Finding the slope of the line of least squares from the data from April 1st to May 31st
%-Least Squares Function

%Finding the day number of April 1st
  BegApril = 153 - 61

%generating a column array of 1's 
O = ones(153 - BegApril + 1,1) ;
%creating the arrays P and Q which hold the values of the number array N and the daily number of COVID cases array C
P = N(BegApril:153);
Q = C(BegApril:153);

fprintf("Testing for Least Squares Test with given daily data from the first day of April");
%Taking the transverse of array P and putting the O and P transverse column arrays into one matrix
X = [O P'];
%Taking the transverse of array Q
Y =  Q';
%NCOMP refers to the dimension of the desired Least Squares Function
NCOMP = 1;
%Using the Least Squares formula on matrix X and column array Y with the 1st dimension (a line)
[XLOADINGS,YLOADINGS,XSCORES,YSCORES,COEFFICIENTS,FITTED] = plsregress(X,Y,NCOMP);
%b1 is the slope of the Least Squares Test for April 1st to May 31st
b1 = COEFFICIENTS(2);
%the y-intercept of the Least Squares line for April 1st to May 31st
%--the median of the time from Apri1 1st - May 31st is taken into account for the intercept because the Least Squares makes calculations based on the median of the dataset
b1intercept = b1 * -(153 - BegApril + 1 + median(BegApril:153));
 

%Part 6: Graphing the Least Squares Line for data from April 1st to May 31st with Animation
%Figure 4: The line of best fit for the scatterplots using the Partial Least Squares Regression starting from the first day of April
figure(3)
%scatter (N, C, 'o');
hold on
%Finding the day when the Least Squares Line estimates when the daily number of cases will reach 0, "t1"
%The graph stops once the y-value of the graphed line has reached below 0
for t1 = 0:500  
  %"Animates" the plotting of the line by having there be a pause of .01 seconds between plotting each point
  %'*' makes different colored asterisks appear on the line graph
  plot(t1,b1 * t1 + b1intercept, '*');
  pause(.01)
  if b1 * t1 + b1intercept < 0
    break
  endif
endfor
hold off

%Outputing t1
fprintf("    If starting the SSE on the first day of April, there should be no more new COVID cases on Day ");
    t1
legend('cases per day');
title("Least Squares Test Estimate of Cases in the US with given daily data from the first day of April(12/31/19 - 5/31/20)");
xlabel ("Day Number (12/31/19 = Day 1, 5/31/20 = Day 153)");
ylabel ("Number of People");  
 

%Part 7: Finding the slope of the line of least squares from the data from May 1st to May 31st
%-Code is nearly identical to Part 5, but with BegMay instead of BegApril

%Find the day number of May 1st
  BegMay = 153 - 31
  
O = ones(153 - BegMay + 1,1) ;
P = N(BegMay:153);
Q = C(BegMay:153);
fprintf("Testing for Least Squares Test with given daily data from the first day of May");
X = [O P'];
Y =  Q';
NCOMP = 1;
[XLOADINGS,YLOADINGS,XSCORES,YSCORES,COEFFICIENTS,FITTED] = plsregress(X,Y,NCOMP);
%b2 is the slope of the Least Squares Test
b2 = COEFFICIENTS(2);
%the y-intercept of the Least Squares line
b2intercept = b2 * -(153 - BegMay + 1 + median(BegMay:153));


%Part 8: Finding the slope of the line of least squares from the data from May 1st to May 31st  
%-Code is nearly identical to Part 6, but with the least squares estimate from May 1st to May 31st instead of April 1st to May 31st

%Figure 4: The line of best fit for the scatterplots using the Partial Least Squares Regression starting from the first day of May
figure(4)
hold on
for t2 = 0:500  
  plot(t2,b2 * t2 + b2intercept, '*');
  pause(.01)
  if b2 * t2 + b2intercept < 0
    break
  endif
endfor
%Outputing t2
fprintf("    If starting the SSE on the first day of May, there should be no more new COVID cases on Day ");
    t2
legend('cases per day');
title("Least Squares Test Estimate of Cases in the US with given daily data from the first day of May(12/31/19 - 5/31/20)");
xlabel ("Day Number (12/31/19 = Day 1, 5/31/20 = Day 153)");
ylabel ("Number of People");   
hold off

%Part 9: Comparing the Estimated Days of no new cases for Figure 3 and Figure 4 to assess whether the total cases is curving
fprintf("  Based on the Least Squares test comparison of the daily number of COVID 19 cases from the EU Open Data Portal between Figure 3 and Figure 4, can we believe that the total cases of COVID-19 in the US is curving?   ");
%t1 - Estimated Day the Daily Cases reaches below 0 (April 1st- May 31st)
%t2 - Estimated Day the Daily Cases reaches below 0 (May 1st - May 31st)
%if t2 is smaller than t1, this means that the negative slope from Figure 4 is greater than Figure 3, implying that the total COVID cases in the US is curving
%if t2 is not smaller than t1, then the data is not curving
if t2 < t1
  fprintf(" Yes");
else
  fprintf(" No");
endif