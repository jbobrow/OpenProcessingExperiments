
float t = 0.0; 
float inc = 0.01;

void setup() {
size(300, 300, P3D); 
smooth();
lights();
}

void draw() {
//  frameRate(5);
  background(255);
  float n = noise(t)*width; 
  t= t+inc; 
  fill(100); 
//  noStroke();
//  ellipse(width/2, height/2, n, n);
pushMatrix();
translate(width/2,height/2);
sphere(n); 
popMatrix();
}




