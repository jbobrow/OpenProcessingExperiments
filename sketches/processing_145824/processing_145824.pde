
int n = 300;

void setup() {
 size(n,n); 
 background(255);
 smooth();
 frameRate(5);
 noStroke();
}

void draw() {
  float x = random(n);
  fill(random(255),random(255),random(255),random(255));
  ellipse(random(n),random(n),x,x);
}

void mousePressed() {
  background(255);
}
