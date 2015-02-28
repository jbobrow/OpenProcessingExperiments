
void setup() {
  size(900, 700);
background(100, 210, 250);
noStroke();
smooth();
}

void draw() {
  drops();
}

void drops() {
  frameRate(12);
  for(int p=0; p<1000; p=p+1) {
  float b=random(255);
  fill(b-50, b+50, b+150);
  float r=random (900);
  ellipse(p, r, b, r/180);
  }
}


