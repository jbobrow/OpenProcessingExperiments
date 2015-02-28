
//changing color and erasing background
//drawing shapityshapes

boolean squaredraw = false;
boolean linedraw = true;

void setup() {
  size(800,600);
  background(255);
  rectMode(CENTER);
}

void draw() {
  mouseline();
}

void keyReleased() {
 if (key == '1') {
   stroke(250, 200, 0);
 }
 else if (key == '2') {
   stroke(0, 250, 200);
 }
 else if (key == '3') {
   stroke(200, 0, 250);
 }
 else if (key == '4') {
   stroke(0, 0, 0);
 }
 else if (key == '5') {
   squaredraw = true;
   linedraw = false;
 }
 else if (key == '0') {
   linedraw = true;
   squaredraw = false;
 }
 else if (key == ENTER) {
   background(255);
 }
}

void mouseline() {
  if (mousePressed==true) {
    if (linedraw==true) {
      line(mouseX, mouseY, pmouseX, pmouseY);
    }
    if (squaredraw==true) {
      rect(mouseX, mouseY, 10, 10);
    }
  }
}

