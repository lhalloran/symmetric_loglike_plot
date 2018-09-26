# symmetric_loglike_plot
Log-like plotting function, symmetric about 50%. For data where values of interest are close to 0 and 100% (e.g., cumulative particle size distribution data).

## Mapping function
Where y is input y-axis data (in percent), map the position of the y data to relative position Y:\
  if 0<y<=50, then Y = b*ln(y)+a\
  if 50<y<100, then Y = 100 - b*ln(100-y)-a
  
where\
  b = 50 / (ln(50)-ln(y_min))\
  a = -b*ln(y_min)

y_min is the lower cut-off for the plot and 100%-y_min is the upper cut-off.

## Example output
![Example output](example_out.png)
