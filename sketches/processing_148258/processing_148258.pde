
void setup() 
{ 
 size(100,300);  
} 

void draw(){ 
String lines[] = loadStrings("whitbycoastguard.txt"); 
lines = subset(lines, 10); 
lines = trim(lines); 
float rain[] = new float[lines.length]; 
float Tmin[] = new float[lines.length]; 
float Tmax[] = new float[lines.length]; 

int data_start = 0; 
int data_length = 14; 
int l=20, r=80; 
int b=80, t=20; 

for(int i=0; i<lines.length; i++) 
{ 
  String fields[] = splitTokens(lines[i]); 
  float values[] = float(fields);     

  rain[i] = values[5]; 
  Tmin[i] = values[4]; 
  Tmax[i] = values[3]; 
  
} 

float Trainfall[] = subset(rain, data_start, data_length); 
float Mintemp[] = subset(Tmin, data_start, data_length); 
float Maxtemp[] = subset(Tmax, data_start, data_length); 

for( int k=0 ; k<Trainfall.length; k++) 
{ 
  float point_x = map(k,0,Trainfall.length,l,r); 
  float Pmax = max(Trainfall); 
  stroke(225,0,0);
  float Pmin = min(Trainfall); 
  stroke(2250,0,0);
  float point_y = map(Trainfall[k],Pmin,Pmax,b,t); 
  line(point_x,point_y,point_x, b); 
} 

for( int k=0 ; k<Mintemp.length; k++) 
{ 
  float point_x = map(k,0,Mintemp.length,l,r); 
  float Pmax = max(Mintemp); 
  stroke(0,225,0);
  float Pmin = min(Mintemp); 
  stroke(0,225,0);
  float point_y = map(Mintemp[k],Pmin,Pmax,b+90,t+90); 
  line(point_x,point_y,point_x, b+90); 
} 

for( int k=0 ; k<Maxtemp.length; k++) 
{ 
  float point_x = map(k,0,Maxtemp.length,l,r); 
  float Pmax = max(Maxtemp); 
  stroke(0,0,225);
  float Pmin = min(Maxtemp); 
  stroke(0,0,225);
  float point_y = map(Maxtemp[k],Pmin,Pmax,b+180,t+180); 
  line(point_x,point_y,point_x, b+180); 
} 
} 



