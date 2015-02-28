
void setup() {
  size(800,800 );
}

void draw(){
String lines[] = loadStrings("durhamdata.txt");
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
int data_start = 50;
int data_length = 350;
float plotset[] = subset(rain, data_start, data_length);
for ( int i=0 ; i<plotset.length; i++ )


{
  float point_x = map(i,0,plotset.length,100,700);
  float Pmax = max(plotset);
  float Pmin = min(plotset);
  float point_y = map(plotset[i],Pmin,Pmax,200,50);
  line( point_x, point_y, point_x, 200);
}

int data_startb = 50;
int data_lengthb = 350;
float plotsetb[] = subset(Tmin, data_startb, data_lengthb);
for ( int i=0 ; i<plotsetb.length; i++ )


{
  float point_x = map(i,0,plotsetb.length,100,700);
  float Pmax = max(plotsetb);
  float Pmin = min(plotsetb);
  float point_y = map(plotsetb[i],Pmin,Pmax,450,300);
  line( point_x, point_y, point_x, 450);
}


int data_startc = 50;
int data_lengthc = 350;
float plotsetc[] = subset(Tmax, data_startc, data_lengthc);
for ( int i=0 ; i<plotsetc.length; i++ )


{
  float point_x = map(i,0,plotsetc.length,100,700);
  float Pmax = max(plotsetc);
  float Pmin = min(plotsetc);
  float point_y = map(plotsetc[i],Pmin,Pmax,700,550);
  line( point_x, point_y, point_x, 700);
}

 
  textAlign(CENTER);
  text("RainFall For Durham.",width/2,220);   
  
  textAlign(CENTER);
  text("Minimum Temperature for Durham.",width/2,470); 

  textAlign(CENTER);
  text("Maximum Temperature for Durham.",width/2,720); 



}


