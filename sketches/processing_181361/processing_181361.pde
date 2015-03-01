
dott [] dottGroup = new dott[6];

void setup() {
  size(400, 400);

  for (int i = 0; i < dottGroup.length; i++) {
    dottGroup[i] = new dott();
  }
}

void draw() {
  background(0);
  
  for(int i = 0; i < dottGroup.length; i++) {
    dottGroup[i].run();
  }
}

class dott {
  float x = random(50, width-50);
  float y = random(50, height-50);

  float moveX = random(-1, 1);
  float moveY = random(-1, 1);
  
  float margin = 50;

  void run() {
    display();
    move();
    bounce();
    gravity();
  }

  void display() {
    ellipse(x, y, 5, 5);
  }

  void move() {
    x = x + moveX;
    y = y + moveY;
  }

  void bounce() {
    if (x > width-margin) {
      moveX = -moveX;
    }

    if (x < 0+margin) {
      moveX = -moveX;
    }

    if (y > height-margin) {
      moveY = -moveY;
    }

    if (y < 0+margin) {
      moveY = -moveY;
    }
  }
  
  void gravity() {
    if(y > 0) {
      moveY += 0.9;
    }
    
    if(y > height-margin) {
      y = height-margin;
    }
  }
}

