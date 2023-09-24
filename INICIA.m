function [range,d]=INICIA(funcion,d)
range=[];
switch (funcion)
      case 1    % Rosenbrock, f*(1,...,1)=0, UNIMODAL, 
          for i1=1:d
            range=[range,[-5;10]];       
          end
          optimo=0;
      case 2    % Ackley, f*(0,...,0)=0,  MULTIMODAL,
          for i1=1:d
            range=[range,[-15;30]];       
          end
          optimo=0;
      case 3    % Dixon and Price, f*()=0
          for i1=1:d
            range=[range,[-10;10]];       
          end
          optimo=0;
      case 4    % Griewank f*(0,...,0)=0
          for i1=1:d
            range=[range,[-600;600]];       
          end
          optimo=0;
      case 5    % Levy f*(1,...,1)=0
          for i1=1:d
            range=[range,[-10;10]];       
          end
          optimo=0;
      case 6    % Sphere f*(0,...,0)=0
          for i1=1:d
            range=[range,[-100;100]];       
          end
          optimo=0;
      case 7    % Schwefel 2.26 f*(420.9687,...,420.9687)=-418.9828*d
          for i1=1:d
            range=[range,[-500;500]];       
          end
          optimo=-420.9687*d;
      case 8    % Zakharov f*(0,...,0)=0
          for i1=1:d
            range=[range,[-5;10]];       
          end
          optimo=0;
      case 9    % Sum squares f*(0,...,0)=0
          for i1=1:d
            range=[range,[-10;10]];       
          end
          optimo=0;
      case 10   % Rastrigin f*(0,...,0)=0
          for i1=1:d
            range=[range,[-5.12;5.12]];       
          end
          optimo=0;
      case 11   % Powell f*(3,-1,0,1, …, 3,-1,0,1)= 0.
          for i1=1:d
            range=[range,[-4;5]];       
          end
          optimo=0;
%       case 12   % Perm f*(1, 2,…, n) = 0.
%           for i1=1:d
%             range=[range,[-d;d]];       
%           end
%           optimo=0;
%       case 12   % Michalewics f*()=-9.66015, d=10
%           d=10;
%           for i1=1:d
%             range=[range,[0;pi]];       
%           end
%           optimo=-9.66015; 
      case 12   % Quartic Function i.e. Noise
          for i1=1:d
            range=[range,[-1.28;1.28]];       
          end
          optimo=0;
      case 13   % Step Function, f*()=0
          for i1=1:d
            range=[range,[-100;100]];       
          end
          optimo=0;
      case 14   % Schwefel 2.22
          for i1=1:d
            range=[range,[-10;10]];       
          end
          optimo=0;
      case 15   % Schwefel 1.2
          for i1=1:d
            range=[range,[-100;100]];       
          end
          optimo=0;
      case 16   % Schwefel 2.21
          for i1=1:d
            range=[range,[-100;100]];       
          end
          optimo=0; 
      case 17   %Penalized 1
          for i1=1:d
            range=[range,[-50;50]];       
          end
          optimo=0;
      case 18   %Penalized 2
          for i1=1:d
            range=[range,[-50;50]];       
          end
          optimo=0;   
%       case 20   %Shekel's foxholes, d=2
%           d=2;
%           for i1=1:d
%             range=[range,[-65.5;65.5]];       
%           end
%           optimo=1; 
%       case 21   %Nowalick's function, d=4
%           d=4;
%           for i1=1:d
%             range=[range,[-5;5]];       
%           end
%           optimo=0.0003075;
%       case 22   %Six Hump Camel Back, d=2
%           d=2;
%           for i1=1:d
%             range=[range,[-5;5]];       
%           end
%           optimo=-1.0316285;
%       case 23   %Goldstein&Price, d=2
%           d=2;
%           for i1=1:d
%             range=[range,[-2;2]];       
%           end
%           optimo=3;   
%       case 24   %Hartman's 1, d=3
%           d=3;
%           for i1=1:d
%             range=[range,[0;1]];       
%           end
%           optimo=-3.86; 
%       case 25   %Hartman's 2, d=6
%           d=6;
%           for i1=1:d
%             range=[range,[0;1]];       
%           end
%           optimo=-3.32;  
%       case 26   %Shekel's 1, d=4
%           d=4;
%           for i1=1:d
%             range=[range,[0;10]];       
%           end
%           optimo=-10.1532; 
%       case 27   %Shekel's 2, d=4
%           d=4;
%           for i1=1:d
%             range=[range,[0;10]];       
%           end
%           optimo=-10.4028;
%       case 28   %Shekel's 3, d=4
%           d=4;
%           for i1=1:d
%             range=[range,[0;10]];       
%           end
%           optimo=-10.5363; 
      case 19   %Salomon
          for i1=1:d
            range=[range,[-100;100]];       
          end
          optimo=0; 
      case 20   %Rotated hyper-ellipsoid
          for i1=1:d
            range=[range,[-100;100]];       
          end
          optimo=0;
      case 21   %Alpine
          for i1=1:d
            range=[range,[-10;10]];       
          end
          optimo=0;  
%       case 32   %Branin
%           d=2;
%           for i1=1:d
%             range=[range,[-5;15]];       
%           end
%           optimo=0.397887;    
%       case 33   %Easom
%           d=2;
%           for i1=1:d
%             range=[range,[-100;100]];       
%           end
%           optimo=-1;    
%       case 34   %Shubert
%           d=2;
%           for i1=1:d
%             range=[range,[-10;10]];       
%           end
%           optimo = -186.7309;  
%       case 35 % Design of a Gear Train
%           d=4;
%           for i1=1:d
%             range=[range,[12;60]];       
%           end
%           optimo=2.7e-12;     
%       case 36   %Tripod
%           d=2;
%           for i1=1:d
%             range=[range,[-100;100]];       
%           end
%           optimo=0;     
%       case 38     %Power sum
%           range=[0,d]; optimo=0;
      case 22 %Hyper Ellipsoid
          for i1=1:d
            range=[range,[-1;1]];       
          end
          optimo=0;
          
end
end