
final int NB_MAX = 80;
final int NB_MIN = 4;
int NB = (int)random(NB_MIN, NB_MAX);
Doublet[] doublets;

void setup()
{ 
  size(600, 450, P2D);
  stroke(0, 120);
  doublets = new Doublet[NB_MAX];
  reset();
}

void reset()
{
  for (int i = 0; i < NB_MAX; i ++)
  {
    doublets[i] = new Doublet(new PVector(random(width), random(height)), new PVector(random(width), random(height)));
  }
}

void draw()
{
  background(120);
  for (int i = 0; i < NB; i ++)
  {
    doublets[i].update();
  }
  //check intersection between each doublets pair
  for (int i = 0; i < NB; i ++)
  {
    for (int j = i+1; j < NB; j ++)
    {
      doublets[i].checkIntersection(doublets[j]);
    }
  }
}

void mouseClicked()
{
  reset();
}

void keyPressed()
{
  if (key == 'w')
  {
    NB = constrain(NB += 4, NB_MIN, NB_MAX);
  } else if (key == 'q')
  {
    NB = constrain(NB -= 4, NB_MIN, NB_MAX);
  }
}

class Doublet
{
  Extremity A, B;
  color col = color(random(255), random(255), random(255));

  Doublet(PVector p_A, PVector p_B)
  {
    A = new Extremity(p_A);
    B = new Extremity(p_B);
  }

  void update()
  {
    A.update();
    B.update();
    line(A.x, A.y, B.x, B.y);
    fill(0);
    ellipse(A.x, A.y, 3, 3);
    ellipse(B.x, B.y, 3, 3);
  }

  void checkIntersection(Doublet p_d)
  {
    PVector C = p_d.A.get();
    PVector D = p_d.B.get();
    float a1 = (B.y - A.y) / (B.x - A.x);//AB slope
    float a2 = (D.y - C.y) / (D.x - C.x);//CD slope
    if (a1 != a2)//segments are not parallel
    {
      float b1 = A.y - A.x * (B.y - A.y) / (B.x - A.x);
      float b2 = C.y - C.x * (D.y - C.y) / (D.x - C.x);
      float xo = (b2 - b1) / (a1 - a2);
      float yo = b1 + a1 * (b2 - b1) / (a1 - a2);
      if ((A.x < B.x ? A.x <= xo && xo <= B.x : B.x <= xo && xo <= A.x)
        && (A.y < B.y ? A.y <= yo && yo <= B.y : B.y <= yo && yo <= A.y)
        && (C.x < D.x ? C.x <= xo && xo <= D.x : D.x <= xo && xo <= C.x)
        && (C.y < D.y ? C.y <= yo && yo <= D.y : D.y <= yo && yo <= C.y))
      {
        fill((col + p_d.col) / 2);
        ellipse(xo, yo, 10, 10);
      }
    }
  }
}

class Extremity
{
  float x, y, sx, sy;
  final static float MAX_SPEED = 2.3; 

  Extremity(PVector p)
  {
    x = p.x;
    y = p.y;
    sx = random(-MAX_SPEED, MAX_SPEED);
    sy = random(-MAX_SPEED, MAX_SPEED);
  }

  void update()
  {
    x += sx;
    if (x < 0)
    {
      x = 0;
      sx *= -1;
    } else if (x > width)
    {
      x = width;
      sx *= -1;
    }
    
    y += sy;
    if (y < 0)
    {
      y = 0;
      sy *= -1;
    } else if (y > height)
    {
      y = height;
      sy *= -1;
    }
  }

  PVector get()
  {
    return new PVector(x, y);
  }
}



