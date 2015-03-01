
float diameter;
float angle = 0;
 
void setup() {
  size(500, 500);
  background(0);
  diameter = 500;
}
 
float xs = 0;
 
void draw() {
  noStroke();
  fill(0, 5);
  rect(0, 0, 500, 500);
  float c = 10 + (sin(angle + PI/2) * diameter/2) + diameter/2;
  xs = xs + .01;
  float n = noise(xs) * width;
  angle += 0.05;
  fill(random(50,200), random(50, 200), random(50, 200));
  if (mousePressed) {
  ellipse(c, n, n/2, n/2);
  }
  
}

