function mucho
   %rng('shuffle');
   %funca=[35,2,3,4,5,6,7,8,9,10,11,14,15,16,17,18,19,20,30,31,32];  
   %rand('state',sum(100*clock)) % create a random seed
   d=100; pvalues=[]; cont=10; statistics=[]; mefo=100000; 
  for i=1:2
      bestsofar=[];
   for j=1:cont %No de funcion
       tic
       bestsofar(j,1)=AllostaticOptimization(i,d,mefo);
       bestsofar(j,5)=toc;
       tic
       bestsofar(j,2)=ABC(i,d,mefo);
       bestsofar(j,6)=toc;
       tic      
       bestsofar(j,3)=DE(i,d,mefo);
       bestsofar(j,7)=toc;
       tic
       bestsofar(j,4)=PSO(i,d,mefo);       
       bestsofar(j,8)=toc;
   end
   cont=cont+1;
   b=bestsofar(:,2);%(bestsofar(:,2)-min(bestsofar(:,2)))./(max(bestsofar(:,2))-min(bestsofar(:,2)));
   c=bestsofar(1:end-1,3);%(bestsofar(:,3)-min(bestsofar(:,3)))./(max(bestsofar(:,3))-min(bestsofar(:,3)));
   dd=bestsofar(1:end-2,4);%(bestsofar(:,4)-min(bestsofar(:,4)))./(max(bestsofar(:,4))-min(bestsofar(:,4)));
   b=ranksum(bestsofar(:,1),b,'tail','left');
   c=ranksum(bestsofar(1:end-1,1),c,'tail','left');
   dd=ranksum(bestsofar(1:end-2,1),dd,'tail','left');
   f=bestsofar(:,6);%(bestsofar(:,2)-min(bestsofar(:,2)))./(max(bestsofar(:,2))-min(bestsofar(:,2)));
   g=bestsofar(1:end-1,7);%(bestsofar(:,3)-min(bestsofar(:,3)))./(max(bestsofar(:,3))-min(bestsofar(:,3)));
   h=bestsofar(1:end-2,8);%(bestsofar(:,4)-min(bestsofar(:,4)))./(max(bestsofar(:,4))-min(bestsofar(:,4)));
   f=ranksum(bestsofar(:,5),f,'tail','left');
   g=ranksum(bestsofar(1:end-1,5),g,'tail','left');
   h=ranksum(bestsofar(1:end-2,5),h,'tail','left');
   pvalues=[pvalues;b,c,dd,f,g,h]; 
   statistics=[statistics;mean(bestsofar(:,1)),std(bestsofar(:,1)),mean(bestsofar(:,2)),std(bestsofar(:,2)),mean(bestsofar(:,3)),std(bestsofar(:,3)),mean(bestsofar(:,4)),std(bestsofar(:,4)),mean(bestsofar(:,5)),std(bestsofar(:,5)),mean(bestsofar(:,6)),std(bestsofar(:,6)),mean(bestsofar(:,7)),std(bestsofar(:,7)),mean(bestsofar(:,8)),std(bestsofar(:,8))];
%      statistics=[statistics;mean(bestsofar(:,1)),std(bestsofar(:,1))];
  end
  savefile = 'corrida09MAYO2014v9c1.mat';
  save(savefile, 'pvalues', 'statistics');
end