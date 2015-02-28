
Levi [] heichous = new Levi[500];

void setup() {
  size(500, 500);
  smooth();
  noStroke();
  for (int i = 0; i < heichous.length; i++)  {
    float x = random(width);
    float y = random(height);
    int r = i /8;
    heichous[i] = new Levi (x, y, r);
  }
}

void draw () {
  background(255, 250, 198);
  fill(mouseX, mouseY, 190, 60);
  for (int i = 0; i <heichous.length; i++) {
    heichous[i].move();
    heichous[i].display();
  }
}

class Levi {
  float x;
  float y;
  int diameter;
  float speed = 2.5;

  Levi(float tempX, float tempY, int tempDiameter) {
    x = tempX;
    y = tempY;
    diameter = tempDiameter;
  }

  void move() {
    x += random(speed, speed);
    y += random(-speed, speed);
  }

  void display() {
    ellipse((x*2)%width, y, diameter, diameter);
  }
}


