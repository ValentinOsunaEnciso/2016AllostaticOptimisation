function best=PSO(funcion,d,mefo)
%[ best,bestposition,BestChart,MeanChart ] = mypso( @Schwefel,[-500 500 -500 500],2,2,50,200,2,1,1 )
%   Detailed explanation goes here
% %% variables
% popSiz=10;%poblacion
% iterMax=20;%generaciones
% d=2;%dimencion
% range=[-2 2 -2 2];%rango
% alpha=2;
% betha=2;
%% varibles algoritmo
%clear all
%format long
%funca=[1,2,3,4,5,6,7,8,9,10,11,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37];
%   funca=[1,2,3,4,5,6,7,8,9,10,11,14,15,16,17,18,19,20,30,31,32]; %21,d=10,30,50
%for inddd=10:10
%corridas=[];
for indd=1:1
maxIter=2000; popSiz=50; EvalFO=0;
%funcion=funca(inddd); d=100; 
[r,d]=INICIA(funcion,d);alpha=1.8; betha=1.8;
  %x=inipop(range,popSiz,d );
  %x=r(1)+(r(2)-r(1)).*rand(popSiz,d);  
  gbest=zeros(popSiz,d);%mejor global
  v=zeros(popSiz,d);
  fitness=zeros(popSiz,1);
  newfitness=zeros(popSiz,1);
  %create the best so far chart and average fitnesses chart.
  BestChart=[];MeanChart=[];
  %encontrando al mejor 
for i=1:popSiz
    x(i,:)=r(1,:)+(r(2,:)-r(1,:)).*rand(1,d);
    fitness(i,1)=FUNCION(x(i,:),d,funcion); EvalFO=EvalFO+1;
end
lbest=x;%mejor individual
[gbestfitness,IX] = sort(fitness);%gbestfitness fitnes de la mejor
for i=1:popSiz
    gbest(i,:)=x(IX(1),:);
end
best=gbestfitness(1);%guardando la megor iteracion
bestposition=x(IX(1),:);%guandando la mejor posicion
BestChart=best;
MeanChart=mean(fitness); k=1;
%inicia el ciclo
while EvalFO<mefo%k<maxIter k<=maxIter
    %velocidad nueva
    v=0.6*v+alpha*rand(popSiz,d).*(gbest-x)+betha*rand(popSiz,d).*(lbest-x);%w=(k/iterMax);
    v=limx(v,r,popSiz,d);
    %calculando nueva locacion
    x=x+v;
    %revisando limites
    x=limx(x,r,popSiz,d);
    %evaluando nueva locacion
    for i=1:popSiz
        newfitness(i,1)=FUNCION(x(i,:),d,funcion); EvalFO=EvalFO+1;
        %encontrando la mejor para cada particula
        if newfitness(i,1)<fitness(i,1)
            lbest(i,:)=x(i,:);
            fitness(i,1)=newfitness(i,1);
        end
    end    
    %encontrando la mejor global
    [minfitness,IX] = sort(newfitness);
    if minfitness(1)<best       
        for i=1:popSiz
            gbest(i,:)=lbest(IX(1),:);
        end
         best=minfitness(1);
         bestposition=lbest(IX(1),:);
    end
    % the best so far chart and average fitnesses chart.
    BestChart=[BestChart best];
    MeanChart=[MeanChart mean(newfitness)];
    %fprintf('Iter:%d, Best: %.3e, EvalFO=%d\n',k,best(1,1),EvalFO)
    k=k+1;
end
%semilogy(BestChart,'-.k','LineWidth',2)
corridas(indd)=best(1,1);
%fprintf('Corrida:%d, Best: %.3e, EvalFO=%d\n',indd,best(1,1),EvalFO)
end
%fprintf('PSO:Funcion:%d,Media:%.3e (%.3e),Iter:%d\n',funcion,mean(corridas),std(corridas),k)
%end
end

