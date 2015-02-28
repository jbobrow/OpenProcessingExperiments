
float t = 0;

void setup() {
  size(500, 500);
  background(255);
  frameRate(5000);
}

void draw() {
  noStroke();
  float t1 = t - random(10, 20);
  float t2 = random(-10, 510);
  float t3 = t2+random(10, 20);
  float t4 = t2+random(5, 15);
  fill(100, t2/2, t/2);
  triangle(t2, t, t3, t, t4, t1); 
  if(t > 510) {
    t = 0;
  }
  t = t+.1;
  if (mousePressed) {
    background(255);
  }
}
