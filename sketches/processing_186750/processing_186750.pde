
float x1;
float y1;
float x2;
float y2;
boolean drawer;
boolean COL;
void setup() {
  size(500, 500);
  background(255);
  key = 's';
}
void keyPressed() {
  if (key =='s') {
    drawer = true;
  } else { 
    drawer = false;
  }
  COL = true;
}
void draw() {
  if (key == 'a') {

  if (COL == true) {
    x1 = mouseX;
    y1 = mouseY;
    COL = false;
  } else {
    x2 = x1;
    y2 = y1;
    x1 = mouseX;
    y1 = mouseY;
  }
  if (mousePressed == true) {
    stroke(random(0, 255),random(0, 255),random(0, 255));
  } else {
  stroke(random(0, 255));
    strokeWeight(2);
  }
  line(x1, y1, x2, y2);
  }
}

