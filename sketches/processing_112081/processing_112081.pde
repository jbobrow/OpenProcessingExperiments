
float x, y;
float angle = 0;
float r = 400;
float diff = 1;
 
color col = color(0);
 
void setup() {
  size(600, 600);
  background(0);
}
 
void draw() {
 
  fill(col);
   
   
  x = r * cos(angle);
  y = r * sin(angle);
 
 
  strokeWeight(0.1);
  stroke(255, 70);
 
  translate(width/2, height/2);
  rotate(r);
 
  ellipse(0, 0, x, y);
  line(0, 0, x, y);
  line(0, 0, y, x);
 
  angle = angle + 1.0;
  r = r - diff;
 
  if ( r == 0 || r == 500) {
    diff =  diff * -1;
  }
}
