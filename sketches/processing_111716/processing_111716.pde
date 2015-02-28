
float x, y;
float angle = 0;
float a = 600;
float b = 5;
 
void setup() {
  size(600, 600);
  background(225);
}
 
void draw() {
  fill(0,0);
   
  x = a * cos(angle);
  y = a * sin(angle);
   
  strokeWeight(0.9);
  stroke(random(25),random(55),random(255),30);
 
  translate(width/2, height/2);
  rotate(a);
   
  ellipse(0, 0, x, y);
 
  angle = angle +5;
  a = a - b;
