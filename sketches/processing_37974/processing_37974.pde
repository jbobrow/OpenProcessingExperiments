
final int diam = 50;
final int bodyY = 150;
final int armY = 50;
final int armLength = 50;
final int legLength = 50;
final int stepX = 10;

void setup()
{
  smooth();
  size(400, 400);
  stroke(255, 0, 0);
  strokeWeight(3);
  fill(255, 0, 0);
}

void draw()
{
  int timeStep = (millis() / 100) % 40; // 1/10 of a second time steps from 0-39
  println(timeStep);
  
  background(0, 255, 0);

  // stick figure's x moves with timeStep
  // stick figure alternates moving arms up and down based on timeStep
  // draw stick moving rightwards
  if (timeStep < 20) {
    drawStick(100 + (timeStep * stepX), 100, timeStep % 2);
  }
  // draw stick moving leftwards
  else {
    drawStick(100 + (40 - timeStep) * stepX, 100, timeStep % 2);
  }
}

void drawStick(int x, int y, int armsUp)
{
  // head at x, y
  ellipse(x, y, diam, diam);

  // body
  line(x, y, x, y + bodyY);

  // if arms are up, draw a straight arm line
  if (armsUp == 1) {
    line(x - armLength, y + armY, x + armLength, y + armY);
  }
  // else draw diagonally down angle arms
  else {
    line(x, y + armY, x - armLength, y + armY + armLength);
    line(x, y + armY, x + armLength, y + armY + armLength);
  }

  // draw diagonally down legs
  line(x, y + bodyY, x - legLength, y + bodyY + legLength);
  line(x, y + bodyY, x + legLength, y + bodyY + legLength);
}


