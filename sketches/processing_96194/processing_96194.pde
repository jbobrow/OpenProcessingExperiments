
Balloon balloon1;
Balloon balloon2;

void setup()
{
  size(400, 350);
  balloon1 = new Balloon(300, 0, 20, 30, color(205, 48, 76));
  balloon2 = new Balloon(350, 100, 30, 40, color(87, 100, 600));
}
void draw()
{
  background(255,68,255);
  balloon1.move();
  balloon1.display();
  balloon2.move();
  balloon2.display();
}
class Balloon
{
  float x;
  float y;
  float w;
  float h;
  color c;
  float xSpeed;
  float ySpeed;

  Balloon(float bx, float by, float bw, float bh, color bc)
  {
    x = bx;
    y = by;
    w = bw;
    h = bh;
    c = bc;
    xSpeed = 1;
    ySpeed = 2;
  }

  void display()
  {
    fill(c, 150);
    ellipse(x, y, w, h);
    line(x, y + h/3, x, y + h/3 + 20);
  }

  void move()
  {
    x += xSpeed;
    y += ySpeed;
    
    if (x < w/2 || x > width-w/2) xSpeed = -xSpeed;
    if (y < h/2 || y > height-h/2) ySpeed = -ySpeed;
    }
}
