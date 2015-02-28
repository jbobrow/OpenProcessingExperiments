
Ball a, b;

void setup()
{
  size(400, 400);
  smooth();
  noStroke();
  a = new Ball();
  b = new Ball();
}
void draw()
{
  transBackground();
  a.run();
  b.run();
}

void transBackground() {
  fill(255, 20); //instead of background, a rectangle with some alpha
  rect(0, 0, width, height);
}

class Ball {
  float xpos, ypos;
  float xspeed, yspeed;
  float r;

  Ball() {
    xspeed = random(-10, 10);
    yspeed = random(-10, 10);
    xpos = width/2;
    ypos = height/2;
    r = random(20, 40);
  }
  void run() {
    update();
    bounce();
    display();
  }

  void update() {
    xpos += xspeed;
    ypos += yspeed;
  }

  void display() {
    fill(200, 20, 150);
    ellipse(xpos, ypos, r*2, r*2);
  }


  void bounce() {
    if ( (ypos > height-r) || (ypos < r))
    {
      yspeed *= -1;
    }
    if ( (xpos > width-r) || (xpos < r))
    {
      xspeed *= -1;
    }
  }
}



