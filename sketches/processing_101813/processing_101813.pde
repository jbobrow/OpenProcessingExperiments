
float x;
 float y;
 float px;
 float py;
 float easing = 0.05;
 
 void setup() {
 size(480, 120);
 smooth();
 stroke(258,50);
 }
 
 void draw() {
   float targetX = mouseX;
   x += (targetX - x) * easing;
   float targetY = mouseY;
   y += (targetY - y) * easing;
   float weight = dist(x,y,px,py);
   strokeWeight(weight);
   line(x, y, px, py);
   py = y;
   px = x;
   
 }
