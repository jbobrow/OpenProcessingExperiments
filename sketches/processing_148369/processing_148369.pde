
size(300,300);
String lines[] = loadStrings("durhamdata.txt");
lines = subset(lines, 7);
lines = trim(lines);
float rain[] = new float[lines.length];
float Tmin[] = new float[lines.length];
float Tmax[] = new float[lines.length];
for(int i=0 ; i<lines.length ; i++)
{
  /* body of loop */
  String fields[] = splitTokens(lines[i]);
  float values[] = float(fields);
  rain[i] = values[5];
  Tmin[i] = values[3];
  Tmax[i] = values[2];
}
int data_start = 500;
int data_length = 60;
int l = 10;
int r = 290;
int b = 290;
int t = 10;
float plotset[] = subset(rain, data_start, data_length);
for ( int i=0 ; i<plotset.length ; i++ )
{
  float point_x = map(i,0,plotset.length,l,r);
  float Pmax = max(plotset);
  float Pmin = min(plotset);
  float point_y = map(plotset[i],Pmin,Pmax,b,t);
  line( point_x, point_y, point_x, b);
}


