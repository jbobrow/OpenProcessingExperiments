
float x,y;
int r = 30;
float easing=2; // play with this value to see how easing effects the behavior
float diameter=15.0;
int sketch_size = 1200;



void setup() {
  size(sketch_size,sketch_size);
  background(#f0022f);
  smooth();
  fill(255,120,#FFEB00);
}


void draw() {

  float targetX = mouseX;
  float targetY = mouseY;
  x+= (targetX-x)*easing;
  y+= (targetY-y)*easing;

  //now add background to refresh background
  //background(#1189BF);
  float r = map (mouseX, 0, width, 230, 255);
  float g = map (mouseY, 0, height, 255,230);
  
  fill(r, g, random(0, 255), 20);
  ellipse(x,y,r,r);
}


