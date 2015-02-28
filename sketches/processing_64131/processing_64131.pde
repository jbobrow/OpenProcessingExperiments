
// animating pacman's mouth variable
boolean IOM = false; //if opening mouth
float MW = PI/4; // mouth width

// pacman variables
float curX = 0;
float curY = 0;
float pacmanRadius = 50;
float direction = 0;

// dot variables
Dot[] dotGenerate;

Dot dot1;

int score = 0;

void setup()
{
  curX = width/2;
  curY = height/2;


  ellipseMode (RADIUS);

  size (500, 500);
  background (0, 0, 255);

  dot1 = new Dot ();

  dotGenerate = new Dot[5];

  for (int i = 0; i < dotGenerate.length; i = i + 1)
  {
    dotGenerate[i] = new Dot();
  }
}

void draw()
{
  background(0, 0, 255);

  fill (250, 255, 10);
  arc (curX, curY, pacmanRadius, pacmanRadius, MW/2 + direction, 2*PI - MW/2 + direction);

  if (IOM)
  {
    MW = MW + .1;
    if (MW > PI/3)
    {
      IOM = false;
    }
  }
  else
  {
    MW = MW - .1;
    if (MW < 0)
    {
      IOM = true;
    }
  }

  for (int i = 0; i < dotGenerate.length; i = i + 1)
  {
    dotGenerate[i].checkCollision();
    dotGenerate[i].draw();
  }
  // dot1.draw();

  if (keyPressed) {
    if (key == 'd')
    {
      curX = curX + 4;
      direction = 0;
    }
    if (key == 'a')
    {
      curX = curX - 4;
      direction = PI;
    }
    if (key == 'w')
    {
      curY = curY - 4;
      direction = PI * 3/2;
    }
    if (key == 's')
    {
      curY = curY + 4;
      direction = PI/2;
    }
  }
  // Draw score
  textAlign(RIGHT);
  textSize(50);
  text(score, width - 50, 70);
}

class Dot 
{
  float x, y, size;

  Dot ()
  {
    this.x = random (25, width - 25);
    this.y = random (25, height - 25);
    this.size = 12;
  }

  Dot ( float x, float y)
  {
    this.x = x;
    this.y = y;
    this.size = 25;
  }


  void draw ()
  {
    fill (255);
    ellipse (this.x, this.y, size, size);
  }

  boolean checkCollision ()
  {
    if (  sqrt(  (this.x - curX) * (this.x - curX) + (this.y - curY) * (this.y - curY)  ) < pacmanRadius)
    {
      this.x = random (25, width - 25);
      this.y = random (25, height - 25);
      score += 5;
      println(score);
      return true;
    }

    return false;
  }
}
