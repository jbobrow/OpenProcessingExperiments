
boolean flipFlop = false;
float circleA;
float circleB;
float circleC;
float circleD;
float changeA;
float changeB;
 
void setup() {
  size(700, 400);
  background(255, 255, 255);
}
 
void draw() {
  if (mousePressed) {
    fill(circleA, circleB, circleC);
  } 
  else {
    fill (color(circleA, circleB, circleC));
    circleA = random(0, 255);
    circleB = random(0, 255);
    circleC = random(0, 255);
    circleD = random(5, 175);
  }
  ellipse(mouseX, mouseY, changeA, changeB);
  stroke(color(circleA, circleB, circleC));
  changeA = circleD;
  changeB = circleD;
}



