
//Sydney C. CP 1 Mods: 4/5 Pong
/* @pjs globalKeyEvents="true";*/
ball Owen;
paddle John;
boolean stopp = false;
void setup()
{
  Owen = new ball();
  John = new paddle();
  size(400, 400);
}

void draw()
{
  if (stopp == false)
  {
    background(0);
    Owen.move();
    John.show();
    Owen.bounce();
    Owen.show();
    John.move();
    John.keyPressed();
    Owen.score();
  }
  else if (stopp == true)
  {
    background (255, 0, 0);
    textSize(50);
    fill(255);
    textAlign(CENTER);
    text("Game Over", 200, 200);
  }
}

class ball
{
  int x, y, s, r, g, b;
  boolean up, right;
  ball()
  {
    x=int(random(400));
    y=int(random(200));
    s=0;
    r = 255;
    g = 255;
    b = 255;
    up=false;
    right=false;
  }
  void move()
  {
    if (right == true)
    {
      x+=2;
    }
    else
    {
      x-=2;
    }
    if (up == true)
    {
      y-=2;
    }
    else
    {
      y+=2;
    }
  }
  void bounce()
  {
    if (x<10)
    {
      right = true;
    }
    if (x>390)
    {
      right = false;
    }
    if (y<10)
    {
      up = false;
    }
    if (get(x, y+10) == color(255))
    {
      up = true;
      s++;
      r=(int(random(255)));
      g=(int(random(255)));
      b=(int(random(255)));
    }
    if (y>=390)
    {
      stopp = true;
    }
  }
  void show()
  {
    noStroke();
    fill(r,g,b);
    ellipse(x, y, 20, 20);
  }
  void score()
  {
    fill(0,255,0);
    textSize(25);
    text("Score: "+s,50,50);
  }
}

class paddle
{
  int x,y;
  boolean right,up;
  paddle()
  {
    x=int(random(340));
    y = 385;
    right = true;
    up = false;
  }
  void show()
  {
    noStroke();
    fill(255);
    rect(x, y, 60, 10);
  }
  void move()
  {
    if (right == true && x<340)   
    {
      x+=2;
    }
    else if (right == false && x>0)
    {
      x-=2;
    }
    if (up == true && y>200)
    {
      y-=2;
    }
    else if (up == false && y<390)
    {
      y+=2;
    }
  }
  void keyPressed()
  {
    if (keyCode == RIGHT)
    {
      right = true;
    }
    else if (keyCode == LEFT)
    {
      right = false;
    }
    if (keyCode == UP)
    {
      up = true;
    }
    if (keyCode == DOWN)
    {
      up = false;
    }
  }
}
