
float x1;
float y1;
float x2;
float y2;
boolean start;
boolean drawer;

void setup() {
  size(500, 500);
  background(0);
  start = false;
  frameRate(10);
}

void mousePressed() {

  drawer = true;
  start =true;



  if (key =='c') {
    stroke(random(0, 255), random(0, 255), random(0, 255));
    strokeWeight(5);
  } else if (key =='d') {
    stroke(0);
    strokeWeight(40);
  } else if (key =='b') {
    stroke(random(155, 255));
    strokeWeight(5);
  }
}
void mouseReleased() {
  drawer = false;
}
void draw() {
  if (drawer == true && start == true) {
    x2 = x1;
    y2 = y1;
    x1 = mouseX;
    y1 = mouseY;
    line(x1, y1, x2, y2);
  }
}

