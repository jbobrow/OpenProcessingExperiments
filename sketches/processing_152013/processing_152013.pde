
int circleX, circleY;
int x, y;

void setup() {
  size (650, 650);
  smooth(20);
  translate(width/2, height/2);
  background(#441D4D);
  fill(#6A2679);
  ellipse(0, 0, 82, 81);
  for (int i=0; i<20; i++) {
    drawCircle("triangle", 20, 1, 127);
  }
  for (int i=0; i<20; i++) {
    drawCircle("vertex", 10, 2, 255);
  }
  for (int i=0; i<30; i++) {
    drawCircle("vertex2", 30, 2, 70);
  }
  for (int i=0; i<30; i++) {
    drawCircle("ellipse", 30, 2, 0);
  }
  for (int i=0; i<50; i++) {
    drawCircle("ellipse2", 20, 2, 0);
  }
}

void drawCircle (String myShape, int count, int myScale, int myColor) {
  fill(#03D7FF);
  if (myShape == "triangle") {
    triangle(130, 75, 58, 20, 86, 75);
  } 
  else if (myShape == "vertex") {
    beginShape();
    fill(#00FF3D);
    stroke(#00FF3D);
    vertex(80, 80);
    vertex(60, 40);
    vertex(60, 40);
    vertex(60, 40);
    vertex(60, 60);
    vertex(30, 60);
    endShape(CLOSE);
  } 
  else if (myShape == "vertex2") {
    strokeWeight(2);
    stroke(#0AE3F5);
    fill(#7D2CDB);
    beginShape();
    vertex(250, 200);
    vertex(180, 200);
    vertex(180, 60);
    vertex(150, 80);
    vertex(150, 220);
    vertex(220, 160);
    endShape(CLOSE);
  } 
  else if (myShape == "ellipse") {
    strokeWeight(2);
    stroke(#7D2CDB);
    fill(#6E88E3);
    ellipse(160, 0, 20, 20);
  } 
  else if (myShape == "ellipse2") {
    strokeWeight(2);
    stroke(#DB2C2C);
    fill(#03D7FF);
    ellipse(360, 0, 30, 30);
  }
  rotate(TWO_PI/count);
}
void draw() {

  x = mouseX;

  y = mouseY;

  if (mouseOverCircle(325, 325, x, y, 100) == true) {

    fill(random(255), random(255), random(255), random(255));
  }

  else {

    fill(#6A2679);
  }

  ellipse(325, 325, 100, 100);
}

boolean mouseOverCircle(int circleX, int circleY, int x, int y, int size) {

  if (dist(circleX, circleY, x, y) < size/2) {

    return true;
  }

  else {

    return false;
  }
}


