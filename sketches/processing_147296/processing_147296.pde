
int up;
int side;

void setup ()
{
  size (400,400);
  size(600,900);

  background (random(0,0), random(20,255), random(0,0));
fill(255,255,0);
rect (random(0,600),random(200,700),random(20,200),random(20,300));
rect (random(0,600),random(200,700),random(20,200),random(20,300));
rect (random(0,600),random(200,700),random(20,200),random(20,300));
rect (random(0,600),random(200,700),random(20,200),random(20,300));
rect (random(0,600),random(200,700),random(20,200),random(20,300));
rect (random(0,600),random(200,700),random(20,200),random(20,300));
rect (random(0,600),random(200,700),random(20,200),random(20,300));
rect (random(0,600),random(200,700),random(20,200),random(20,300));
rect (random(0,600),random(200,700),random(20,200),random(20,300));
rect (random(0,600),random(200,700),random(20,200),random(20,300));

fill(255,0,0);
triangle(110,900,165,860,170,900);

fill(0,255,255);
triangle(310,900,365,860,370,900);
}
void draw ()
{
  
  fill(123,0,255);
  rect (side,up,40,40);
  
  if (key=='w')
  {
    up=up-1;
  }
  else if (key=='s')
  {
    up=up+1;
  }
  else if (key=='a')
  {
    side=side-1;
  }
  else if (key=='d')
  {
    side=side+1;
  }
}



