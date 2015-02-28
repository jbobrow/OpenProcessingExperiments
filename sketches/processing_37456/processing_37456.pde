
void setup() {
  size(300, 300);
  background(0);
  smooth();
}

void draw() {
  colorMode(RGB);
  frameRate(6);


  for (int x=0;x<=width;x+=30) {
    for (int y=0;y<=height;y+=30) {
      fill(random(0, 255), random(0, 255), mouseY, mouseY);
      noStroke();
      rect(x, y, 25, 25);
    }
  }
  for (int x=0;x<=width;x+=30) {
    for (int y=0;y<=height;y+=30) {
      fill(mouseX, random(0, 255), random(0, 255),50);
      noStroke();


      ellipse(x, y, 50, 50);
    }
  }
}


