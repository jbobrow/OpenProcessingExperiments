
//HW6
//(c) Sunny Li 2013

float fx, fy, fd, fxvel;
float bx, by, bd, byvel;

void setup()
{
  fx = 150;
  fy = 150;
  fd = 100;
  fxvel = 2;
  
  bx = 250;
  by = 250;
  bd = 75;
  byvel = 2;
  
size(400,400);
background(89, 93, 94);
smooth();
noStroke();


}

void figure (float fx, float fy, float fd)
{

  fill(112, 155, 166);
  ellipse(fx, fy, fd, fd);
  fill(155, 184, 189);
  ellipse(fx, fy, fd*.5, fd*.5);
}

void movefigure()
{
  fx = fx + fxvel;
  if (fx > width + fd/2)
  {
    fx = -fd/2;
  }
}


void bounce (float bx, float by, float bd)
{
  fill(175, 191, 185);
  ellipse(bx, by, bd, bd);
  fill(199, 219, 216);
  ellipse(bx, by, bd*.5, bd*.5);
}

void movebounce()
{
  by = by + byvel;
  if (by > height - (bd*.4))
  {
    byvel = -byvel;
  }
  else if(by < (bd*.4))
  {
    byvel = -byvel;
  }
}

void draw()
{
  background(89, 93, 94);
  figure(fx, fy, fd);
  movefigure();
  bounce(bx, by, bd);
  movebounce();
}

void mousePressed()
{
  background(89, 93, 94, 20);
  noLoop();
}

void mouseReleased()
{
  loop();
}

//}
