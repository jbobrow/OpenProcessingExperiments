
int firstX;
int firstY;

void setup() {
  size(480, 480);
  keyPressed();
}

void draw() {
  if (mousePressed) {
         fill(width,0,10);
    } else {
     stroke(0);
    colorMode(HSB, width, height, 10);
    firstX = mouseX+10;
    firstY = mouseY+10;
    
    for (int i = 0; i < height; i+=firstY) {
      for (int j = 0; j < width; j+=firstX) {
        fill(j, width-i, 50);
      }
    }
    

  }
  ellipse(mouseX, mouseY, 80, 80);
}

void keyPressed() {
if (key == 'c') background(240);
}
