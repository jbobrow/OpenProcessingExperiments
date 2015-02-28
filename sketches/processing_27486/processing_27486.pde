
/**
* Moiré pattern:
* (NomBot)
* 
* 
*/


float rays = 300;
float inc = 1;
float angd=TWO_PI/(2*rays);
int rad1=20;
int rad2=100000;

int cx = -rad1*2;
int cy = -rad1*2;
int vx = 0;
int vy = 0;

void setup() {
  colorMode(RGB, 1);
  frameRate(160);
  size(600,500);
  background(1);
  fill(0);
  smooth();
  noStroke();

 }

void draw() {
  
  background(1);
  rays+=inc;
  
  angd=TWO_PI/(2*rays);
  for (int i = 0; i<rays; i++) {
    
  float ang1=2*i*angd;
  float ang2=ang1+angd;
  
  vx=width+2*rad1;
  vy=height+2*rad1; 
 
  float sang1=sin(ang1);
  float cang1=cos(ang1);
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
    
    
  }
}



