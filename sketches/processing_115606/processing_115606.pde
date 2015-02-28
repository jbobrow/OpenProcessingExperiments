
float s=1;
float t=1;
void setup() {
  size(900, 900);
}

void draw() {
  //frameRate(4);
  background(8);
  int m = millis();
  int x, y;
  int numberOfScans = 120;
  float n = noise(1000);

  noFill();
  stroke(225);
  translate(width/2, height/2);
  ellipse(0, 0, 50, 50);

  scale(1+s);
  ellipse(5, 7, 50, 50);

  scale(1-s);
  ellipse(9, 9, 50, 50);
  
  scale(1-s);
  ellipse(0, 0, 50, 50);

  pushMatrix();
  translate((int)random(-10, 10), (int)random(-10, 10));
  scale(1+t);
  ellipse(0, 1, 10, 14);
  popMatrix();



t+=.001;
  s+=.1;
  if (s>5) {
    s=1;
    t=1;
  }
}



