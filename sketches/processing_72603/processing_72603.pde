
boolean beginRect = true;
int mouseDownX;
int mouseDownY;
int canvasWidth = 900;
int canvasHeight = 600;

void setup() {
size(canvasWidth,canvasHeight);
background(0);
}

void draw() {
  if (mousePressed) {
    stroke(255);
    fill(random(0,255),random(0,255),random(0,255),random(0,200));
    ellipse(random(0,canvasWidth),random(0,canvasHeight),random(0,100),random(0,100));
    if (beginRect) {
      mouseDownX = pmouseX;
      mouseDownY = pmouseY;
      beginRect = false;
    }
  }
}

void mouseReleased() {
  rect(mouseDownX,mouseDownY,pmouseX - mouseDownX,pmouseY - mouseDownY);
  beginRect = true;
}
