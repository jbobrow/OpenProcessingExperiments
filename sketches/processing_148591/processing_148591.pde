
int data_start = 0;
int data_length = 12;
int l=10, r=90;
int b=90, t=10;

void setup()
{
  size(140,280); 
}

void draw()
{
  String longline[] = loadStrings("durhamdata.txt");
  longline = subset(longline, 7);
  longline = trim(longline);
  text("Average", 10, 10);
  text("Minimum", 10, 100);
  text("Maximum", 10, 190);
  float rainfall[] = new float[longline.length];
  float mintemp[] = new float[longline.length];
  float maxtemp[] = new float[longline.length];
  for(int i=0; i<longline.length; i++)
  {
    String fields[] = splitTokens(longline[i]);
    float values[] = float(fields); 
    rainfall[i] = values[5];
    mintemp[i] = values[3];
    maxtemp[i] = values[2];
  }
  float rain[] = subset(rainfall, data_start, data_length);
  float Mintemp[] = subset(mintemp, data_start, data_length);
  float Maxtemp[] = subset(maxtemp, data_start, data_length);
  for( int k=0 ; k<rain.length; k++)
  {
    float point_x = map(k,0,rain.length,l,r);
    float Pmax = max(rain);
    float Pmin = min(rain);
    float point_y = map(rain[k],Pmin,Pmax,b,t);
    line(point_x,point_y,point_x, b);
  }
  for( int k=0 ; k<Mintemp.length; k++)
  {
    float point_x = map(k,0,Mintemp.length,l,r);
    float Pmax = max(Mintemp);
    float Pmin = min(Mintemp);
    float point_y = map(Mintemp[k],Pmin,Pmax,b+90,t+90);
    line(point_x,point_y,point_x, b+90);
  }
  for( int k=0 ; k<Maxtemp.length; k++)
  {
    float point_x = map(k,0,Maxtemp.length,l,r);
    float Pmax = max(Maxtemp);
    float Pmin = min(Maxtemp);
    float point_y = map(Maxtemp[k],Pmin,Pmax,b+180,t+180);
    line(point_x,point_y,point_x, b+180);
  }
}


