
ball[] b;


void setup()
{
  size(500, 500);
  background(0);
  b = new ball[15];
  for (int i = 0; i < b.length; i++)  { b[i] = new ball(0.1, 0.1); }
}


void draw()
{
  noStroke();
  fill(0, 1);
  rect(0, 0, width, height);
   
  b[b.length-1].x = mouseX;
  b[b.length-1].y = mouseY;
  
  for (int i = b.length - 2; i >= 0; i--)  { b[i].adjust(b[i+1].x, b[i+1].y); }  
  for (int i = 0; i < b.length; i++ )  { b[i].display(); }
}

void keyPressed()
{
  background(0);
}


class ball
{
  int diam;
  float x, y;
  
  ball(float x_, float y_)
  {
    diam = 20;
    x = x_;
    y = y_;
  }
  
  void adjust(float biX, float biY)
  {
    float theta = verifyAngle(biX - x, biY - y);
    x = biX - diam*cos(theta);
    y = biY - diam*sin(theta);
  }
  
  void display()
  {
    stroke(225,200,180);
    fill(150, 0, 0);
    ellipse(x, y, diam, diam);
  } 
  
}


float verifyAngle(float vx, float vy)
{ 
  PVector h = new PVector(1, 0, 0);
  PVector vec = new PVector(vx, vy, 0);
  
  float angle = PVector.angleBetween(h, vec);
  if (vy < h.y)  { angle = TWO_PI - angle; }
  return angle;
}


