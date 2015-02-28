
// Konkuk University
// Department of Dynamic Media
// SOS iDesign
// Name: CHOI Joo Hee
// ID:201420114
 
int x1 = 0;
int y1 = 0;
int Xspeed1 = 3;
int Xspeed2 = 1;
int x2 = 0;
int y2 = 0;
int Yspeed1 = 2;
int Yspeed2 = -1;

 
float c1 = 0;     
float c2 = 255;   
float c1dir = 0.1; 
float c2dir = -0.1;
 
void setup() {
  size(1024,768);
  smooth(200);
}
 
void draw() {
  background(#0E1934);
  x1 = x1 + Xspeed1;
  y1 = y1 + Yspeed1;
  x2 = x2 + Xspeed2;
  y2 = y2 + Yspeed2;
  c1 = c1 + c1dir;
  
  //back
    if (c1 < 0 || c1 > 255) {
    c1dir *= -1;
  }
  fill(#F295A8, c1);
  noStroke();
  triangle(0, x1, y1, y2, 0, y1);
  fill(#AF969B, c1);
  triangle(y1, width, y2,y2, x1,width);
  fill(#AD4E61, c1);
  triangle(width, x1, x1,y1, width, y1 );

  //x, y set up
  if ((x1>width) || (x1<0)) {
    Xspeed1 = Xspeed1 * -1;
  }
     if ((x2>width) || (x2<0)) {
    Xspeed2 = Xspeed2 * -1;
  }
  if ((y1> height) || (y1<0)) {
    Yspeed1 = Yspeed1 * -1;
  }
  if ((y2> height) || (y2<0)) {
    Yspeed2 = Yspeed2 * -1;
  }

  //center figure
  fill(#FFA550, 220);
  quad(y1,y2,y2,y2,x1,y1,x2,y1);
}

