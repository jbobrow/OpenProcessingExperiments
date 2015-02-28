
int n = 20;
Ball[] b = new Ball[n];
int[] a = new int[n];
boolean laughOrNot=true;

void setup()
{
  size(400, 400);
  smooth();
  for (int i=0; i<n; i++)
  {
    b[i] = new Ball(i*20, i*20, 20);
  }
}

void draw()
{
  background(255);
  for (int i=0; i<n; i++)
  { 
    b[i].display();
    b[i].vibrate();
  }
  
  for (int i=0; i<n; i++)
  {
    
    for (int j=0; j<n; j++)
    {
      if (i != j && b[i].isOverlap(b[j]))
      {
        b[i].c = random(1,10)*25.5;
        b[i].d= random(1,10)*25.5;
        b[i].e=random(1,10)*25.5;
        b[i].apart(b[j]);
        b[i].laugh = !b[i].laugh;
        b[i].angle = random(PI*2);
      }
    }
  }
}



class Ball
{
  float x, y, s, c, sx, sy, d, e;
  float angle;
  boolean laugh;

  Ball(float _x, float _y, float _s)
  {
    x = _x;
    y = _y;
    s = _s;
    sx = random(-2, 2);
    sy = random(-2, 2);
    c = 255;
    d=255;
    e=255;
    laugh = false;
  }

  void display()
  {
    fill(c);
    pushMatrix();
    translate(x, y);
    rotate(angle);
    rect(-s/2, -s/2, s, s);


    fill(255);
    if (laugh==false) {
      fill(0);
    rect(s/4-s/2, s/4-s/2, 4, 4);
    rect(s*3/4-s/2, s/4-s/2, 4, 4);
    }
    if (laugh==true) {
       fill(255);
    rect(s/4-s/2, s/4-s/2, 4, 4);
    rect(s*3/4-s/2, s/4-s/2, 4, 4);
    }


//
//    fill(0);
//    rect(s/4-s/2, s/4-s/2, 4, 4);
//    rect(s*3/4-s/2, s/4-s/2, 4, 4);
    
    popMatrix();
  }

  void vibrate()
  {
    x += sx;
    y += sy;
    if (x < 0 || x > width) sx *= random(-1.2, -0.8);
    if (y < 0 || y > height) sy *= random(-1.2, -0.8);
    x = constrain(x, 0, width);
    y = constrain(y, 0, height);
  }

  boolean isOverlap(Ball b)
  {
    float d = dist(x, y, b.x, b.y);
    if (d < (s + b.s) / 2)
      return true;
    else
      return false;
  }

  void apart(Ball b)
  {
    float dx = x - b.x;
    float dy = y - b.y;
    sx += dx / 4;
    sy += dy / 4;
    sx = constrain(sx, -4, 4);
    sy = constrain(sy, -4, 4);
  }
}



