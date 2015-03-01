
class Slime1 {
  int radius = 40;
  int x = 200;
  int y = 200;
  int xPos, yPos;
  int speedY=5;
 
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
    yPos = y+speedY;
    
      fill (245,22,37);
    arc(xPos,yPos,100,100,radians(180),radians(360));
      fill (255,255,255);
    ellipse(xPos+26,yPos-24,16,16);
    
    
  }
}
 
boolean yIncrease, yDecrease, xIncrease, xDecrease, YIncrease, YDecrease, XIncrease, XDecrease;
 
 
 
Slime1 b = new Slime1();
Slime2 c = new Slime2();
 
 
void setup()
{
  size(1000, 600);
}
 
void draw()
{
 noStroke();
background(5,186,255);
fill(149,151,152);
rect (0,500,1000,100);
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
 
class Slime2 {
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
     fill (18,277,5);
    arc(xPos,yPos,100,100,radians(180),radians(360));
      fill (255,255,255);
    ellipse(xPos-26,yPos-24,16,16);
  }
}
