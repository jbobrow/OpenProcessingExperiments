
// Konkuk University
// Department of Dynamic Media
// SOS iDesign
// Name: KIMSungUk
// ID : 201420068

int x = 5;
int y = 5;
int xspeed = 4;
int yspeed = 8;
float t = 0.;
int c = 0;
int k = 0;
 
 
void setup() {
  size(600, 600);
  smooth();
}
 
void draw() {
  background(0);
  float c = map(noise(t), 0., 1., 0., height);
  fill(0, 223, 255, 56);
  ellipse(c, 10, 150, 150);
  t = t+0.001;
  strokeWeight(75);
  stroke(map(noise(t), 0., 1., 0, 255), 0, 255);
  line(k % width, 600, k % height, 0);
  stroke(map(noise(t), 0., 1., 0, 255), 110, 255);
  line(k % height/2, width, k % width/2, 0);
  t = t+0.01;
  k++;
 
 
  x = x + xspeed;
  y = y + yspeed;
 
  if ((x > width/2) || (x < 0)) {
 
    xspeed = xspeed * -1;
  }
  if ((y > height/2) || (y < 0)) {
 
    yspeed = yspeed * -1;
  }
 
 
 
  noStroke();
  fill(x, 0, y);
  triangle(width/2, 0, height/2, 0, width/2, height/2);
  fill(y, 0, x, 255);
  bezier(width, height/2, height/2, 0, width/2, 0, x, y);
  fill(255, x, y);
  bezier(0, 0, width/2, height/2, width/2, 0, x, y);
}
