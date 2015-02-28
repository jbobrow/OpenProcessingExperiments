
float rayas = 200;
float inc = 1;
float angd=PI/2;
int rad1=2;
int rad2=250;
 
int cx = 0;
int cy = 0;
int vx = 0;
int vy = 0;
 
void setup() {
  noCursor();
  colorMode(RGB, 1);
  frameRate(45);
  size(500,500);
  background(1);
  fill(0);
  smooth();
  noStroke();
 
 }
 
void draw() {
   
  background(1);
  rayas+=inc;
   
  angd=TWO_PI/(2*rayas);
  for (int i = 0; i<rayas; i++) {
     
  float ang1=2*i*angd;
  float ang2=ang1+angd;
   
  vx=width+2*rad1;
  vy=height+2*rad1;
  
  float sang1=sin(ang1*mouseX);
  float cang1=cos(ang1*mouseY);
  float sang2=sin(ang2);
  float cang2=cos(ang2);
   
   
  quad(cx+rad1*sang1, cy+rad1*cang1,
       cx+rad1*sang2, cy+rad1*cang2,
       cx+rad2*sang2, cy+rad2*cang2,
       cx+rad2*sang1, cy+rad2*cang1);
     
   quad(vx+rad1*sang1, vy+rad1*cang1,
        vx+rad1*sang2, vy+rad1*cang2,
        vx+rad2*sang2, vy+rad2*cang2,
        vx+rad2*sang1, vy+rad2*cang1);
     
   quad(vx+rad1*sang1, cy+rad1*cang1,
        vx+rad1*sang2, cy+rad1*cang2,
        vx+rad2*sang2, cy+rad2*cang2,
        vx+rad2*sang1, cy+rad2*cang1);
     
   quad(cx+rad1*sang1, vy+rad1*cang1,
        cx+rad1*sang2, vy+rad1*cang2,
        cx+rad2*sang2, vy+rad2*cang2,
        cx+rad2*sang1, vy+rad2*cang1);
     
     
  }}
  
  void mousePressed(){
     float sang1=sin(cx*mouseX);
    
}

