

 
float x, y;
float angle = 70;
float r = 10;
float r1 = 10;
float diff = 10;
 
 
void setup() {
  size(600, 600);
 
  background(235, 40, 26);
   
}
 
void draw() {
 
 
  noStroke();
  fill(random(20, 0), random(20, 0), random(0, 200));
  x = r1 * cos(angle);
  y = r * sin(angle);
  translate(width/2, height/2);
  rotate(r);
  ellipse(x, y, random(0, 8), random(0, 60));
 
  noFill();
  stroke(random(10, 100), random(10, 20), 100, random(20, 0));
  ellipse(random(0, 600), random(0, 600), random(0, 600), random(0, 600));
 
 
 
 
  angle = angle +20;
  r = r - diff;
 
  if ( r == 0 || r == 400) {
    diff =  diff * -1;
  }
}
 
 


