
float x1;
float y1;
float x2;
float y2;
boolean drawer;
boolean start;
void setup() {
  size(500, 500);
  background(255);
  //  key = 'a';
  start = false;
}
void keyPressed() {
  if (key =='a') {
    drawer = true;
    x1 = mouseX;
    y1 =mouseY;
    start = true;
  } else { 
    drawer = false;
  }
}
void draw() {
  if (drawer == true && start == true) {
    x2 = x1;
    y2 = y1;
    x1 = mouseX;
    y1 = mouseY;
    line(x1, y1, x2, y2);
  }
  if (mousePressed == true) {
    stroke(random(0, 255), random(0, 255), random(0, 255));
  } else {
    stroke(random(0, 255));
    strokeWeight(2);
  }
  
}

