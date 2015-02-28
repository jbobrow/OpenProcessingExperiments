
int n = 300;

void setup() {
 size(n,n); 
 background(255);
 smooth();
 frameRate(5);
}

void draw() {
  float r = random(n);
  fill(random(255),random(255),random(255));
  ellipse(random(n),random(n),r,r);
}

void mousePressed() {
  background(255);
}
