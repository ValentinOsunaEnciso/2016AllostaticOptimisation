function [ x ] = limx( x,range,pop,n )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
% if n==2 %dos dimenciones
%     for ii=1:n
%         for i=1:pop
%             if x(i,ii)<range(2*ii-1)
%                 x(i,ii)=range(2*ii-1);
%             end
%             if x(i,ii)>range(2*ii)
%                 x(i,ii)=range(2*ii);
%             end            
%         end
%     end
%else %multidimencional
    for i=1:pop
        for ii=1:n
            if x(i,ii)<range(1)
                x(i,ii)=range(1);
            end
            if x(i,ii)>range(2)
                x(i,ii)=range(2);
            end   
        end
    end
%end

end

