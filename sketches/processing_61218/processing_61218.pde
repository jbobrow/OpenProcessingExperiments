
class Blah {

  float xpos;
  float ypos;
  float speed;
  float radius;
  float vx, vy;
  float type;
  float r;

  Blah(float tempx, float tempy, float tempSpeed, float tempRadius, float tempr) {

    xpos = tempx;
    ypos = tempy;
    speed = tempSpeed;
    radius = tempRadius;
    r = tempr;
  }

  void reset() {
    ypos = random(0, -10);
    xpos = random(150, 250);
    vy = 0;
    vx = 0;
    r = random(0, 255);
  }

  void display() {
    strokeWeight(1);
    fill(r, 0, 0);
    ellipse(xpos, ypos, radius, radius);
  }
  void checkL1() {
    if (xpos > 130 && xpos < 270 && ypos < 450) {

      float angle = atan2(450-400, 150);
      float cosa = cos(angle);
      float sina = sin(angle);

      float x1 = xpos - l1.x;
      float y1 = ypos - l1.y;

      float xr = cosa * x1 + sina * y1;
      float yr = cosa * y1 - sina * x1;

      float vxr = cosa * vx + sina * vy;
      float vyr = cosa * vy - sina * vx;

      if (yr > 0) {
        yr = 0;
        vyr *= -.3;
      }

      x1 = cosa * xr - sina * yr;
      y1 = cosa * yr + sina * xr;
      vx = cosa * vxr - sina * vyr;
      vy = cosa * vyr + sina * vxr;

      xpos = l1.x + x1;
      ypos = l1.y + y1;
    }
  }

  void checkL2() {
    if (xpos > 150 && xpos < 270) {

      float angle = atan2(450-400, 150);
      float cosa = cos(angle);
      float sina = sin(angle);

      float x1 = xpos - l2.x;
      float y1 = ypos - l2.y;

      float xr = cosa * x1 + sina * y1;
      float yr = cosa * y1 - sina * x1;

      float vxr = cosa * vx + sina * vy;
      float vyr = cosa * vy - sina * vx;

      if (yr > 0) {
        yr = 0;
        vyr *= -.3;
      }

      x1 = cosa * xr - sina * yr;
      y1 = cosa * yr + sina * xr;
      vx = cosa * vxr - sina * vyr;
      vy = cosa * vyr + sina * vxr;

      xpos = l2.x + x1;
      ypos = l2.y + y1;
    }
  }
  void checkL3() {
    if (xpos > 300 && xpos < 400) {

      float angle = atan2(550-500, 100);
      float cosa = cos(angle);
      float sina = sin(angle);

      float x1 = xpos - l3.x;
      float y1 = ypos - l3.y;

      float xr = cosa * x1 + sina * y1;
      float yr = cosa * y1 - sina * x1;

      float vxr = cosa * vx + sina * vy;
      float vyr = cosa * vy - sina * vx;

      if (yr > 0) {
        yr = 0;
        vyr *= -.2;
      }

      x1 = cosa * xr - sina * yr;
      y1 = cosa * yr + sina * xr;
      vx = cosa * vxr - sina * vyr;
      vy = cosa * vyr + sina * vxr;

      xpos = l3.x + x1;
      ypos = l3.y + y1;
    }
  }
  void checkL4() {
    if (xpos > 400 ) {

      float angle = atan2(500-550, 100);
      float cosa = cos(angle);
      float sina = sin(angle);

      float x1 = xpos - l4.x;
      float y1 = ypos - l4.y;

      float xr = cosa * x1 + sina * y1;
      float yr = cosa * y1 - sina * x1;

      float vxr = cosa * vx + sina * vy;
      float vyr = cosa * vy - sina * vx;

      if (yr > 0) {
        yr = 0;
        vyr *= -.2;
      }

      x1 = cosa * xr - sina * yr;
      y1 = cosa * yr + sina * xr;
      vx = cosa * vxr - sina * vyr;
      vy = cosa * vyr + sina * vxr;

      xpos = l4.x + x1;
      ypos = l4.y + y1;
    }
  }
}


