
void setup() {
  size(800, 600);
}

float x1 = 0;

void draw() {

  background(#B4EAFF);
  noStroke();
  fill(#3ca3ff);
  rect(0, 0, 800, 320);
  fill(#fff76e);
  ellipse(700, 100, 100, 100);
  fill(#b4eaff);
  for (float x = 0; x<=800; x+=0.1) {
    float y = sin(x);
    ellipse(20*x, 20*y+300, 5, 5);
  }
  fill(#62380C);
  float y1 = sin(x1);
  rect(20*x1-10, 20*y1+290, 30, 10);
  fill(255);
  rect(20*x1-3, 20*y1+288, 15, -20); 
  fill(#62380C);
  rect(20*x1, 20*y1+290, 3, -22); 
  x1+=0.08;
}

