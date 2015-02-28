

 
int a = 0;      
int b = 400;
int c = 400;
int d = 400;
int e = 400;
int f = 400;
int g = 400;
int h = 400;
int i = 400;

void setup()
{
  
 
  size(400, 400);
  stroke(255);
  frameRate(35);
  

}
void draw()
{
 background(0); 
 a = a + 1;
  
 stroke(25);
  line(a, 0, a, height);
  
  if(a > width){ 
    a = 0;
  }
    line(0, a, 720, a);
    line(d, 0, d, 480);
    line(0, e, 720, e);
  
  
  
  stroke(25);
   fill(random(255), random(255), random(255), 50);
  rect(0, 0, a, a);
   if(a > height) {
    a = 0;
   }
    
    b = b - 1;
    c = c - 1;
    stroke(255);
    rect(b, a, c, a);
    if(b < 0)
    b = 400;
    
    d = d - 1;
    e = e - 1;
    fill(random(255), random(255), random(255), 50);
    triangle(400, 400, d, 400, 700, e);
    if(d == 0)
    d = 400;
    if(e < 0)
    e = 400;
   
     f = f - 2;
 g = g - 2;
 h = h + 2;
 i = i + 2;
 
ellipseMode(CORNERS);
  ellipse(a, a, d, d);  

ellipseMode(CORNERS);
ellipse(d, d, e, e);

 int x = width/3;
int y = height/2;
int outerRad = 80;
int innerRad = 40;
float px = 0, py = 0, angle = 0;
float pts = random(40);
float rot = 360.0/pts;


stroke(255);
fill(random(255), 0, 0, 80);
beginShape(TRIANGLE_STRIP); 
for (int i = 0; i < pts; i++) {
  px = x + cos(radians(angle))*outerRad;
  py = y + sin(radians(angle))*outerRad;
  angle += rot;
  vertex(px, py);
  px = x + cos(radians(angle))*innerRad;
  py = y + sin(radians(angle))*innerRad;
  vertex(px, py); 
  angle += rot;
  
 float m = a;
int n = height/2;
int outerRadM = 80;
int innerRadM = 40;
float pm = 0, pn = 0, angleM = 0;
float ptsM = random(40);
float rotM = 360.0/pts;


stroke(25);
fill(random(255), 0, 0, 80);
beginShape(TRIANGLE_STRIP); 
for (int iM = 0; iM < pts; iM++) {
  pm = m + cos(radians(angle))*outerRadM;
  pn = n + sin(radians(angle))*outerRadM;
  angleM += rotM;
  vertex(px, py);
  pm = m + cos(radians(angle))*innerRadM;
  pn = n + sin(radians(angle))*innerRadM;
  vertex(pm, pn); 
  angleM += rotM;
  
   
  
    }
    
  }

  
  }



  


