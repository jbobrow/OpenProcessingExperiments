
int count;
int b;



class Brick
{
  int n;
  Brick()
  {
    int n=250;
  }

  void show()
  {
    fill(255);
    rect(450, n, 20, 50);
  }

  void move()
  {
    if (n<mouseY)
    {
      n=n+7;
    }
    if (n>mouseY)
    {
      n=n-7;
    }
  }
}


class CompBrick
{
  int m;
  CompBrick()
  {
    int m=250;
  }

  void show()
  {
    fill(255);
    rect(30, m, 20, 50);
  }

  void move()
  {
    m= pelota.y - 40;
  }
}




class Ball
{
  int x, y;
  boolean up, right, gameover;

  Ball()
  {
    x=int(random(60,250));
    y=int(random(250));
    up=true;
    right=false;
    gameover=false;
  }

  void move()
  {
    if (up==true)
    {
      y=y-5;
    }
    else y=y+5;
    if (right==true)
    {
      x=x+5;
    }
    else x=x-5;
  }

  void bounce()
  {
    if (x>=500)
    {
      gameover=true;
    }
    if (x<=0)
    {
      right=true;
    }
    if (y>=500)
    {
      up=true;
    }
    if (y<=0)
    {
      up=false;
    }

    if (x>=440 && x<446 && y<=(paddle.n +50) && y>=paddle.n)
    {
      right=false;
    }

    if (x<=60 && x>54)
    {
      right=true;
    }
  }
  void endgame()
  {
    if (gameover==true)
    {
      fill(255, 0, 0);
      textAlign(CENTER);
      textSize(40);
      text("You lose", 250, 250);
      fill(255, 0, 0);
      textSize(20);
      text("Click to play again", 250, 270);
      

      if (mousePressed==true)
      {
        background(0);
        x=int(random(250));
        y=int(random(250));
        count=0;
        frameRate(20);
        gameover=false;
      }
    }
  }
  void show()
  {
    fill(0, 255, 0);
    ellipse(x, y, 20, 20);
  }
}





Ball pelota= new Ball();
Brick paddle= new Brick();
CompBrick comppaddle= new CompBrick();





void setup()
{
  size(500, 500);
  frameRate(20);
  noStroke();
}




void draw()
{
  background(0);
  pelota.move();
  pelota.bounce();
  pelota.show();
  pelota.endgame();

  paddle.show();
  paddle.move();

  comppaddle.show();
  comppaddle.move();

  if (pelota.gameover==false)
  {
    count=count+1;
  }
  else if (count>=b)
  {
    b=count;
  }
  if (count==0)
  {
    frameRate(20+count/10);
    }
  fill(255);
  textAlign(CENTER);
  textSize(20);
  text("Points: ",40,23);
  text(count, 120,23);
  text("Best:",380,23);
  text(b,450,23);
  }
