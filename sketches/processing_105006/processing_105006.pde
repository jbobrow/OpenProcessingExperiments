
int x;
int y;
int xspeed;
int yspeed;
int x2;
int y2;
int xspeed2;
int yspeed2;
void setup() {
  size(500, 500);
  smooth();
  fill(18, 182, 255, 25);
  
  x = 88;
  y = 0;

  xspeed = 4;
  yspeed = 7;
  
  x2 = 250;
  y2 = 10;

  xspeed2 = 2;
  yspeed2 = 5;
  
}

void draw() {
   background(255);
 
  
  if (x <= width/2) {
    fill(18, 182, 255, 50);
  } else {
    fill(0, 229, 28, 50);
  } 
x = x + xspeed;
y = y + yspeed;
x2 = x2 + xspeed2;
y2 = y2 + yspeed2;

if (x >= width) {
  xspeed *= -1;
}
if (x <= 0) {
  xspeed *= -1;
}
if (y >= height) {
  yspeed *= -1;
}
if (y <= 0) {
    yspeed *= -1;
}
if (x2 >= width) {
  xspeed2 *= -1;
}
if (x2 <= 0) {
  xspeed2 *= -1;
}
if (y2 >= height) {
  yspeed2 *= -1;
}
if (y2 <= 0) {
    yspeed2 *= -1;
}
  stroke(1);
  ellipse(x, y, 200, 200);
  noStroke(); 
  ellipse(x, y, 150, 150);
  ellipse(x, y, 125, 125); 
  ellipse(x, y, 100, 100); 
  ellipse(x, y, 75, 75); 
  ellipse(x, y, 25, 25); 
  stroke(1);
  ellipse(x ,x, 100, 100);
  ellipse(y, y, 100, 100);
  ellipse(y, x, 100, 100);
  ellipse(x2 ,y2, 100, 100);
  ellipse(y2, y2, 100, 100);
  ellipse(x2, x2, 100, 100);
  ellipse(y2, x2, 100, 100);
}
