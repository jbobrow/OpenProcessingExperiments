
int data_start = 0;
int data_length = 12;
int l=10, r=90;
int b=90, t=10;
void setup()
{
 size(120,300); 
}
void draw() {
String climatedata[] = loadStrings("Ross-On-Wye.txt");
climatedata = subset(climatedata, 7);
climatedata = trim(climatedata);
float rainavg[] = new float[climatedata.length];
float mintemp[] = new float[climatedata.length];
float maxtemp[] = new float[climatedata.length];


for(int i=0; i<climatedata.length; i++)
{
  String fields[] = splitTokens(climatedata[i]);
  float values[] = float(fields); 
  
  rainavg[i] = values[5];
  mintemp[i] = values[3];
  maxtemp[i] = values[2];
  
}

float Rainavg[] = subset(rainavg, data_start, data_length);
float Mintemp[] = subset(mintemp, data_start, data_length);
float Maxtemp[] = subset(maxtemp, data_start, data_length);

for( int k=0 ; k<rainavg.length; k++)
{
  float point_x = map(k,0,rainavg.length,l,r);
  float Pmax = max(rainavg);
  float Pmin = min(rainavg);
  float point_y = map(rainavg[k],Pmin,Pmax,b,t);
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

for( int k=0 ; k<maxtemp.length; k++)
{
  float point_x = map(k,0,maxtemp.length,l,r);
  float Pmax = max(maxtemp);
  float Pmin = min(maxtemp);
  float point_y = map(maxtemp[k],Pmin,Pmax,b+180,t+180);
  line(point_x,point_y,point_x, b+180);
}
}


