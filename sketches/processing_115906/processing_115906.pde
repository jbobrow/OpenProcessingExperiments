
float x, y, diam;
float r, g, b, a;
float xAdd, yAdd, reachX, reachY;

void setup(){
  size(1000,500);
  background(0);
  smooth();
  x = random(height);
  y = random(width);
  r = random(255);
  g = random(255);
  b = random(255);
  a = random(1,30);
 frameRate(20);
}
void draw(){
  diam = random(50);
  xAdd = random(-40,30);
  yAdd = random(-30,30);
  reachX = random(1);
  reachX = round(reachX);
  reachX = width * reachX;
  reachY = height/2;
  fill(r,g,b,a); 
  stroke(r,g,b,a);
  strokeWeight(9);
  ellipseMode(CENTER);
  ellipse(x%width, y%height, diam, diam);
  stroke(r,g,b,21);
  line(x%width, y%height, reachX, reachY);
  strokeWeight(5);
  point(x,y);
  y = y + yAdd;
  x = x + xAdd;
}
