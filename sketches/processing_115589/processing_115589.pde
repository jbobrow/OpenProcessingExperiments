
float s=1;
float t=1;
void setup() {
  size(600, 600);
}

void draw() {
  //frameRate(24);
  background(5);
  int m = millis();
  int x, y;
  int numberOfScans = 50;
  float n = noise(0);

  noFill();
  stroke(255);
  translate(width/2, height/2);
  ellipse(0, 0, 50, 50);

  scale(1+s);
  ellipse(0, 0, 50, 50);

  scale(1-s);
  ellipse(0, 0, 50, 50);
  
  scale(1-s);
  ellipse(0, 0, 50, 50);

  pushMatrix();
  translate((int)random(-10, 10), (int)random(-10, 10));
  scale(1+t);
  ellipse(0, 0, 10, 10);
  popMatrix();



t+=.001;
  s+=.1;
  if (s>5) {
    s=1;
    t=1;
  }
}



