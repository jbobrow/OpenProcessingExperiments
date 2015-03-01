
float angle = 0.0;
PImage img;

int xPosition;
int yPosition;
int time = millis();

float xSpeed;
float ySpeed;

void setup() {
  size(500, 700);
  smooth();
  background(255);
  img = loadImage("achtergrond.png");
  image(img, 0, 0);

  xPosition = width / 2;
  yPosition = height / 2;
  xSpeed = random(-2,2); // dit zorgt voor random richting dat het op gaat.
  ySpeed = random(-2,2);
}

void draw() {
  noStroke();
  translate(width/2, height/2);
  rotate(angle);
  fill(255);
  int passedMillis = millis() - time; // calculates passed milliseconds
  if(passedMillis >= 30){
      time = millis();
      fill(0);  // if more than 215 milliseconds passed set fill color to red
  }
  rectMode(CENTER);
  rect(xPosition, yPosition, 100, 100);
  angle += -0.1;

  xPosition += xSpeed; // xPosition = xPosition + xSpeed
  yPosition += ySpeed;

  if  ((xPosition <= 0) || (xPosition >= width)) {
    xSpeed *= -1;
  }
  if  ((yPosition <= 0) || (yPosition >= width)) {
    ySpeed *= -1;
  }
}
//  void keyPressed() {
//    saveFrame();}





