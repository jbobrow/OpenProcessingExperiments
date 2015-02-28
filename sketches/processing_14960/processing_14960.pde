
//Modified from sketch1 by Aramburu, licensed under Creative Commons Attribution-Share Alike 3.0 and GNU GPL license.
//Work: openprocessing.org/visuals/?visualID=12872
//License:
//http://creativecommons.org/licenses/by-sa/3.0/
//http://creativecommons.org/licenses/GPL/2.0

float x = random(300);
float y = random(300);
 
float r = random (255);
float g = random (255);
float b = random (255);
 
float xspeed = 30;
float yspeed = 30;
float speed = 5;
 
 
void setup(){
  size (300,400);
  background(200);
   
  smooth();
}
 
void draw(){
  
 noStroke();
 fill(r,g,b, 50);
 ellipse(x,y,40,40);
 


 

x = x + xspeed;
y = y + yspeed;
r = r + xspeed;
g = g + yspeed;
b = b + xspeed;

if (x >width || (x < 0)) {
  xspeed = xspeed *-1;
  speed = speed*-1;
  
   
}
if (y >height || (y < 0)){
  yspeed = yspeed*-1;
}
}                               
