
int xpoint = 250;
int ypoint = 250;
 
float ALPHA = 0.5;
float Angle = 3.14159;
float angle;
float newAngle = 0;
int Iter = 0;
float x,y;
int c;


void setup() {  //setup function called initially, only once
  size(500, 500);
  background(0);  //set background black
  colorMode(HSB);   //set colors to Hue, Saturation, Brightness mode
  x = width/2;
  y = height/2;
  a = 0;
  r = 50;
  R = 40;
  RR = 2
}

void draw() {  //draw function loops 
  
  //inner invisible orbit     
  newAngle = PI - ((Iter / 0.5) / 114.591);
  angle = ALPHA * newAngle + (1-ALPHA) * Angle;
  x = xpoint + r * cos(angle);
  y = ypoint + r * sin(angle);
 
  
  //outer visible orbit
  newAngle = PI - ((Iter / 0.03) / 114.591);
  angle = ALPHA * newAngle + (1-ALPHA) * Angle;
  float v = x + R * cos(angle);
  float z = y + R * sin(angle);
  
  
   newAngle = PI - ((Iter*-1 / 0.009) / 114.591);
  angle = ALPHA * newAngle + (1-ALPHA) * Angle;
  float q = v + RR * cos(angle);
  float p = z + RR * sin(angle);
  strokeWeight(2);
  stroke(c %5,240,240);
  ellipse(q,p,1,1);

  Iter+=1/5
  c++;
  
}
