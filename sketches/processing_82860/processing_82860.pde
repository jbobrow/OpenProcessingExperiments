
ball bob;
paddle joe;
paddle jim;
void setup ()
{
  bob = new ball ();
  joe = new paddle ();
  jim = new paddle ();
  size(800, 600);
  int score1 = 0;
  int score2 = 0;
  frameRate(130);
}

void draw ()
{
  background(0);
  bob.move();
  bob.bounce();
  bob.show();
  joe.joemove();
  jim.jimmove();
  joe.showjoe();
  jim.showjim();
}

class ball
{
  int x, y, score1, score2;
  boolean up, right;

  ball()
  {

    x = int(random(300));
    y = int(random(300));
    up = true;
    right = true;
    score1 = 0;
    score2 = 0;
  }

  void move ()
  {
    if (up == true)
    {
      y = y - 5;
    }
    else
    {
      y = y + 5;
    }
    if (right == true)
    {
      x = x + 5;
    }
    else
    {
      x= x - 5;
    }
  }

  void bounce ()
  {

    if (x < 0)
    {
      score2++;
      x=700;
    }
    if (x > 800)
    {
      score1++;
      x = 100;
    }

    if (y >= 590)
    {
      up = true;
    }
    if (y <= 0)
    {
      up = false;
    }

    if ( x == 70 &&  y >= joe.y && y <=(joe.y + 160))
    {
      right = true;
      joe.r = int(random(255));
      joe.g = int(random(255));
      joe.b = int(random(255));
    }
    if ( x == 745 && y >=jim.y && y <=(jim.y + 160))
    {
      right = false;
      jim.r = int(random(255));
      jim.g = int(random(255));
      jim.r = int(random(255));
    }
  }


  void show ()
  {
    fill(int(random(255)), int(random(255)), int(random(255)));
    ellipse(x, y, 30, 30);
    textSize(32);
    text(score1, 150, 100);
    text(score2, 650, 100);
  }
}

class paddle
{
  int y, r, g, b;


  paddle()
  {
    y =300;
    r = 255;
    g= 255;
    b = 255;
  }

  void joemove ()
  { 
    if ( y > mouseY)
    {
      y = y - 4;
    }
    if (y < mouseY)
    {
      y = y + 4;
    }
  }

  void jimmove ()
  {
    y = bob.y - 20;
  }


  void showjoe ()
  {
    fill(r, g, b);
    rect(40, y, 15, 160);
  }
  void showjim ()
  {
    fill(r, g, b);
    rect(760, y, 15, 160);
  }
}
