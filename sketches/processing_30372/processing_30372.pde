
float body_x;
float body_y;

void setup()
{
  size(500, 500);
  rectMode(CENTER);
  smooth();
  body_x = width/2;
  body_y = height/2;
}

void draw()
{
  background(255);
  body(body_x, body_y);
  arm(body_x-30, body_y);
  arm(body_x+30, body_y);
}

void arm(float xpos, float ypos)
{
  float angle = atan2(mouseY - ypos, mouseX - xpos);

  pushMatrix();
  translate(xpos, ypos);
  rotate(angle);
  rect(25, 0, 50, 10);
  popMatrix();
}

void body(float x, float y)
{
  ellipse(x, y, 60, 100);
  ellipse(x-10, y-20, 5, 7);
  ellipse(x+10, y-20, 9, 8);
  arc(x, y, 20, 20, radians(30), radians(150));
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



