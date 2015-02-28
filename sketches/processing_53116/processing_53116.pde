
float x,y,angle;
int xspeed;
float a,s,angle2;
int xspeed2;


void setup(){
  size(900,500);
  x=0;
  y=0;
  a=900;
  s=0;
  xspeed = 1;
  xspeed2 = 1;
  angle=0;
  angle2=900;
  smooth();
  noStroke();
}

void draw(){
  
  fill(angle,angle2,150,20);
  rect(0,0,width,height);
 angle += xspeed;
 angle2 += xspeed2;
 
 x = cos(radians(angle)) * 50 + angle; 
 y = sin(radians(angle)) * 50 + height/2; 
 a = cos(radians(angle2)) * 50 + angle2; 
 s = sin(radians(angle2)) * 50 + height/2; 
 fill(255);
 ellipse(angle,y,10,10);
 ellipse(angle,y + 50,10,10);
 ellipse(angle,y + 100,10,10);
 ellipse(angle,y + 150,10,10);
 ellipse(angle,y + 200,10,10);
 ellipse(angle,y + 250,10,10);
 ellipse(angle,y + 300,10,10);
 ellipse(angle,y - 50,10,10);
 ellipse(angle,y - 100,10,10);
 ellipse(angle,y - 150,10,10);
 ellipse(angle,y - 200,10,10);
 ellipse(angle,y - 250,10,10);
 ellipse(angle,y - 300,10,10);
 if (angle > width) {
   xspeed = -1; 
 }
  if (angle < 0) {
   xspeed = 1;
 }
 if (angle2 > width) {
   xspeed2 = -1;
 }
  if (angle2 < 0) {
   xspeed2 = 1;
 }
 ellipse(angle2,s,10,10);
 ellipse(angle2,s + 50,10,10);
 ellipse(angle2,s + 100,10,10);
 ellipse(angle2,s + 150,10,10);
 ellipse(angle2,s + 200,10,10);
 ellipse(angle2,s + 250,10,10);
 ellipse(angle2,s + 300,10,10);
 ellipse(angle2,s - 50,10,10);
 ellipse(angle2,s - 100,10,10);
 ellipse(angle2,s - 150,10,10);
 ellipse(angle2,s - 200,10,10);
 ellipse(angle2,s - 250,10,10);
 ellipse(angle2,s - 300,10,10);
 
}

