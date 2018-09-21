# symmetric_loglike_plot
Log-like plotting function, symmetric about 50%. For data where values of interest are close to 0 and 100% (e.g., particle size distribution data).

## Mapping function
where $y$
b=50/(log(50)-log(ymin));
a=-b*log(ymin);

Y=y-y;
for i=1:length(y)
    if y(i)<=50 && y(i)>0
        Y(i) = b*log(y(i))+a;
    elseif y(i)>50 && y(i)<100
        Y(i) = 100-b*log(100-y(i))-a;

## Example output
![Example output](example_out.png)
