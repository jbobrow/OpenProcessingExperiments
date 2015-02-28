
void setup() {
  size(800, 100);
  background(255);
  noStroke();
  smooth();
}

void draw() {
  float s = random(0, 50);
  for (int i=0;i<width;i=i+100) {
    fill(random(0,255),random(0,255));
    rect(i,0,100,height);
  }
}


