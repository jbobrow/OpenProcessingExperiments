
// KEEP MOVING THE MOUSE OR I WILL CATCH YOU
// a trace for the mousepointer which follows the moving mouse 
// as quickly as the distance between itself and the mouse
// and also "throbs" once it meets a stationary mousepointer

float distX, distY, distance;
float myu = 0.02;
float x,y,rad,throb_rad,change;

void setup() {
  size(300,300);
  background(127);
  smooth();
  noStroke();
  frameRate(100);
  rad = 10;
}
  
void draw() {
  fill(127,3);
  rect(0,0,width,height);
  distX = mouseX - x;
  distY = mouseY - y;
  x = x + (myu * distX);
  y = y + (myu * distY);
  fill(255);
  ellipse(x,y,rad,rad);
  throb();
}

void throb() {
  distance = dist(mouseX,mouseY,x,y);
  if(distance>1) { throb_rad = rad; }
  if(distance<=1) {
    if (throb_rad >= 3*rad)       change = - 0.3;
      else if (throb_rad <= rad)  change = + 0.3;
    throb_rad = throb_rad + change;
    fill(255,4);
    ellipse(x,y,throb_rad,throb_rad);
  }
}
