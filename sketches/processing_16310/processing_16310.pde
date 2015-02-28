
class PenguinMan
{
  // class variables

  // float
  float x, y;
  float dx = 0;
  float dy = 0;

  // int
  int me;
  int a;

  // new
  PenguinMan[] notme;

  // boolean
  boolean start;

  // end class variables

  //constructor
  PenguinMan(float x_local, float y_local, int me_local, PenguinMan[] notme_local)
  {
    x = x_local;
    y = y_local;
    me = me_local;
    notme = notme_local;
    start = false;
  }
  // end constructor

  void move() {
    // convert to speed
    dy += gravity;
    x += dx;
    y += dy;
    // end convert to speed

    // wall collision
    if (x + 30 > width) {
      x = width - 30;
      dx *= collisionforce;
    }
    else if (x - 30 < 0) {
      x = 30;
      dx *= collisionforce;
    }
    // end wall collision

    // roof and floor collision
    if (y + 30 > height) {
      y = height - 30;
      dy *= collisionforce;
    } 
    else if (y - 30 < 0) {
      y = 30;
      dy *= collisionforce;
    }
    // end roof and floot collision
  }


  void display()
  {
    // draw penguinman

    // Black Bodyparts
    fill(0);

    // Body
    ellipse(x,y,60,120);
    // Head
    ellipse(x,y-80,50,50);
    // Left Foot
    ellipse(x-20,y+60,30,20);
    // Right Foot
    ellipse(x+20,y+60,30,20);


    // White Bodyparts
    fill(255);

    // Body
    ellipse(x,y,50,90);
    // Head
    ellipse(x,y-80,40,40);


    // Random Color Bodyparts
    fill(4.25*second(),4.25*minute(),2.55*millis());

    // Left Eye
    ellipse(x-10,y-80,8,8);
    // Right Eye
    ellipse(x+10,y-80,8,8);

    // interaction
    if (mousePressed == true) 
    {
      fill(random(255),random(255),random(255));
      ellipse(x, y, 30, 30);
    }
    // end interaction
  }

  void collide()
  {
    // tag each penguinman
    for (a = me + 1; a < maxMen; a++)
      // end tag each penguinman
    {
      float dx = notme[a].x - x;
      float dy = notme[a].y - y;
      // calculate distance
      float distance = sqrt(dx*dx + dy*dy);
      // end calculate distance

      if (distance < 30 + 30)
      {
        // calculate new angle speed
        float angle = atan2(dy, dx);
        float pointX = x + cos(angle) * 60;
        float pointY = y + sin(angle) * 60;
        float newx = (pointX - notme[a].x) * bounce;
        float newy = (pointY - notme[a].y) * bounce;
        // end calculate new angle speed

        // set new angle and speed
        dx -= newx;
        dy -= newy;
        notme[a].dx += newx;
        notme[a].dy += newy;
        // end set new angle and speed
      }
    }
  }
}



