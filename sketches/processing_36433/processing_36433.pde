
Ball b;
float gravity = 0.1;

void setup()
{
  size(700, 400);
  frameRate(60);
  background(0);
  smooth();
  b = new Ball(350,400, 0, 0);
  fill(255);
}

void draw(){
  background(0);
  b.update();
  stroke(255);
  if (mousePressed)
  {
    line(xPos, yPos, mouseX, mouseY);
  }
  noStroke();
  b.draw();
}

int xPos;
int yPos;

void mousePressed()
{
  xPos = mouseX;
  yPos = mouseY;
}

void mouseReleased()
{
  b = new Ball(xPos, yPos, (mouseX - xPos) / 5, (mouseY - yPos) / 5);
}

class Ball
{
  float x;
  float y;
  float dx, dy;
  float px, py;

  float strength = 0.85;

  Ball(float x, float y, float dx, float dy)
  {
    this.x = x;
    this.y = y;
    this.dx = dx;
    this.dy = dy;
  }

  void draw()
  {
    ellipse(x, y, 10, 10);
  }

  void update()
  {
    px = x;
    py = y;

    dy = dy+gravity;
    y = y+dy;
    if (y >= height - 15)
    {
      dy = (-dy) * 0.8;
      y = height - 15;
    }

    x = x+dx;
    if (y == height - 15)
      dx = dx*strength;

    if ((x < 15) || (x >= width - 15))
    {
      dx = -dx * strength;
      if(x<15)
      x=15;
      else
      x = width - 15;      
    }
  }
}


