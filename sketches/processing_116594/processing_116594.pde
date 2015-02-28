
float x, y,z, diam;
float r, g, b, a;
float xAdd, yAdd, zAdd, reachX, reachY, reachZ;
 
void setup(){
  size(1000,500,P3D);
  background(0);
  smooth();
  x = random(height);
  y = random(width);
  z = random(10);
  r = random(255);
  g = random(255);
  b = random(255);
  a = random(20,50);
 frameRate(5);
}
void draw(){
  diam =random(5);
  xAdd = random(10,40);
  yAdd = random(10,20);
  zAdd = random(10,30);
  reachX = random(2);
  reachX = round(reachX);
  reachX = width *reachX;
  reachY = height/2;
  reachZ = width/2;
  stroke(255, 10, 0);
  fill(r,g,b,a);
  stroke(r,g,b,a);
  strokeWeight(5);
  ellipseMode(CENTER);
  ellipse(x%width, y%height, diam, diam);
    line(x%width, y%height, reachX, reachY);
  strokeWeight(5);
  stroke(r,g,b,3);
  point(x,y,z);
    
  y=y + yAdd;
  x=x + xAdd;
  z=z + zAdd;
}
