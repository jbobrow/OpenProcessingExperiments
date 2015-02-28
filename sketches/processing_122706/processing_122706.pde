
int x, y, a, b, c, d, e;
int space = 0;
int sw=4;

void setup() {
  size(600, 600);
  background(255);
  smooth();
  noStroke();
  a = 0;
  b = 0;
  c = 0;
  d = 10;
  e = 10;
}

void draw() {
  strokeWeight(sw);
  line(mouseX, mouseY, pmouseX, pmouseY);
}

void mouseDragged() {
  fill(a, b, c);
  ellipse(mouseX, mouseY, 10, 10);
  fill(255);
}


void keyPressed() {
  if (key == CODED) {
    if (keyCode == SHIFT) {

      rect(0, 0, 600, 600);
    }
    else if (keyCode == LEFT) {
      a = 0;
      b = 0;
      c = 0;
    }
    else if (keyCode == UP) {
      a = 100;
      b = 255;
      c = 200;
    }
    else if (keyCode == RIGHT) {
      a = 170;
      b = 10;
      c = 150;
    }
    else if (keyCode == DOWN) {
      a = 0;
      b = 0;
      c = 255;
    }

    else if (keyCode == ALT) {
      d = 20;
      e = 20;
      a = 255;
      b = 255;
      c = 255;
    
    //if (key=='1') {
     //sw=1;
    
    //if (key=='2') {
      //sw=2;
    
    //if (key=='3') {
      //sw=3;
    
    //if (key=='5') {
      //sw=5;
    }
  }
}



