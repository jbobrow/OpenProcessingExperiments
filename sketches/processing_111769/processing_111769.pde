
float x, y;
float angle = 0;
float r = 30;
float diff = 1;
 
color col = color(200, 122, 100);
 
void setup() {
  size(600, 600);
  background(255,30,60);
}
 
 
void draw() {
  x = r * cos(angle)*4.0;
  y = r * sin(angle)*5.0
 
  translate(width/2, height/2);
  rotate(r);
 
  noStroke();
  fill(0, 200, 40, 85);
  strokeWeight(0.2);
  rect(x/1, y/2, x*1, y*5);
 
  noStroke();
  fill(255, 0, 135, 5);
  strokeWeight(0.1);
  rect(x, y, x*3, x*3);
 
  noFill();
  stroke(#03FDE2, 0);
  strokeWeight(0.1);
  line(0, 0, y, y);
  fill(#DF29D2, 5);
  ellipse(y, y, y/5, y/1);
 
  noFill();
  stroke(col, 10);
  strokeWeight(0.1);
  line(0, 0, x, x);
  fill(col, 10);
  ellipse(x, x, x/5, x/5);
 
  angle = angle + 0.4;
  r = r - diff;
 
  if ( r == 0 || r == 100) {
    diff =  diff * -1;
  }
}
