
/*kevin nguyen
*/

int MC;
float Z, X;
float rx, ry;
Fish A, B, C, D;
boolean a, s, w, d;

void setup() 
{
  size(600, 600);
  MC = 10;
  noStroke();
  smooth();
  Z = X = 250;
  rx = ry = 250;
  A = new Fish();
  A.r = 3;
  A.v = 1;
  
  B = new Fish();
  B.r = 3;
  B.v = 1;
  
  C = new Fish();
  C.r = 3;
  C.v = 1;  
  
  D = new Fish();
  D.r = 3;
  D.v = 1;
}

void draw() 
{
  fill(1);
  text("Hold X for red lines",250,600);
  rx = rx + random(-10, 10);
  ry = ry + random(-10, 10);
  if (A.rx < -15)
  {
    A.rx = 600;
  }
  if (A.rx > 615)
  {
    A.rx = 0;
  }
  if (A.ry < -15)
  {
    A.ry = 600;
  }
  if (A.ry > 615)
  {
    A.ry = 0;
  }
    if (B.rx < -15)
  {
    B.rx = 600;
  }
  if (B.rx > 615)
  {
    B.rx = 0;
  }
  if (B.ry < -15)
  {
    B.ry = 600;
  }
  if (B.ry > 615)
  {
    B.ry = 0;
  }
  {
    C.rx = 600;
  }
  if (C.rx > 615)
  {
    C.rx = 0;
  }
  if (C.ry < -15)
  {
    C.ry = 600;
  }
  if (C.ry > 615)
  {
    C.ry = 0;
  }
    if (D.rx < -15)
  {
    D.rx = 600;
  }
  if (D.rx > 615)
  {
    D.rx = 0;
  }
  if (D.ry < -15)
  {
    D.ry = 600;
  }
  if (D.ry > 615)
  {
    D.ry = 0;
  }
  for (int y=0; y<height; y+=MC) 
  {
    for (int x=0; x<width; x+=MC)
    {
      fill(random(300, 500), random(200, 250), random(30,60), 30);
      rect(x, y, MC, MC);
      A.show();
      A.move();
      B.show();
      B.move();
      C.show();
      C.move();
      D.show();
      D.move();
    }
  }
}


class Fish
{
  float x, y;
  float rx, ry;
  int r;
  int v;

  void show()
  {
    fill(random(2000), random(50), random(10));
    ellipse(rx, ry, r, r);
    rx = rx + random(-3, 3);
    ry = ry + random(-3, 3);
  }  

  void move()
  {
    x += ( mouseX - width/2  ) * 0.001 * v;
    y += ( mouseY - height/2 ) * 0.001 * v;
  }
}
void keyPressed()
{
  if (key == 'x')
  {
    fill(100, 10000, 100);
    stroke(#FC0F0F,311);
    line(0, 0, mouseX, mouseY);
    line(300, 0, mouseX, mouseY);
    line(600, 0, mouseX, mouseY);
    line(600, 300, mouseX, mouseY);
    line(600, 600, mouseX, mouseY);
    line(0, 300, mouseX, mouseY);
    line(300, 600, mouseX, mouseY);
    line(0, 600, mouseX, mouseY);
    noStroke();
  }
}

