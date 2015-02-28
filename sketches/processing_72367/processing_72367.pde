
class Car {
  color c;
  float x, y, w, h;
  float xspeed;
  Car(float tempX, float tempY, float tempW, float tempH) {
    x = tempX;
    y = tempY;
    w = tempW;
    h = tempH;
  }

  Car() {
    c = color(255);
    rect(x, y, w, h);
  }

  void jiggle (float speed) {
    x = x + random(-1, 1)*speed;
    y = y + random(-1, 1)*speed;

    x = constrain(x, 0, width);
    y = constrain(y, 0, height);
  }

  void display() {
    {
      rectMode(CENTER);
      fill(c);
      rect(x, y, 100, 50);
    }

    rect(x-30, y+25, 20, 10);
    rect(x+30, y+25, 20, 10);
    rect(x-30, y-25, 20, 10);
    rect(x+30, y-25, 20, 10);
    fill(0);
  }

  void drive() {
    x = x + xspeed;
    if (x > width) {
      x = 0;


      switch (keyCode) {   
      case LEFT:
        r = 255;
        g = 0;
        b = 255; 
        break;
      case RIGHT:
        r = 255;
        g = 255;
        b = 0;
        break; 
      case UP:
        r = 255;
        g = 255;
        b = 255;
      case DOWN:
        r = 200;
        g = 0;
        b = 0;
      default: 
        break;
      }
    }
  }
}


