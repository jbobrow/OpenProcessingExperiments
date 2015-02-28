
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
float plotset[] = subset(rain, data_start, data_length);
size(400,400);
 
 
for(int i=0 ; i<plotset.length ; i++)
{
  float point_x = map(i,0,plotset.length, 10, width -10);
  stroke(0,0,205);
  float Pmax = max(plotset);
  stroke(250,0,0);
  float Pmin= min(plotset);
  float point_y = map(plotset[i],Pmin,Pmax, height-10,10);
  line(point_x, point_y, point_x, height-10);
}


