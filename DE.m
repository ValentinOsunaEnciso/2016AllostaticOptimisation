%% Differential Evolution, best/1/bin, Valentin Osuna-Enciso, CUCEI-UDG,
% CIC-IPN, Septiembre, 2012
function Fitness_best=DE(funcion,d,mefo)
  %clear all
  %format long
%   funca=[1,2,3,4,5,6,7,8,9,10,11,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37];
  %funca=[1,2,3,4,5,6,7,8,9,10,11,14,15,16,17,18,19,20,30,31,32]; %21,d=10,30,50
  %for indd=1:21 %funcion
  %clear x x_best v u   
  %funcion=funca(indd); d=100; 
  [r,d]=INICIA(funcion,d); 
  corridas=[];
  for ind5=1:1 %corrida
  %INICIALIZACION DE: %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  Np=50;          %Tamano de la poblacion.90
  F=0.5;         %Factor de escalamiento .25
  Cr=0.9;         %Probabilidad de cruza .8
  %d=100;
  maxIter=2000;       %Numero maximo de iteraciones
  k=0;            %Contador de iteraciones
  %x=r(1)+(r(2)-r(1)).*rand(Np,d);
  for ind1=1:Np
%       for ind2=1:d
%          x(ind1,ind2)=r(1)+(r(2)-r(1)).*rand(); 
%       end
      x(ind1,:)=r(1,:)+(r(2,:)-r(1,:)).*rand(1,d); 
      Fitness(ind1)=FUNCION(x(ind1,:),d,funcion); 
  end
  EvaluacioneFO=Np;
  Fitness_best= Fitness(1); x_best=x(1,:);
  EvalFO=Np;
  while EvalFO<mefo%k<maxIter 
   for ind1=1:Np
       r1=randi(Np);r2=randi(Np);
       while(r1==r2==ind1)
          r1=randi(Np); r2=randi(Np);       %Generados sean diferentes.
       end
       v(1,:)=x_best+F*(x(r1,:)-x(r2,:));   %Mutacion
       u(1,:)=x(ind1,:);
       j_rand=randi(d);
       for ind2=1:d                         %Genero vector de prueba
          if(rand()<Cr || ind2==j_rand) && v(1,j_rand)>0     %Cruza
             u(1,j_rand)=v(1,j_rand);
          end
       end
       temp=FUNCION(u(1,:),d,funcion);
       if(temp<Fitness(ind1))
          x(ind1,:)=u(1,:);
          Fitness(ind1)=temp;
          if (temp<Fitness_best)
             x_best=u(1,:);
             Fitness_best=temp;
          end
       end
   end
   EvaluacioneFO=EvaluacioneFO+Np;
   k=k+1; EvalFO=EvalFO+Np;
   CONVERGENCIA(k)=Fitness_best;   
   %disp(sprintf('Iterac=%d, Fitnes=%e, Eval:%d\n',k,Fitness_best,EvaluacioneFO));   
  end
  %disp(sprintf('Corrida=%d, Fitnes=%e, Evaluaciones:%d\n',ind5,Fitness_best,EvaluacioneFO));
  %semilogy(CONVERGENCIA,':k','LineWidth',2)%,title('DE'),hold on,figure,bar(x_best,'k','LineWidth',2)
  corridas(ind5)=Fitness_best; 
  end
  %plot(CONVERGENCIA(1:k-1),'k','LineWidth',2),title('DE'),hold on,figure,bar(x_best,'k','LineWidth',2)
  %disp(sprintf('DE:Func:%d,EvalFO:%d,Best:%.3e\n',funcion,EvalFO,Fitness_best));
  %end
end
