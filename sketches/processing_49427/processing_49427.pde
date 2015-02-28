
Circle [] circles = new Circle [100];

void setup () {

  size (400, 400);
  smooth ();
  noStroke ();

  for (int i = 0; i < circles.length; i++) {

    circles[i] = new Circle (random(100, 300), random(100, 300), random (10, 100));
  }
}

void draw () {

  background(50);

  for (int i = 0; i < circles.length; i++) {

    circles[i].drawCircle ();

    circles[i].speedCircle ();

    circles[i].bounceCircle ();
  }
    
}

class Circle {

  float x;
  float y;
  float r;

  float xspeed;
  float yspeed;  

  Circle (float xpos, float ypos, float s) {

    x = xpos;
    y = ypos;
    r = s;

    xspeed = random(-10, 10);
    yspeed = random(-10, 10);
  }

  void speedCircle () {

    x += xspeed;
    y += yspeed;
  }

  void bounceCircle () {

    if ( (x < (r/2) ) || (x > width - (r/2) ) ) {

      xspeed = -xspeed;
    }

    if ( (y < (r/2) ) || (y > height - (r/2) ) ) {

      yspeed = -yspeed;
    }
  }

  void drawCircle () {

    fill (0, random(150, 200), 255);
    stroke (0, random(150, 200), 255);
    strokeWeight (random (10, 20));
    ellipse (x, y, r, r);
  }
}

