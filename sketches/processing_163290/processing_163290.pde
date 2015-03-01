
void setup() {
  size(720, 480);
  smooth();
}

void draw() {
  background (204);
  drawRobot(110, 110);
  drawRobot(333, 247);
  drawRobot(647, 340);
  drawRobot(619, 100);
  drawRobot(222, 333);
  drawRobot(456, 100);
  drawRobot(250, 80);
  drawRobot(510, 320);
  drawRobot(mouseX, mouseY);
}

void drawRobot(int x, int y) {
  pushMatrix();
  translate(x, y);
  strokeWeight(2);
  fill(134, 125, 110);
  arc(8, -24, 30, 11, radians(180), radians(360)); //cap
  rect(-22.5, 20, 50, 5);  //neck
  rect(-51, 25, 104, 29);
  ellipse(0, -0.7, 100, 47); //head
  //eyes
  fill(106, 116, 99);
  ellipse(-40, 0, 20, 28);
  ellipse(-13, 5, 15, 15);
  ellipse(23, 3, 17, 17);
  ellipse(45, 2, 10, 15);  
  //bottom
  fill(134, 125, 110);
  rect(-23, 55, 50, 10);
  strokeWeight(4);
  stroke(75, 68, 58);
  //arm-1
  line(5, 55, 10, 105);
  line(10, 105, -20, 130);
  line(-20, 130, 15, 135);
  //arm-2
  line(-35, 55, -37, 105);
  line(-37, 105, -34, 135);
  //arm-3
  line(-34, 55, -34.5, 56);
  line(-34.5, 60, -5, 69);
  line(-5, 69, -7, 109);
  //arm-4
  line(30, 55, 50, 70);
  line(50, 70, 35, 105);
    popMatrix();
}
