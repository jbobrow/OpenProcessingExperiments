
//Wayland L, Pong, CP1, 16-17
Ball me;
paddle paddle1;
paddle paddle2;
block blocker;

void setup()
{

  size(500, 500);
  background(0);
  me = new Ball();
  paddle1 = new paddle();
  paddle2 = new paddle();
  paddle2.locy = 0;
  blocker = new block();
}
void draw()
{

  background(0);
  me.move();
  paddle1.move();
  paddle1.show();
  paddle2.move();
  paddle2.show();
  blocker.move();
  blocker.show();
  me.bounce();
  me.show();
}


class Ball
{
  int score;
  float x, y, speedx, speedy;
  boolean right, up;
  Ball()
  {
    x = 250;
    y = 50;
    speedx=2;
    speedy=5;
    score = 0;
    up = false;
    right = true;
  }




  void move()
  {
    if (up==true)
    {
      y=y-speedy;
    }
    else
    {
      y=y+speedy;
    }
    if (right==true)
    {
      x=x+speedx;
    }
    else
    {
      x=x-speedx;
    }
  }




  void bounce()
  {
    if (x<0)
    {
      right = true;
    }
    else if (x>500)
    {
      right=false;
    }
    if (get(int(x), int(y)-5) == color(255))
    {
      speedy=speedy+0.05;
      speedx=speedx+0.05;
      up =false;

      score++;
    }
    else if (get(int(x), int(y)+5) == color(255))
    {
      speedy=speedy+0.05;
      speedx=speedx+0.05;
      up =true;

      score++;
    }
    if (get(int(x), int(y)-5) == color(0, 255, 0))
    {

      up =false;
    }
    else if (get(int(x), int(y)+5) == color(0, 255, 0))
    {

      up =true;
    }
  }




  void show()
  {
    fill(255);
    stroke(255);

    ellipse(x, y, 10, 10);

    textAlign(CENTER);
    textSize(32);
    text("SCORE: "+score, 250, 100);
    if (y>500||y<0)
    {

      background(0);
      textAlign(CENTER);
      textSize(32);
      text("GAME OVER \nPress Space to Restart \n Previous Score: "+score, width/2, 100);
      if (keyPressed && key == ' ')
      {
        x = 250;
        y = 50;
        speedy=5;
        speedx=2;
        score = 0;
        up = false;
        right = true;
        blocker.speed = 0;
        blocker.x = 250;
        blocker.x2 = 250;
      }
    }
  }
}


class paddle
{
  int locx, locy;

  paddle()
  {
    locx=250;
    locy=490;
  }
  void move()
  {
    if (keyPressed && keyCode==LEFT)
    {
      locx=locx-10;
    }
    if (keyPressed &&keyCode; ==RIGHT)
    {
      locx=locx+10;
    }
    if (locx>500)
    {
      locx=0;
    }
    if (locx<-100)
    {
      locx=500;
    }
  }
  void show()
  {

    rect(locx, locy, 100, 10);
  }
}

class block
{
  float x, x2, speed;
  block()
  {
    x = 250;
    x2 = 250;
    speed=0;
  }
  void move()
  {
    x=x+speed;
    x2 = x2-speed;
    if (x>500)
    {
      x=-100;
    }
    if (x2<-100)
    {
      x2 = 500;
    }
    speed=speed+0.005;
    if (speed>15)
    {
      speed = speed +0;
    }
  }
  void show()
  {
    fill(0, 255, 0);
    stroke(0, 255, 0);
    rect(x, 250, 100, 10);
    rect(x2, 300, 100, 10);
  }
}
