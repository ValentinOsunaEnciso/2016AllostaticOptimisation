%% Allostatic Optimization, v37a, Valentin Osuna-Enciso, CUCEI-UDG, CIC-IPN
%  Agosto, Septiembre, Octubre, 2012
% ap=[110,105,111,107,102,109,127,116,108,107,99,109,105,109.5,113,110,91,119,114,108,102,100,109.5,110.2,118,82,79,98,90,89.9,88,90.1,79.6,79.8,91,149,91,97,98,96,93,79,129,112,99,99.5,109,110,122,108,106,109,109.2,106.8,113.1,101,110,107,90.2,104.1,100.3,99.2,90.1,100,90.2,100.1,90.3,90.1,94,92,121,116,120.6,90.8,110,140,0,0,0,100,98.7,100.3,90.5,128,130,82,100.1,100.3,150,72,78,69,70.1,65,66,70.1,64,70,76,72,71,69,79,69,78,68,69,75,69,68,69,65,69,70,90,60,60,60,55,52,51,56,70,68,72,80,80,71,75,74,66,74,67,79,78,70,77,78,69,79,78,80,71,80,72,90,83,136,132,150,132,140,129,141,131,149,131.2,139,148,121,149.5,130,122,141];
function fsb=AllostaticOptimization(f,d,mefo)   
%   [L, d]=INICIA(f,d); %Function parameters  
%   rng('shuffle');
%   %% 0 Parameters:
%   Ns=10; psi=1e-5; S=[]; fS=[];
%   %% 1 Population initial and Allostasis of S:
%   for i=1:Ns
%     S(i,:)=L(1,:)+(L(2,:)-L(1,:)).*rand(1,d);  
%     fS(i,1)=FUNCION(S(i,:),d,f);
%   end
%   [fsb,in]=min(fS); sb=S(in,:); efo=Ns; 
%   for ind1=1:d
%     a(1,ind1)=mean(S(1:round(Ns/5),ind1));
%   end
  %[CONVERGENCIA,fsb,sb,efo]=AOmasPrediccion_cec13(d,mefo,f);
  [CONVERGENCIA,fsb,sb,efo]=AOmasPrediccion_v1(d,mefo,f);
  %plot(CONVERGENCIA(1:end),'r','LineWidth',2),figure
  %plot(sb,'r','LineWidth',2)%, hold on, plot(a,'r')
  %end
end %function