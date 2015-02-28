
int length = 12;
int start = 0;
int o=90, p=10;
int m=10, n=90;
void setup()
{
 size(250,300); 
 background(0,0,190);
}

void draw(){
String lineset[] = loadStrings("durhamdata.txt");
lineset = subset(lineset, 7);
lineset = trim(lineset);

float rainfall[] = new float[lineset.length];
float mintemp[] = new float[lineset.length];
float maxtemp[] = new float[lineset.length];
for(int i=0; i<lineset.length; i++)
{
  String fields[] = splitTokens(lineset[i]);
  float values[] = float(fields); 
  
  rainfall[i] = values[5];
  mintemp[i] = values[3];
  maxtemp[i] = values[2];
  
}

float rain[] = subset(rainfall, start, length);
float Mintemp[] = subset(mintemp, start, length);
float Maxtemp[] = subset(maxtemp, start,length );
for( int h=0 ; h<rain.length; h++)
{
  float point_x = map(h,0,rain.length,m,n);
  float Pmax = max(rain);
  float Pmin = min(rain);
  float point_y = map(rain[h],Pmin,Pmax,o,p);
  line(point_x,point_y,point_x, o);
}

for( int h=0 ; h<Mintemp.length; h++)
{
  float point_x = map(h,0,Mintemp.length,m,n);
  float Pmax = max(Mintemp);
  float Pmin = min(Mintemp);
  float point_y = map(Mintemp[h],Pmin,Pmax,o+90,p+90);
  line(point_x,point_y,point_x, o+90);
}

for( int h=0 ; h<Maxtemp.length; h++)
{
  float point_x = map(h,0,Maxtemp.length,m,n);
  float Pmax = max(Maxtemp);
  float Pmin = min(Maxtemp);
  float point_y = map(Maxtemp[h],Pmin,Pmax,o+180,p+180);
  line(point_x,point_y,point_x, o+180);
 
}
String s = "The average rainfall for each month.";
fill(1);
text(s, 130, 10, 110, 80);
String d = "The minimum temperature for each month.";
fill(1);
text(d, 130, 110, 110, 80);
String q = "The minimum temperature for each month.";
fill(1);
text(q, 130, 220, 110, 80);
line(250,8,5,8);
line(250,96,5,96);
line(250,186,5,186);
}





