
float x = random(400);
float y = random(400);
float r = random (255);
float g = random (255);
float b = random (255);
float a = random (0,90);
float xspeed = 3.7;
float yspeed = 2.5;
float rspeed = 6.9;
float gspeed = 1.9;
float bspeed = 0.1;
float aspeed = 2.3;
 
 
 
void setup(){
  size (400,400);
  background(0);
    smooth();
}
 
void draw(){
  
 noStroke();
 fill(r,g,b,a);
 rect(x,y,20,20);
 
x = x + xspeed;
y = y + yspeed;
r = r + rspeed;
g = g + gspeed;
b = b + bspeed;
a = a + aspeed;
 
if (x >width || (x < 0)) {
  xspeed = xspeed *-1;
}
if (y >height || (y < 0)){
  yspeed = yspeed*-1;
}
if (r > 255|| (r < 0)){
  rspeed = rspeed * -1;
}
if (g > 255 || (g <0)){
  gspeed = gspeed * -1;
}
if (b > 255 || (b < 0)){
  bspeed = bspeed * -1;
}
 
if (a > 150 || (a < 0)){
  aspeed = aspeed * - 1;
}
}
                
