
float x;
float y;

void setup() {
  size(600, 300);
  background(0);

  smooth();
}

void draw() {
  noStroke();
  fill(0, 30);
  rect(0, 0, width, height);

  for (int i = 0;i < 35;i++) {
    y = 100*sin(x+i);
    fill(255);
    rect(i*30, y+height/2, 25, 25);
  }
  x += 0.07;
}


