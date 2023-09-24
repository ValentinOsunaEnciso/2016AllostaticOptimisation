%% BENCHMARK FUNCTIONS: %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function y = FUNCION(x,n,numF)
  switch (numF)
    case 1 %% Rosenbrock function 
        sum = 0;
        for j =1:n-1
            sum = sum+100*(x(j+1)-x(j)^2)^2+(x(j)-1)^2;
        end
        y = sum;
    case 2 %% Ackley function
        a = 20; b = 0.2; c = 2*pi;
        s1 = 0; s2 = 0;
        for i=1:n
        s1 = s1+x(i)^2;
        s2 = s2+cos(c*x(i));
        end
        y = -a*exp(-b*sqrt(1/n*s1))-exp(1/n*s2)+a+exp(1);
    case 3 %% Dixon and Price function
        s1 = 0;
        for j = 2:n
            s1 = s1+j*(2*x(j)^2-x(j-1))^2;    
        end
        y = s1+(x(1)-1)^2; 
    case 4 %% Griewank function.      
        fr = 4000;
        s = 0;
        p = 1;
        for j = 1:n; s = s+x(j)^2; end
        for j = 1:n; p = p*cos(x(j)/sqrt(j)); end
        y = s/fr-p+1;
    case 5 %% Levy
        for i = 1:n; z(i) = 1+(x(i)-1)/4; end
        s = sin(pi*z(1))^2;
        for i = 1:n-1
            s = s+(z(i)-1)^2*(1+10*(sin(pi*z(i)+1))^2);
        end 
        y = s+(z(n)-1)^2*(1+(sin(2*pi*z(n)))^2);
    case 6 %% Sphere
        s = 0;
        for j = 1:n
            s = s+x(j)^2; 
        end
        y = s;
    case 7 %% Schwefel 2.26
        a=-x.*sin(sqrt(abs(x)));
        %s = sum(a);
        s=0;
        for ind1=1:n
            s=s+a(ind1);
        end
        y = s;
    case 8 %% Zakharov
        s1 = 0;
        s2 = 0;
        for j = 1:n
            s1 = s1+x(j)^2;
            s2 = s2+0.5*j*x(j);
        end
        y = s1+s2^2+s2^4;         
    case 9 %% Sum squares
        s = 0;
        for j = 1:n  
            s=s+j*x(j)^2; 
        end
        y = s;
    case 10 %% Rastrigin
        s = 0;
        for j = 1:n
            s = s+(x(j)^2-10*cos(2*pi*x(j))); 
        end
        y = 10*n+s;
    case 11 %% Powell
        m = n;
        for i = 1:m/4
            fvec(4*i-3) = x(4*i-3)+10*(x(4*i-2));
            fvec(4*i-2) = sqrt(5)*(x(4*i-1)-x(4*i));
            fvec(4*i-1) = (x(4*i-2)-2*(x(4*i-1)))^2;
            fvec(4*i)   = sqrt(10)*(x(4*i-3)-x(4*i))^2;
        end;
        fvec = fvec';
        y = norm(fvec)^2;
%       case 12 %% Perm 
%         b = 0.5;
%         s_out = 0;
%         for k = 1:n;
%             s_in = 0;
%             for j = 1:n
%                 s_in = s_in+(j^k+b)*((x(j)/j)^k-1);
%             end
%             s_out = s_out+s_in^2;
%         end
%         y = s_out;  
%       case 12 %% Michalewikz, d=10;
%           m = 10;
%             s = 0;
%             for i = 1:n
%                 s = s+sin(x(i))*(sin(i*x(i)^2/pi))^(2*m);
%             end
%             y = -s;
       case 12 %% Quartic function
            s=0;
            for ind1=1:n
               s=s+(ind1*(x(ind1)^4)); 
            end
            y=s+rand();
      case 13 %% Step function
          s=0;
          for ind1=1:n
               s=s+(x(ind1)+0.5)^2; 
          end
          y=s;
      case 14 %% Schwefel 2.22
          s1=0;s2=1;
          for ind1=1:n
               s1=s1+abs(x(ind1)); 
               s2=s2*abs(x(ind1)); 
          end
          y=s1+s2;
      case 15 %% Schwefel 1.2
          s1=0;
          for ind1=1:n
              s2=0;
              for ind2=1:ind1
                  s2=s2+x(ind2)^2;
              end
              s1=s1+s2;
          end
          y=s1;
      case 16 %% Schwefel 2.21
          y=max(abs(x));
      case 17 %% Penalized 1
          s1=0; s2=0;
          for ind1=1:n-1
             s1=s1+(((x(ind1)+1)/4)^2)*(1+10*(0.5-0.5*cos(2*pi*(1+((x(ind1+1)+1)/4))))); 
          end
          s1=(pi/n)*(s1+(10*(0.5-0.5*cos(2*pi*(1+((x(1)+1)/4)))))+((((x(end)+1)/4)))^2);
          for ind1=1:n
              if x(ind1)>10
                  s2=s2+100*(x(ind1)-10)^4;
              elseif x(ind1)<10 && x(ind1)>-10
                  s2=s2+0;
              elseif x(ind1)<-10
                  s2=s2+100*(-x(ind1)-10)^4;
              end
          end
          y=s2+s1; 
      case 18 %% Penalized 2
          s1=0; s2=0;
          for ind1=1:n
             s1=s1+(x(ind1)-1)^2*(1+(0.5-0.5*cos(2*(3*pi*x(ind1)+1)))); 
          end
          s1=0.1*(s1+(0.5-0.5*cos(2*(3*pi*x(1))))+((x(n)-1)^2)*(1+(0.5-0.5*cos(2*(2*pi*x(n))))));
          for ind1=1:n
              if x(ind1)>5
                  s2=s2+100*(x(ind1)-5)^4;
              elseif x(ind1)<5 && x(ind1)>-5
                  s2=s2+0;
              elseif x(ind1)<-5
                  s2=s2+100*(-x(ind1)-5)^4;
              end
          end
          y=s1+s2;
