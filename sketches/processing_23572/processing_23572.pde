
int etapes;
float angle;
 float diameter = 10;
float easing = 0.05;
float anglemod;
float anglestart;
float x, y, x0, y0;
float ax, ay, ax0, ay0;
float bx, by, bx0, by0;
int f; // framecount

void setup(){
//noCursor();
  size (800,600);
  background(50);
  smooth();
  frameRate(50);
  
}
void draw (){
   ellipse(x, y, diameter, diameter);
  float targetX = mouseX;
  x += (targetX - x) * easing;
  float targetY = mouseY;
  y += (targetY - y) * easing;
      stroke(0);
  line(x, y, x+15, y+15);
    stroke(0);
  line(x, y, x-15, y-15);
  strokeWeight(20);
  stroke(255);
}
void mouseDragged(){
    stroke (40, 400-pmouseX, 300-pmouseY);
}



