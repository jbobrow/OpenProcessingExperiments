
void setup() {
  size(600, 600);
  textSize(32);
text("Rain", 250, 25);
textSize(32);
text("Tmin", 250, 230);
textSize(32);
text("Tmax", 250, 430);
}

void draw(){
String lines[] = loadStrings("data.txt");
lines = subset(lines,7);
lines = trim(lines);
float rain[] = new float[lines.length];
float Tmin[] = new float[lines.length];
float Tmax[] = new float[lines.length];

for(int i=0 ; i<lines.length ; i++)
{
String fields[] = splitTokens(lines[i]);
float values[] = float(fields);
rain[i] = values[5];
Tmin[i] = values[3];
Tmax[i] = values[2];
  }
  
int data_start = 0;
int data_length = 1600;
float plotset[] = subset(rain, data_start, data_length);

for ( int i=0 ; i<plotset.length; i++ )
{
  float point_x = map(i,0,plotset.length,0,600);
  float Pmax = max(plotset);
  float Pmin = min(plotset);
  float point_y = map(plotset[i],Pmin,Pmax,50,200);
  line( point_x, point_y, point_x, 200);
}

int data_startb = 0;
int data_lengthb = 1600;
float plotsetb[] = subset(Tmin, data_startb, data_lengthb);

for ( int i=0 ; i<plotsetb.length; i++ )
{
  float point_x = map(i,0,plotsetb.length,0,600);
  float Pmax = max(plotsetb);
  float Pmin = min(plotsetb);
  float point_y = map(plotsetb[i],Pmin,Pmax,250,400);
  line( point_x, point_y, point_x, 400);
}

int data_startc = 0;
int data_lengthc = 1600;
float plotsetc[] = subset(Tmax, data_startc, data_lengthc);

for ( int i=0 ; i<plotsetc.length; i++ )
{
  float point_x = map(i,0,plotsetc.length,0,600);
  float Pmax = max(plotsetc);
  float Pmin = min(plotsetc);
  float point_y = map(plotsetc[i],Pmin,Pmax,450,600);
  line( point_x, point_y, point_x, 600);
}

}



