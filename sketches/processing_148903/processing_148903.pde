
float diameter;
float angle = 0;
 
void setup() {
  size(500, 500);
  background(255);
  diameter = 290;
  frameRate(1000);
}
 
void draw() {
  fill(255, 40);
  rect(250, 250, width, height);
  float c = 10 + (sin(angle + PI/2) * diameter/2) + diameter/2;
  rectMode(CENTER);
  noFill();
  for (int i = 75; i < width-25; i = i + 50) {
    for (int j = 75; j < height-25; j = j + 50) {
    if (mousePressed) {
      ellipse(i, j, c, c);
      } else {
      rect(i, j, c, c);
      }
    }
  }
  angle += 0.02;
  filter(BLUR, 1);
}

