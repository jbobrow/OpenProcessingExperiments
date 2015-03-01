
class Big_Ball {
  int radius = 40;
  int x = 200;
  int y = 200;
  int xPos, yPos;

  void update() {
    if (YIncrease == true && y < height - radius/2) {
      y = y + 6;
    }
    if (YDecrease == true && y > radius/2) {
      y = y - 6;
    }
    if (XIncrease == true && x < width - radius/2) {
      x = x + 6;
    }
    if (XDecrease == true && x > radius/2) {
      x = x - 6;
    }
  }
  void display() {
    noStroke();
    fill(0, 250, 0);
    xPos = x;
    yPos = y;
    ellipse(xPos, yPos, radius, radius);
  }
}

boolean yIncrease, yDecrease, xIncrease, xDecrease, YIncrease, YDecrease, XIncrease, XDecrease;



Big_Ball b = new Big_Ball();
Small_Ball c = new Small_Ball();


void setup()
{
  size(500, 500);
}

void draw()
{
  background(200, 200, 255);
  b.update();
  b.display();
  c.update();
  c.display();
}

void keyPressed() {
  if (keyCode == UP) {
    yDecrease = true;
  }
  else if (keyCode == DOWN) {
    yIncrease = true;
  }
  else if (keyCode == RIGHT) {
    xIncrease = true;
  }
  else if (keyCode == LEFT) {
    xDecrease = true;
  }
  else if (key == 'w') {
    YDecrease = true;
  }
  else if (key == 's') {
    YIncrease = true;
  }
  else if (key == 'd') {
    XIncrease = true;
  }
  else if (key == 'a') {
    XDecrease = true;
  }
}

void keyReleased() {
  if (keyCode == UP) {
    yDecrease = false;
  }
  else if (keyCode == DOWN) {
    yIncrease = false;
  }
  else if (keyCode == RIGHT) {
    xIncrease = false;
  }
  else if (keyCode == LEFT) {
    xDecrease = false;
  }
  else if (key == 'w') {
    YDecrease = false;
  }
  else if (key == 's') {
    YIncrease = false;
  }
  else if (key == 'd') {
    XIncrease = false;
  }
  else if (key == 'a') {
    XDecrease = false;
  }
}

class Small_Ball {
  int radius = 20;
  int x = 100;
  int y = 100;
  int xPos, yPos;

  void update() {
    if (yIncrease == true && y < height - radius) {
      y = y + 8;
    }
    if (yDecrease == true && y > radius) {
      y = y - 8;
    }
    if (xIncrease == true && x < width - radius) {
      x = x + 8;
    }
    if (xDecrease == true && x > radius) {
      x = x - 8;
    }
  }
  void display() {
    noStroke();
    fill(0, 250, 250);
    xPos = x;
    yPos = y;
    ellipse(xPos, yPos, radius, radius);
  }
}



