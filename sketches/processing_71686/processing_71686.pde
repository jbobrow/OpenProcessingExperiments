
int count = 0;

void setup() {
  size(1000, 800);
  rectMode(CENTER);
  smooth();
}

void draw() {
  background(222, 240, 255, 40);
  noStroke();
  translate(width/2, height/2);
  for (int i = 0; i<width;i+=10) {
    rotate(radians(map(mouseX, 0, width, 0, 180))+
      radians(map(mouseY, 0, height, 0, 180))+count);
    drawRect(0, i, 50, i);
    drawRect(0, i/2, 100, i);
    if (mousePressed==true) {
      count++;
    }
  }
}

void drawRect(int xVal, int yVal, int rectSize, int rectFill) {
  fill(random(200, rectFill), random(100, rectFill), random(50, rectFill), 150);
  rect(xVal, yVal, rectSize, rectSize);
}


