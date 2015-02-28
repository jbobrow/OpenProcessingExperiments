
float vel=50;
float movx=0;
float movy=2;
 
void setup() {
  size(900, 500);
  background(255);
  frameRate(15);
  smooth();
}
 
void draw() {
  noStroke();
  fill(355, 2);
  rect(0, 0, width, height);
  float col=random(222, 60);
  fill(222,7,7, col);
  stroke(0, 10);
  float tamx = random(10, 40);
  float tamy = random(10, 40);
 
 
  float incx = noise(vel);
 
  movx += vel+incx;
 
  movy=random(height);
 
  rect(movx, movy, tamx, tamy); 
  stroke(0, random(60));
  line(0, 0, movx, movy);
  line(width, 0, movx+tamx, movy);
  line(width, height, movx+tamx, movy+tamy);
  line(0, height, movx, movy+tamy);
 
pushMatrix();
translate(movx+(tamx/2),movy+(tamy/2));
line(-20,0,10,0);
line(0,-20,0,10);
popMatrix();
 
 
  if ((movx > width) || (movx < 0)) {
    vel = vel * -1;
  }
}



