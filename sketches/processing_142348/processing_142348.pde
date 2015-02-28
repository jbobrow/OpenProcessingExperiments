
int data_start = 0;
int data_length = 12;
int l=10, r=90;
int b=90, t=10;
void setup()
{
 size(90,300); 
}

void draw(){
String climate[] = loadStrings("heathrowdata.txt");
climate = subset(climate, 7);
climate = trim(climate);
float rain[] = new float[climate.length];
float Mint[] = new float[climate.length];
float maxtemp[] = new float[climate.length];


for(int i=0; i<climate.length; i++)
{
  String fields[] = splitTokens(climate[i]);
  float values[] = float(fields); 
  
  rain[i] = values[5];
  Mint[i] = values[3];
  maxtemp[i] = values[2];
  
}

float rainfall[] = subset(rain, data_start, data_length);
float mintemp[] = subset(Mint, data_start, data_length);
float maxt[] = subset(maxtemp, data_start, data_length);

for( int k=0 ; k<rainfall.length; k++)
{
  float point_x = map(k,0,rainfall.length,l,r);
  float Pmax = max(rainfall);
  float Pmin = min(rainfall);
  float point_y = map(rainfall[k],Pmin,Pmax,b,t);
  line(point_x,point_y,point_x, b);
}

for( int k=0 ; k<mintemp.length; k++)
{
  float point_x = map(k,0,mintemp.length,l,r);
  float Pmax = max(mintemp);
  float Pmin = min(mintemp);
  float point_y = map(mintemp[k],Pmin,Pmax,b+90,t+90);
  line(point_x,point_y,point_x, b+90);
}

for( int k=0 ; k<maxt.length; k++)
{
  float point_x = map(k,0,maxt.length,l,r);
  float Pmax = max(maxt);
  float Pmin = min(maxt);
  float point_y = map(maxt[k],Pmin,Pmax,b+180,t+180);
  line(point_x,point_y,point_x, b+180);
}

}