%       case 20 %Shekel's foxholes, d=2
%     a=[-32,-16,0,16,32,-32,-16,0,16,32,-32,-16,0,16,32,-32,-16,0,16,32,-32,-16,0,16,32;
%     -32,-32,-32,-32,-32,-16,-16,-16,-16,-16,0,0,0,0,0,16,16,16,16,16,32,32,32,32,32];
%           s1=0;
%           for ind1=1:25              
%               s2=0;
%               for ind2=1:n
%                  s2=s2+(x(ind2)-a(ind2,ind1))^6; 
%               end
%               s2=(1/(ind1+s2));
%               s1=s1+s2;
%           end
%           y=(s1+(1/500))^-1;
%       case 21 %Nowalick's, d=4
%           s=0;
%           a=[0.1957,0.1947,0.1735,0.1600,0.0844,0.0627,0.0456,0.0342,0.0323,0.0235,0.0246];
%           b=[0.25,0.5,1,2,4,6,8,10,12,14,16];
%           for ind1=1:11
%              s=s+(a(ind1)-(x(1)*((b(ind1)^2)+(b(ind1)*x(2)))/((b(ind1)^2)+(b(ind1)*x(3))+x(4))))^2;             
%           end
%           y=s;
%       case 22 %Six hump Camel back, d=2
%           y=4*x(1)^2-2.1*x(1)^4+(1/3)*x(1)^6+x(1)*x(2)-4*x(2)^2+4*x(2)^4;
%       case 23 %Goldstein&Price, d=2
%        y=(1+((x(1)+x(2)+1)^2)*(19-14*x(1)+(3*x(1)^2)-14*x(2)+6*x(1)*x(2)+...
%           (3*x(2)^2)))*(30+((2*x(1)-3*x(2))^2)*(18-32*x(1)+(12*x(1)^2)+...
%           48*x(2)-36*x(1)*x(2)+(27*x(2)^2)));
%       case 24 %Hartman 1, d=3
%           a=[3,10,30;0.1,10,35;3,10,30;0.1,10,35]; s2=0;
%           c=[1,1.2,3,3.2];
%           P=[0.3689,0.117,0.2673;0.4699,0.4387,0.7470;0.1091,0.8732,0.5547;
%               0.03815,0.5743,0.8828];
%           for ind1=1:4
%               s1=0;
%               for ind2=1:n
%                   s1=s1+a(ind1,ind2)*(x(ind2)-P(ind1,ind2))^2;
%               end
%               s2=s2+c(ind1)*exp(-s1);
%           end
%           y=-s2;
%       case 25 %Hartman's 2, for 6 dimensions
%           a=[10,3,17,3.5,1.7,8;0.05,10,17,0.1,8,14;3,3.5,17,10,17,8;17,8,0.05,10,0.1,14]; 
%           s2=0; c=[1,1.2,3,3.2];
%           P=[0.131,0.169,0.556,0.012,0.828,0.588;
%               0.232,0.413,0.830,0.373,0.1,0.999;
%               0.234,0.141,0.352,0.288,0.304,0.665;
%               0.404,0.882,0.873,0.574,0.109,0.038];
%           for ind1=1:4
%               s1=0;
%               for ind2=1:n
%                   s1=s1+a(ind1,ind2)*(x(ind2)-P(ind1,ind2))^2;
%               end
%               s2=s2+c(ind1)*exp(-s1);
%           end
%           y=-s2;
%       case 26 %sHEKEL'S 1, D=4
%           a=[4,4,4,4;1,1,1,1;8,8,8,8;6,6,6,6;3,7,3,7;2,9,2,9;5,5,3,3;
%               8,1,8,1;6,2,6,2;7,3.6,7,3.6];
%           c=[0.1,0.2,0.2,0.4,0.4,0.6,0.3,0.7,0.5,0.5]; s=0;
%           for ind1=1:5
%               s=s+((x-a(ind1,:))*(x-a(ind1,:))'+c(1,ind1))^-1;
%           end
%           y=-s;
%       case 27   %sHEKEL'S 2, D=4
%           a=[4,4,4,4;1,1,1,1;8,8,8,8;6,6,6,6;3,7,3,7;2,9,2,9;5,5,3,3;
%               8,1,8,1;6,2,6,2;7,3.6,7,3.6];
%           c=[0.1,0.2,0.2,0.4,0.4,0.6,0.3,0.7,0.5,0.5]; s=0;
%           for ind1=1:7
%               s=s+((x-a(ind1,:))*(x-a(ind1,:))'+c(1,ind1))^-1;
%           end
%           y=-s;   
%       case 28   %sHEKEL'S 3, D=4
%           a=[4,4,4,4;1,1,1,1;8,8,8,8;6,6,6,6;3,7,3,7;2,9,2,9;5,5,3,3;
%               8,1,8,1;6,2,6,2;7,3.6,7,3.6];
%           c=[0.1,0.2,0.2,0.4,0.4,0.6,0.3,0.7,0.5,0.5]; s=0;
%           for ind1=1:10
%               s=s+((x-a(ind1,:))*(x-a(ind1,:))'+c(1,ind1))^-1;
%           end
%           y=-s;  
      case 19 %Salomon
          s=0;
          for ind1=1:n
              s=s+x(ind1)^2;
          end
        y = -cos(2*pi*sqrt(s)) + 0.1*sqrt(s) + 1;   
      case 20 %Rotated hyper-ellipsoid
        sum2 = 0;
        for i = 1:1:n
            sum1 = 0;
            for j = 1:1:i
                sum1 = sum1 + x(j);
            end
            sum2 = sum2 + sum1^2;
        end
        y = sum2;  
      case 21 %Alpine
        sum1 = 0;
        for i=1:1:n
            sum1 = sum1 + abs(x(i)*sin(x(i)) + 0.1*x(i));
        end
        y = sum1;  
%       case 32 % Branin
%         y = (x(2)-(5.1/(4*pi^2))*x(1)^2+5*x(1)/pi-6)^2+10*(1-1/(8*pi))*cos(x(1))+10;  
%       case 33 % Easom
%         y = -cos(x(1))*cos(x(2))*exp(-((x(1) - pi)^2 + (x(2) - pi)^2));  
%       case 34 % Shubert
%         sum0 = 0;
%         sum1 = 0;
%         for j=1:1:5
%             sum0 = sum0 + j*cos((j+1)*x(1) + j);
%             sum1 = sum1 + j*cos((j+1)*x(2) + j);
%         end
%         y = sum0*sum1;  
%       case 35 % Gear Train    
%         z = floor(x);    
%         y = ((1/6.931) - ((z(1)*z(2))/(z(3)*z(4))))^2;    
%         for i = 1:4
%             if z(i) > 60 || z(i) < 12
%                 y = y + 1e6;
%             end
%         end  
%      case 36 % Tripod
%          if x(1) <= 0
%             sig_x1 = -1;
%         else
%             sig_x1 = 1;
%          end        
%         if x(2) <= 0
%             sig_x2 = -1;
%         else
%             sig_x2 = 1;
%         end        
%         y = 0.5*(1 - sig_x2)*(abs(x(1)) + abs(x(2) + 50));
%         y = y + 0.5*(1 + sig_x2)*((0.5*(1 - sig_x1))*(1 + abs(x(1) + 50) + abs(x(2) - 50)) + (0.5*(1 + sig_x1))*(2 + abs(x(1) - 50) + abs(x(2) - 50)));        
      case 22 %Hyper ellipsoid
        sum1 = 0;
        for i=1:1:n
            sum1 = sum1 + i^2*x(i)^2;
        end
        y = sum1;            
  end
end