
/*

pattern balls
jacky@kwancreative.com
June 11,2009

*/

static final int Balls = 212;  
float rStart; 
 
void setup() 
{ 
  size(300, 300); 
  smooth(); 
  rStart = 50 + random(70); 
  background(125); 
} 
  
void draw() 
{ 

  filter(BLUR); 
  filter(ERODE); 
   
  float n = millis()*.00005 + rStart; 
  float rad = width*.57/2; 
  float cx = width/2; 
  float cy = height/2; 
  for (int i = 0; i <= Balls; ++i) 
  { 
    float sb = i*PI*5 / Balls; 
    setColor(n+sb/6); 
    float r = rad * sin(n*sb); 
    float px = cx + cos(sb)*r; 
    float py = cy + sin(sb)*r; 
    ellipse(px,py,7,7); 
  } 
} 

void setColor(float Hue) 
{ 
  float ph = sin(millis()*.0001); 
 
  int rr = (int) (sin(Hue) * 227 + 228); 
  int gg = (int) (sin(Hue + (1*ph) * PI/3) * 227 + 228); 
  int bb = (int) (sin(Hue + (5*ph) * PI/3) * 227 + 228); 
  stroke(rr,gg,bb); 
}

void mousePressed () {

  save("pattern.png");

};

