
int data_start = 0;
int data_length = 12;
int l=10, r=90;
int b=90, t=10;
void setup()
{
 size(90,300); 
}

void draw(){
String lines[] = loadStrings("durhamdata.txt");
lines = subset(lines, 7);
lines = trim(lines);
float rain[] = new float[lines.length];
float mintemp[] = new float[lines.length];
float maxtemp[] = new float[lines.length];


for(int i=0; i<lines.length; i++)
{
  String fields[] = splitTokens(lines[i]);
  float values[] = float(fields); 
  
  rain[i] = values[5];
  mintemp[i] = values[3];
  maxtemp[i] = values[2];
  
}

float avg_rain[] = subset(rain, data_start, data_length);
float min_temp[] = subset(mintemp, data_start, data_length);
float max_temp[] = subset(maxtemp, data_start, data_length);

for( int k=0 ; k<avg_rain.length; k++)
{
  float point_x = map(k,0,avg_rain.length,l,r);
  float Pmax = max(avg_rain);
  float Pmin = min(avg_rain);
  float point_y = map(avg_rain[k],Pmin,Pmax,b,t);
  line(point_x,point_y,point_x, b);
}

for( int k=0 ; k<min_temp.length; k++)
{
  float point_x = map(k,0,min_temp.length,l,r);
  float Pmax = max(min_temp);
  float Pmin = min(min_temp);
  float point_y = map(min_temp[k],Pmin,Pmax,b+90,t+90);
  line(point_x,point_y,point_x, b+90);
}

for( int k=0 ; k<max_temp.length; k++)
{
  float point_x = map(k,0,max_temp.length,l,r);
  float Pmax = max(max_temp);
  float Pmin = min(max_temp);
  float point_y = map(max_temp[k],Pmin,Pmax,b+180,t+180);
  line(point_x,point_y,point_x, b+180);
}

println("The top image is average rainfall");
println("The middle image is the minimum temperature");
println("The bottom image is the maximum temperature");

}








