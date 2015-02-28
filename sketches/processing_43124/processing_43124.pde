
//ball-1
float x = random(0,300);
float y = random(0,300);
float xspeed = random(2,5);
float yspeed = random(1,5);
float r = 32;
 
//ball-2
float x2 = random(0,300);
float y2 = random(0,300);
float x2speed = random(2,5);
float y2speed = random(1,5);
float r2 = 32;
 
//ball-3
float x3 = random(0,300);
float y3 = random(0,300);
float x3speed = random(2,5);
float y3speed = random(1,5);
float r3 = 32;

//ball-4
float x4 = random(0,300);
float y4 = random(0,300);
float x4speed = random(2,5);
float y4speed = random(1,5);
float r4 = 32;

PImage zod;
PImage zod2;
PImage space;
float zodX1;
float zodX2;
float zodX3;
float zodX4;
float zodY1;
float zodY2;
float zodY3;
float zodY4;
float zodR1;
float zodR2;
float zodR3;
float zodR4;
 
void setup() {
  size(600,600);
  smooth();
  noStroke();
}
 
void draw() {
  
  space = loadImage("space.jpg");
  background(space);
  noStroke();
  zod = loadImage("zod.jpg");
  zod2 = loadImage("zod2.jpg");
  x = x + xspeed;
  y = y + yspeed;
  x2 = x2 + x2speed;
  y2 = y2 + y2speed;
  x3 = x3 + x3speed;
  y3 = y3 + y3speed;
   
//ball-1
  if ((x > width) || (x < 0)) {
    xspeed = xspeed * -1;
    r = 80;
  }
   
  if ((y > height) || (y < 0)) {
    yspeed = yspeed * -1;
    r = 80;
  }
 
  zodX1 = x;
  zodY1 = y;
  zodR1 = r;
   
  r = constrain(r-2,32,80);
   
//ball-2
  if ((x2 > width) || (x2 < 0)) {
    x2speed = x2speed * -1;
    r2 = 80;
  }
   
  if ((y2 > height) || (y2 < 0)) {
    y2speed = y2speed * -1;
    r2 = 80;
  }
 
  zodX2 = x2;
  zodY2 = y2;
  zodR2 = r2;
   
  r2 = constrain(r2-2,32,80);
 
//ball-3
  if ((x3 > width) || (x3 < 0)) {
    x3speed = x3speed * -1;
    r3 = 80;
  }
   
  if ((y3 > height) || (y3 < 0)) {
    y3speed = y3speed * -1;
    r3 = 80;
  }
 
  zodX3 = x3;
  zodY3 = y3;
  zodX3 = r3;
   
  r3 = constrain(r3-2,32,80);
  
   


//ball 4
  if ((x4 > width) || (x4 < 0)) {
    x3speed = x3speed * -1;
    r3 = 80;
  }
   
  if ((y4 > height) || (y4 < 0)) {
    y4speed = y4speed * -1;
    r4 = 80;
  }
 
  zodX4 = x4;
  zodY4 = y4;
  zodX4 = r4;
   
  r4 = constrain(r3-2,32,80);
  imageMode(CORNERS);

image(zod,zodX1,zodY1,zodX2,zodY2);
if(zodY1<zodY2) {
  image(zod2,zodX1,zodY1,zodX2,zodY2);
} 

text("kneel before zod!!!",zodX1,zodY1);


}

