function FinalProjectMVP(a,d)
  A = xlsread(a);
  D = xlsread(d);
  
  B = A; %linear
  totalcases1 = A(1,2);
  totaldeaths1 = A(1,3);
  %Country 2
  E = D;
  totalcases2 = D(1,2);
  totaldeaths2 = D(1,3);
  
  for i = 2:28,
    %Country 1
    B(i,2) += totalcases1;
    B(i,3) += totaldeaths1;
    totalcases1 = B(i,2);
    totaldeaths1 = B(i,3);
    
    %Country 2
    E(i,2) += totalcases2;
    E(i,3) += totaldeaths2;
    totalcases2 = E(i,2);
    totaldeaths2 = E(i,3);
  endfor
  
  %Figure 2: Linear Plotting for Country 1 and Country 2
  figure (1);
  X = [B(:,2), B(:,3), E(:,2), E(:,3)];
  plot(A(:,1),X)
  legend('total cases (Country 1)','total deaths (Country 1)', 'total cases (Country 2)', 'total deaths (Country 2)')
  title("Country 1's and Country 2's Total New Cases and Total New Deaths in May (Linear)");
  xlabel ("Date in May");
  ylabel ("Number of People");
  
  
  %Figure 2: Scatter plotting for Country 1 and Country 2
  figure (2);
  %Country 1
  %new cases subplot
  subplot (2, 2, 1)
  scatter (A(:,1), A(:,2), 'o');
  legend('cases per day(Country 1)');
  title("Country 1 Daily New Cases");
  xlabel ("Date in May");
  ylabel ("Number of People");
  %new deaths subplot
  subplot(2,2,2)
  scatter(A(:,1),A(:,3), 'r');
  legend('deaths per day(Country1)');
  title("Country 1 Daily New Deaths");
  xlabel("Date in May");
  ylabel("Number of People");
  %Country 2
  %new cases subplot
  subplot (2, 2, 3)
  scatter (D(:,1), D(:,2), 'o');
  legend('cases per day(Country 2)');
  title("Country 2 Daily New Cases");
  xlabel ("Date in May");
  ylabel ("Number of People");
  %new deaths subplot
  subplot(2,2,4)
  scatter(D(:,1),D(:,3), 'r');
  legend('deaths per day(Country2)');
  title("Country 2 Daily New Deaths");
  xlabel("Date in May");
  ylabel("Number of People");
  
  %Figure 2: Linear Plotting for Country 1 and Country 2
  %Calculating the total number of cases and deaths for the two countries
 
  %Figure 3: The lines of best fit for the points
  %figure (3);
  %plot(A(:,1), A(:,2))
  %grid on
  %hold on
  %xlabel('Day of May');
  %ylabel('Number of People');
  
  %Y = A(:,2)';
  %X = A(:,1)';
  
  %H = [ones(length(Y),1), X, X.^2];
  
  %Astar = inv(H' * H)*H'*Y;
  %Ytilde = H*Astar;
  %plot(X<Ytilde, 'r-', 'LineWidth', 2)
  
endfunction