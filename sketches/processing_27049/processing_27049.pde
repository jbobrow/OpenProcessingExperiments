
float y;
float x;
float yspeed = +5;
float xspeed = 0;

void setup(){
  size(500,500);
  background(255,255,255);
y = 0;
x = 0;
}

void draw(){
 if (y >= 450){
  yspeed=-5;
 }
 if (y <=50){
   yspeed=20;
 }
  
  if (x >= 450){
  xspeed=-10;
 }
 if (x <=50){
   xspeed=10;
 }
  y = y + yspeed;
  x = x + xspeed;
   fill(random(10),random(255),random(255),random(5));
   ellipse(x,y,50,50);
   fill(random(10),random(255),random(255),random(y));
  ellipse(x,y,50,50);
}

