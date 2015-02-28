
// 48-257, bumyeolk_HW6
// Bumyeol Kim, Copyright 2012

float x, y, wd;
float wx, wy, ws; // added new variables
float bx, by, bs; // new variables

color a, b, c, d, e, f, g;

void setup( )
{
  size (600, 600);
  smooth ( );
    x = 100;
    y = 100;  
    wd = 100;
    a = #FFA112;
    b = #1FFF7A;
    c = #4A92F5;
    d = #A2C2FF;
    e = #FF4400;
    f = #4B4B4B;
    g = #BF8D28;
    wx = 500;
    wy = random(height);
    ws = 1;
    bx = 0;
    by = random(height);
    bs = 1;
}

void draw( )
{
  background(d);
  initials (wx, wy, wd);
  initials (bx, by, wd);
  winitials ( );
  binitials ( );
}

// wrap movement
void winitials ( )
{
  wx = wx + ws;
  if (wx >= width + x)
  {
    ws = -ws;
    wy = random(height);
    
  }
  if (wx <= 0 - x)
  {
    ws = -ws;
    wy = random(height);
  }
}

// bounce movement
void binitials ( )
{
  bx = bx + bs;
  if (bx > width + x)
  {
    bs = - bs;
  }
  else if (bx < 0 - x)
  {
    bs = - bs;
  }
  by = by + bs;
  if (by > height + y)
  {
    bs = - bs;
    by = random(height);
  }
  else if (by < 0 - y)
  {
    bs = - bs;
    by = random(height);
  }
}
    
// initials
void initials (float x, float y, float wd)
{
  strokeWeight(15);
  stroke(e);
  fill(f);
  ellipse(x, y, 2*wd-15, 2*wd-15);

  strokeWeight(10);
  stroke(g);
  line(x-(wd/2)-30, y-(wd/2)-30, x-(wd/2)-30, y+(wd/2)+30);
  line(x-(wd/2)-30, y+(wd/2)+30, x+(wd/2)+30, y+(wd/2)+30);
  line(x+(wd/2)+30, y-(wd/2)-30, x+(wd/2)+30, y+(wd/2)+30);
  line(x-(wd/2)-30, y-(wd/2)-30, x+(wd/2)+30, y-(wd/2)-30);

// first
  beginShape( );
  strokeWeight(15);
  stroke(a);
  vertex(x-(wd/2), y-(wd/2));
  vertex(x-(wd/2), y+(wd/2));
  vertex(x+(wd/4), y+(wd/2));
  vertex(x-(wd/2)+5, y);
  vertex(x+(wd/4), (y-(wd/2)));
  vertex(x-(wd/2), y-(wd/2));
  endShape( );

// second
  strokeWeight(15);
  stroke(b);
  line((x-(wd/2)) + 20, (y-(wd/2)), (x-(wd/2)) + 20, (y-(wd/2)) + wd);
  line((x-(wd/2)) + 25, (y-(wd/2)) + (wd/2), x+(wd/4) + 20, (y-(wd/2)));

// third
  strokeWeight(15);
  stroke(c);
  line((x-(wd/2)) + 40, (y-(wd/2)), (x-(wd/2)) + 40, (y-(wd/2)) + wd);
  line((x-(wd/2)) + 45, (y-(wd/2)) + (wd/2), x+(wd/4) + 40, (y-(wd/2)));
  line((x-(wd/2)) + 45, (y-(wd/2)) + (wd/2), x+(wd/4) + 40, (y-(wd/2)) + wd);
}

