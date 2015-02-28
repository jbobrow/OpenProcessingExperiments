
float myRed;
float myGreen;

float hourX;
float minuteX;
float secondX;

void setup() {
  size(500, 150);
  noStroke();
}

void draw() {
  myRed = map(mouseX, 0, width, 0, 255);
  myGreen = map(mouseY, 0, height, 0, 255);

  fill(myRed, myGreen, 100);
  rect(0, 0, width, height);

  fill(240);

  hourX = map(hour(), 0, 23, 0, (width-10));
  minuteX = map(minute(), 0, 59, 0, (width-10));
  secondX = map(second(), 0, 59, 0, (width-10));

  fill(255, 255, 255, 70);
  ellipse(hourX, 55, 100, 100);
  fill(255, 255, 255, 70);
  ellipse(minuteX, 110, 50, 50);
  fill(255, 255, 255, 70);
  ellipse(secondX, 140, 10, 10);
}



