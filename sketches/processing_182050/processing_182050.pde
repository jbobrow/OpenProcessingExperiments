

snowman s;
ArrayList<Flake> flakes = new ArrayList<Flake>();
ArrayList<snowBall> snowballs = new ArrayList<snowBall>();

PImage winner;


void setup()
{
  size(700, 700);
  winner = loadImage("winner.jpg");
 
  s = new snowman(100, 680, 40);
  for (int i = 0; i < 600; i++)
  {
    flakes.add( new Flake(random(700), random(700)));
  }
}

void draw()
{
  flakes.add( new Flake(random(700), random(1)));
  background(0, 0, 50);
  s.drawMan();
  //stroke();
  // these shapes draw the house
  fill(105, 100, 100);
  rect(400, 500, 70, 300);
  rect(550, 500, 700, 300);
  rect(400, 500, 800, 60);
  rect(400, 650, 700, 80);
  rect(508, 560, 2, 90);
  rect(470, 600, 80, 2);
  fill(139, 69, 19);
  rect(370, 470, 700, 30);
  rect(390, 440, 700, 30);
  rect(420, 410, 700, 30);
  fill(255,0,0);
  ellipse(10,650,20,80);
  fill(255);
  ellipse(10,650,10,50);
  fill(255,0,0);
  ellipse(10,650,5,20);
  for (int i = 0; i < snowballs.size(); i++)
  {
    snowBall a = snowballs.get(i);
    a.drawBall();
    a.update();
  }
  for (int i = 0; i < flakes.size (); i++)
  {
    Flake b = flakes.get(i);
    b.drawFlake();
    b.update();
    if (b.life > 1200)
    {
    flakes.remove(i);
    }
  }
  if (keyPressed)
  {
    if (keyCode == LEFT)
    {
      s.updateL();
    } 
    if (keyCode == RIGHT)
    {
      s.updateR();
    }
    if (key == ' ')
    {
      s.jump();
    }
    if (keyCode == UP)
    {
      s.throwball();
    }
    if(keyCode == SHIFT )
     {
     s.move();
     }
  }
}

class Flake
{
  float xpos;
  float ypos;
  float size;
  color c;
  int yVel;
  float life;
  boolean f;
  Flake(float x, float y )
  {
    xpos = x;
    ypos = y;
    size = random(2, 5);
    c = color(255);
    life = 0;
    yVel = int(random(1,3));
  }
  void drawFlake()
  {
    f = true;
    fill(c);
    ellipse(xpos, ypos, size, size);
    if (f == true)
    {
      if (keyCode == DOWN)
      {
        c = color(random(255),random(255),random(255));
      }
    }
    if (keyCode == UP)
    {
      f = false;
    }
  }
  void update()
  {
    life = life + 1;
    if (ypos<698)
    {
      ypos = ypos + yVel;
    } 
    else
    {
      ypos= 698;
    }
  }
}

class snowman
{
  int xpos;
  int ypos;
  int size;
  float gunheat;
  
  snowman(int x, int y, int s)
  {
    xpos = x;
    ypos = y;
    size = s;
    gunheat = 0;
    
  }
  void drawMan()
  {
    /// borrowed the gunheat idea from the astroids project
    if (gunheat > 0)
    {
      gunheat = gunheat - .9;
    }
    
    fill(255);
    //noStroke();
    ellipse(xpos, ypos, size, size);
    ellipse(xpos, ypos-size*5/6, size*3/4, size*3/4);
    fill(169, 20, 20);
    rect(xpos-size*20/28, ypos-size*5/6, size/3, size/15);
    rect(xpos+size*20/53, ypos-size*5/6, size/3, size/15);
    fill(0);
    ellipse(xpos, ypos-size*5/6, size/8, size/8);
    ellipse(xpos, ypos-size*5/6+6, size/8, size/8);
    ellipse(xpos, ypos-size*5/6-6, size/8, size/8);
    fill(255);
    ellipse(xpos, ypos-size*17/12, size*3/5, size*3/5);
    fill(255, 100, 0);
    ellipse(xpos, ypos-size*17/12, size/7, size/7);
    fill(0);
    ellipse(xpos-size*2/20, ypos-size*18/12, size/7, size/7);
    ellipse(xpos+size*2/20, ypos-size*18/12, size/7, size/7);
    fill(139, 69, 19);
    rect(xpos-size*3/10, ypos-2.3*size, size*3/5, size*3/5);
    rect(xpos-size*5/10, ypos-1.7*size, size, 2);
    if (ypos < 680)
    {
      ypos = ypos + 2;
    }
    if ((ypos == 390) && (xpos > 420))
    {
      ypos = 390;
      ypos = ypos -2;
    }
    if ((ypos == 420) && (xpos > 385))
    {
      ypos = 420;
      ypos = ypos -2;
    }
    if ((ypos == 450) && (xpos > 365))
    {
      ypos = 450;
      ypos = ypos -2;
    }
    
  }
  void updateR()
  {
    xpos = xpos + 1;
  }
  void updateL()
  {
    xpos = xpos - 1;
  }
  void jump()
  {
    ypos = ypos - 10;
  }
  void enlarge()
  {
    size = size*20/19;
  }
  void delarge()
  {
    size = size*19/20;
  }
  void throwball()
  {
    if (gunheat < 5)
    {
    snowballs.add( new snowBall(xpos,ypos, 15));
    gunheat = gunheat + 20;
    }
  }
  void move()
  {
    xpos = int(random(700));
    ypos = int(random(700));
  }
}

  
class snowBall
{
  float xpos;
  float ypos;
  int size;

  snowBall(float x, float y,int s )
  {
    xpos = x;
    ypos = y;
    size = s;
  }
  void drawBall()
  {
    fill(255);
    ellipse(xpos, ypos-30,size,size);
  }
  void update()
  {
    if (xpos > 10)
    {
      xpos = xpos -3;
      ypos = ypos + .3;
    }
    else
    {
      xpos = 10;
      
      ypos = ypos + 1;
    }
    if ((xpos == 10) && (ypos < 660))
    {
      xpos = -10;
      ypos = 800;
    }
     if ((xpos == 10) && (ypos > 650))
     {
       xpos = 10;
       image(winner,0,0);
     }
     if (ypos > 720)
     {
       xpos = 100;
       ypos = 800;
     }
    
  }
}








