
//bouncing
//copyright benjmain corwin 2012
float a, b, c, w, sd, bx, by, lx, ly, lxSpeed, lySpeed, bxSpeed, bySpeed, clra, clrb, clrc;


void setup()
{
  size (400,400);
  noStroke();
  bx = random(400);//bouncing object x
  by = random(400);//bouncing object y
  lx = random(400);//looping oject x
  ly = random(400);//looping object y
  sd = 60;
  bxSpeed = random(-5,5);
  bySpeed = random(-5,5);
  lxSpeed = random(-5,5);
  lySpeed = random(-5,5);
  a = random(225);//starting color red
  b = random(225);//starting color green
  c = random(225);//starting color blue
  clra = 2;//color
  clrb = 3;//color
  clrc = 1;//color
  w = 1;// ossolation of ellipse
}
void draw()
{

  prepWindow();
  drawObjectbounce(bx, by, sd);
  drawObjectloop(lx,ly,sd);
  objectBounce();
  objectLoop();
  colorObject();
}

void prepWindow()
{
  fill (112, 10);
  rect ( 0, 0, width, height);
}

void drawObjectbounce(float x, float y, float d)
{
  w = w + .1;
  fill(a,b,c);
  ellipse(x, y ,d + 10 * cos(w) ,d + 10 * cos(w));
}

void drawObjectloop(float x, float y, float d)
{
  w = w + .1;
  fill(c,b,a);
  ellipse(x, y, d + 10 * cos(w), d + 10 * cos(w));
}


void objectBounce()
{
  bx = bx + bxSpeed;
  if (bx >= width - sd/2)
  {
    bxSpeed = -bxSpeed;
  }
  else if (bx <= sd/2 )
  {
    bxSpeed = -bxSpeed;
  }
  
  by = by + bySpeed;
  if ( by >= height - sd/2)
  {
    bySpeed = -bySpeed;
  }
  else if (by <= sd/2)
  {
    bySpeed = -bySpeed;
  }
}

void objectLoop()
{
  lx = lx + lxSpeed;
  if (lx > width)
  {
    lx = 0;
  }
  else if (lx < 0)
  {
    lx = width;
  }
  
  ly = ly + lySpeed;
  if ( ly > height)
  {
    ly = 0;
  }
  else if (ly < 0)
  {
    ly = height;
  }
}


void colorObject()
{
  a = a + clra;
  b = b + clrb;
  c = c + clrc;
  
  if (a >= 225)
  {
    clra = - clra;
  }
  else if (a <= 0)
  {
    clra = - clra;
  }
  
  if (b >= 225)
  {
    clrb = - clrb;
  }
  else if (b <= 0 )
  {
    clrb = - clrb;
  }
  
  if (c >= 225)
  {
    clrc = - clrc;
  }
  else if (c >= 225)
  {
    clrc = - clrc;
  } 
}

                
