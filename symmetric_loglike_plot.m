% symmetric_loglike_plot.m
%
% Landon Halloran, 21-Jul-2016
% github.com/lhalloran/symmetric_loglike_plot
%
% Log-like plot,symmetric about 50%, for percentage data with values close to 0 and 100%.
% Useful for plotting data where there is interest in values close to 0%
% and 100% such as cumulative particle-size distribution (grain-size analysis) data.
%
% This function takes: 
%   - x and y arrays of equal size, where y is an array of percentages >0 and <100. 
%   - ymin sets the min and max values of the y axis [ymin, 100-ymin]
% Returns:
%   - figure object of plot
% 
% Try it out with this command:
% symmetric_loglike_plot([1E-6,3E-6,1E-5,3E-5,1E-4,3E-4,1E-3,3E-3,1E-2],[0.00033,0.0042,2,16,50,72,98.7,99.8,99.998],1E-4);

function fg = symmetric_loglike_plot(x,y,ymin)
b=50/(log(50)-log(ymin));
a=-b*log(ymin);

%%%% mapping function...
Y=y-y;
for i=1:length(y)
    if y(i)<=50 && y(i)>0
        Y(i) = b*log(y(i))+a;
    elseif y(i)>50 && y(i)<100
        Y(i) = 100-b*log(100-y(i))-a;
    elseif y(i)<=0 || y(i)>=100
        disp('ERROR: Values out of range (0,100) detected. Please supply y values in percent.');
    end
end
%%%% Define tick labels on y axis:
yt = [1E-4,3E-4,1E-3,3E-3,1E-2,3E-2,1E-1,3E-1,1,3,5,10,25,50,75,90,95,97,99,99.7,99.9,99.97,99.99,99.997,99.999,99.9997,99.9999];
labels = strread(num2str(yt),'%s');
Yt=yt-yt;
for i=1:length(yt)
    if yt(i)<=50 && yt(i)>0
        Yt(i) = b*log(yt(i))+a;
    elseif yt(i)>50 && yt(i)<100
        Yt(i) = 100-b*log(100-yt(i))-a;
    end
end
fg=figure;
semilogx(x,Y,'ro'); % replace with "plot(x,Y,'ro');" if x data to be plotted linearly.
set(gca,'YTick', Yt);
set(gca,'yticklabel',labels);
set(gca,'YLim',[ymin,100-ymin]);
grid on;
%set(gca,'YDir','reverse');
%set(gca,'YLim', [min(y) max(y)]);
end