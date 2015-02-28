
// Bryan May
// Oct 2013
// Version ∞
Beast monster;

void setup () {
  size (600, 600);
  monster = new Beast ();
}

void draw () {
  background (128);
  monster.move();
  monster.display();
}

class Beast {
  float x;
  float y;
  float size;
  color furColor;
  float xspeed;
  float bulbX;
  float bulbY;
  float bulbSize;
  
  Beast () {
    x = random (600);
    y = random (600);
    size = random (50, 100);
    furColor = color (random (255), random (255), random (255));
    xspeed = random (5);
    bulbY = y + size / 2;
    bulbSize = random (10, 20);
  }

  void display () {
    y = mouseY;
    ellipseMode (CENTER);
    fill (furColor);
    ellipse (x, y, size, size);
    fill (0);
    ellipse (x - 10, y, bulbSize, bulbSize);
    ellipse (x + 10, y, bulbSize, bulbSize);
    fill (255);
    ellipse (x - 10, y, bulbSize - 2, bulbSize - 2);
    ellipse (x + 10, y, bulbSize - 2, bulbSize - 2);
    rect (x - 1, y, 3, 40);
  }

  void move () {
    x += xspeed;
    if (x > width ) {
      x = 0;
    }
  }
}
