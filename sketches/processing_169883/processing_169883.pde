
//Homework: Create a Clock by Leiah Fournier
//CREDIT: Thanks Rafi for all the help!

float secondsAngle;
float minutesAngle;
float hoursAngle;

PImage moon;

void setup() {
  smooth();
  size(800, 800);

  moon = loadImage("moon.png");
}
void draw() {
  background(0);

  secondsAngle = map(second(), 0, 59, -HALF_PI, HALF_PI);
  minutesAngle = map(minute(), 0, 59, -HALF_PI, HALF_PI);
  hoursAngle = map(hour(), 0, 23, -HALF_PI, HALF_PI);

  //Arc
  noFill();
  stroke(255);
  strokeWeight(10);
  float x = width/2;
  float y = 100;
  float d = width - 200;
  pushMatrix ();
  translate(width, height);
  rotate(PI);
  arc(x, y, d-20, d-20, 0, PI);
  popMatrix();

  //Lines
  strokeWeight(1);

  pushMatrix();
  translate(width/2, 700);
  rotate(-HALF_PI);
  line(0, -290, 0, 0);
  popMatrix();

  pushMatrix();
  translate(width/2, 700);
  rotate(-HALF_PI*.25);
  line(0, -290, 0, 0);
  popMatrix();

  pushMatrix();
  translate(width/2, 700);
  rotate(-HALF_PI*.50);
  line(0, -290, 0, 0);
  popMatrix();

  pushMatrix();
  translate(width/2, 700);
  rotate(-HALF_PI*.75);
  line(0, -290, 0, 0);
  popMatrix();

  pushMatrix();
  translate(width/2, 700);
  rotate(0);
  line(0, -290, 0, 0);
  popMatrix();

  pushMatrix();
  translate(width/2, 700);
  rotate(HALF_PI*.25);
  line(0, -290, 0, 0);
  popMatrix();

  pushMatrix();
  translate(width/2, 700);
  rotate(HALF_PI*.50);
  line(0, -290, 0, 0);
  popMatrix();

  pushMatrix();
  translate(width/2, 700);
  rotate(HALF_PI*.75);
  line(0, -290, 0, 0);
  popMatrix();

  pushMatrix();
  translate(width/2, 700);
  rotate(HALF_PI);
  line(0, -290, 0, 0);
  popMatrix();

  //MOON (SECONDS)
  pushMatrix();
  translate(width/2, 700);
  rotate(secondsAngle);
  image(moon, -25, -320, 50, 50);
  popMatrix();

  //MOON (MINUTES)
  pushMatrix();
  translate(width/2, 700);
  rotate(minutesAngle);
  image(moon, -25, -250, 75, 75);
  popMatrix();

  //MOON (HOURS)
  pushMatrix();
  translate(width/2, 700);
  rotate(hoursAngle);
  image(moon, -25, -175, 100, 100);
  popMatrix();
}



