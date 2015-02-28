
class Duck {

  float x = 0;
  float y = 0;

  float velX = 0;
  float velY = 0;

  float duckWidth = 148;
  float duckHeight = 116;

  float circleSize = 26;

  boolean enabled = true;

  Duck (float xpos, float ypos, float velx, float vely) {

    x = xpos;
    y = ypos;

    velX = velx;
    velY = vely;
  }

  void update () {

    if (!enabled) return;

    x += velX;
    y += velY;

    imageMode (CENTER);


    image (duckImage, x, y, duckWidth / 2, duckHeight / 2);

    noFill ();
    ellipse (x - 5, y + 13, circleSize, circleSize);
  }

  boolean hitTest (int xpos, int ypos) {

    return (dist (x - 5, y + 13, xpos, ypos) < circleSize / 2);
  }
}


