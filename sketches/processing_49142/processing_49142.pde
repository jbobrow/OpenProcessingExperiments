
class Circle {

  float x;
  float y;
  float r;

  float xspeed;
  float yspeed;  

  boolean click;

  Circle (float xpos, float ypos, float s) {

    x = xpos;
    y = ypos;
    r = s;

    xspeed = random(-5, 5);
    yspeed = random(-5, 5);

    click = false;
  }

  void speedCircle () {

    x += xspeed;
    y += yspeed;
  }

  void bounceCircle () {

    if ( (x < (0) ) || (x > width - (r) ) ) {

      xspeed = -xspeed;
    }

    if ( (y < (0) ) || (y > height - (r) ) ) {

      yspeed = -yspeed;
    }
  }

  void drawCircle () {

    if (click) {

      fill (0, 255, random (150, 200));
      stroke (0, 255, random (150, 200));
      strokeWeight (random(10, 20));
    } 
    else {

      fill (0, random(150, 200), 255);
      stroke (0, random(150, 200), 255);
      strokeWeight (random (10, 20));
    }
    rect (x, y, r, r);
  }

  void checkMouseClick () {

    if ( (mouseX > x) && (mouseX < x + r) && (mouseY > y) && (mouseY < y + r) ) {

      click = !click;
    }
  }
}


