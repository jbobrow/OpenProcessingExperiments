
  void setup() {
  size(700, 700);
  background(255);
  noCursor();
  }

float i = 0;
float j = 255;
float k = -510;
float l = 1020;
float m = -1275;
float n = 1785;
float o = -2040;
float p = 2550;
float q = -2805;
float r = 3315;

void draw () {
  i = i + .1;
  j = j - 1;
  k = k + 1;
  l = l - 1;
  m = m + 1;
  n = n - 1;
  o = o + 1;
  p = p - 1;
  q = q + 1;
  r = r - 1;
 
  translate(mouseX, mouseY);
  rotate(i);
  if(j>-255) {
  fill(j, 0, 0);
  } else if(j>-510){
  fill(0, k, 0);
  } else if(j>-765){
  fill(0, l, 0);
  } else if(j>-1275){
  fill(0, 0, m);
  } else if(j>-1530){
  fill(0, 0, n);
  } else if(j>-2040){
  fill(o, 0, o);
  } else if(j>-2295){
  fill(p, 0, p);
  } else if(j>-2805){
  fill (q, q, 0);
  } else {
  fill(r, r, 0);
  }
  
  stroke(0);
  beginShape();
  vertex(-50, -50);
  vertex(0, -100);
  vertex(50, -50);
  vertex(50, 50);
  vertex(0, 100);
  vertex(-50, 50);
  endShape(CLOSE);
  
  beginShape();
  vertex(-25, -25);
  vertex(0, -50);
  vertex(25, -25);
  vertex(25, 25);
  vertex(0, 50);
  vertex(-25, 25);
  endShape(CLOSE);
  
  line(-50, -50, -25, -25);
  line(0, -100, 0, -50);
  line(50, -50, 25, -25);
  line(50, 50, 25, 25);
  line(0, 100, 0, 50);
  line(-50, 50, -25, 25);
  
  rotate(TWO_PI-i);
  
}
  




