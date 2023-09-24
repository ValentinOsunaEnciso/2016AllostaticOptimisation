%% Allostatic Optimization, vDIC11, Valentin Osuna-Enciso, CUCEI-UDG
%  Diciembre-2013, Marzo-2014
function [convergencia,fsb,sb,efo]=AOmasPrediccion_v1(D,mefo,f)
  convergencia=[];
  %% 0 Initialization of parameters:
  [L,D]=INICIA(f,D); %Function parameters   
  Ns=5; psi=1e-1; gr=5; k=1; %g1=3, g2=1, g3=1;
  %% 1 Generate initial population S and its adaptation fS:
  for i=1:Ns*gr
    S(i,:)=L(1,:)+(L(2,:)-L(1,:)).*rand(1,D);
    fS(i,1)=FUNCION(S(i,:),D,f);
  end  
  %%
  [temp, in1]=sort(fS); fS=temp;temp=S(in1(1:end),:);S=temp; sb=S(1,:);     
  fsb=fS(1); efo=i; %cont=1;   
  %%% Calcular x^prom y f(x^prom):
  for ind1=1:D
    a(1,ind1)=mean(S(1:Ns,ind1));
  end
  %fa=FUNCION(a,D,f); efo=efo+1; 
  
  %individuo=[]; temp=[];
  while efo<=mefo
      Bc=randperm(Ns*gr,Ns*gr); otro=1;  
      for ind1=1:Ns 
            %% 3 Create Mutant Individual,by only modifying 1 D:           
            sn=S(ind1,:); 
            m=(fS(Bc(1,ind1),1)-fS(ind1,1))./(sn-S(Bc(1,ind1),:));                            
            d=randi(D);
            sn(1,d)=S(Bc(1,ind1),d);  %Mutant 
            fsn=FUNCION(sn(1,:),D,f); efo=efo+1;    %Evaluation of mutant 
            %x=(1+(fS(Bc(1,ind1),1)*(sn-S(Bc(1,ind1),:)))/(fS(Bc(1,ind1),1)-fS(ind1,1)));
            if fsn<fS(ind1,1) %si f(x^mod)<f(X_i)                  
                b=fS(Bc(1,ind1),1)-m; 
                x=-b./m;                
                for i1=1:D 
                    if x(1,i1)<L(1,i1) 
                        if L(1,i1)==0
                            x(1,i1)=-sb(1,i1)*rand()*0.5;
                        else
                            x(1,i1)=sb(1,i1)*rand();%sb(1,i1)-abs(x(1,i1))*rand();
                        end
                    elseif x(1,i1)>L(2,i1)  
                       x(1,i1)=sb(1,i1)*rand();%sb(1,i1)+abs(x(1,i1))*rand();
                    elseif isnan(x(1,i1))
                       x(1,i1)=sb(1,i1)*rand();
                    elseif isinf(x(1,i1))
                       x(1,i1)=sb(1,i1)*rand();
                    end
                end
                fS(ind1,1)=fsn; S(ind1,:)=sn; 
                if fsn<fsb
                    a(1,d)=(sn(1,d)+sb(1,d)+a(1,d))/3;%a(1,d)=sn(1,d);
                    otro=0; 
                    %error=(fsb-fsn)/(fsb+fsn);                    
                    fsb=fsn;  
                    sb=sn; 
                    %mov=(psi*(1.3-(1/exp(psi.*(error))))); 
                    mov=psi.*x;
                    %%% CONFIGURACIÓN 3: %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%                  
                    for ind3=1*Ns+1:Ns*3 
                      if fS(ind3,1)>fsb   
                        S(ind3,:)=((sb-mov+(2*mov).*rand())+x)./2;
                        for i=1:D
                           if S(ind3,i)>L(2,i) || S(ind3,i)<L(1,i)
                              S(ind3,i)=((L(1,i)+(L(2,i)-L(1,i)).*rand())); 
                           end
                        end                        
                      end
                    end
                    for ind3=3*Ns+1:Ns*4
                      if fS(ind3,1)>fsb     
                        S(ind3,:)=((a-mov+(2*mov).*rand())+x)./2;
                        for i=1:D
                           if S(ind3,i)>L(2,i) || S(ind3,i)<L(1,i)
                              S(ind3,i)=((L(1,i)+(L(2,i)-L(1,i)).*rand())); 
                           end
                        end    
                        if rand()>0.5
                            fS(ind3,1)=FUNCION(S(ind3,:),D,f); efo=efo+1; %XXX
                        end
                      end
                    end                        
                    for ind3=4*Ns+1:Ns*5 
                        S(ind3,:)=a.*rand();  
%                         if rand()>0.5
%                             fS(ind3,1)=FUNCION(S(ind3,:),D,f); efo=efo+1; %XXX
%                         end
                    end                    
%                     if m(1,d)>0
%                         S(Bc(1,ind1),d)=sn(1,d)+rand()*psi;
%                     else
%                         S(Bc(1,ind1),d)=sn(1,d)-rand()*psi;
%                     end
                end
            else
                
            end    
            
      end   %for ind1=1:Ns
      %% 6 Modifying S:
      if otro==1
          %a=mean(S(1:Ns*gr,:));
          %fa=FUNCION(a,D,f); efo=efo+1; 
          for ind3=4*Ns:Ns*5 %6-7
            S(ind3,:)=((L(1,:)+(L(2,:)-L(1,:)).*rand(1,D)));              
          end           
      end      
      convergencia(k)=fsb;     
      %disp(sprintf('AO:Func:%d,EvalFO:%d,Best:%.6e\n',f,efo,fsb));
      k=k+1; 
  end %while 
  disp(sprintf('AO:Func:%d,EvalFO:%d,Best:%.6e\n',f,efo,fsb));
end


