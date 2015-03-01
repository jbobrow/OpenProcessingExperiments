
// Luminous Blink
// Gary Green 2014


float x=255;
float y=255;
float chngx=1;
int r=240;
int g=200;
int b=50;
float hgt=1; // affects blink
float hgtdir=0.1;
float chgr=2; // change red


void setup() {
  size(510,520);
  smooth();
  noStroke();
  strokeJoin(ROUND);
 }

void draw() {
  background(0);
  float chngx=1;
  
 int g=25;
 int b=250;
  
  hgt+=hgtdir;
  if((hgt<1) || (hgt>5)) {
    hgtdir=hgtdir*-1;
  }
  
  for(int p=255; p<510; p+=chngx) {
  
  for(int deg=0; deg<360; deg+=6) {
  float angle=radians(deg);
  float x=random(0.5,2)+255+(cos(angle)*(p-255));
  float y=255+((sin(angle)*(p-255)/hgt));  
  fill(r,g,b,255-(p-255));
  
  ellipse(x,y,20,15);
  }
  
  chngx+=5;
  b-=25;
  
  }
  
  r+=chgr;
  if ((r<3) || (r>252)) {
    chgr=chgr*-1;
  }
  
 
}
