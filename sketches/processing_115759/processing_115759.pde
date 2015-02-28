
void setup()
{
  size(400,400);
  
}

int r1 = 255;
int r2 = 255;
int r3 = 255;
int g1 = 255;
int g2 = 255;
int g3 = 255;
int b1 = 255;
int b2 = 255;
int b3 = 255;

float speed1 = random(2,5);
float speed2 = random(2,5);
float speed3 = random(2,5);

float r1x = 10;
float r2x = 10;
float r3x = 10;


void draw()
{
  stroke(0);
  background(255);
  r1x += speed1;
  r2x += speed2;
  r3x += speed3;
  if(r1x >= 390 || r1x <=0)
  {
    speed1 *= -1;
    speed2 *= -1;
    speed3 *= -1;
    r1 = int(random(0,255));
    g1 = int(random(0,255));
    b1 = int(random(0,255));
  }
  if(r2x >= 390 || r2x <=0)
  {
    speed1 *= -1;
    speed2 *= -1;
    speed3 *= -1;
    r2 = int(random(0,255));
    g2 = int(random(0,255));
    b2 = int(random(0,255));
  }
  if(r3x >= 390 || r3x <=0)
  {
    speed1 *= -1;
    speed2 *= -1;
    speed3 *= -1;
    r3 = int(random(0,255));
    g3 = int(random(0,255));
    b3 = int(random(0,255));
  }
  fill(r1, g1, b1);
  rect(r1x,100,10,10);
  fill(r2, g2, b2);
  rect(r2x,200,10,10);
  fill(r3, g3, b3);
  rect(r3x,300,10,10);
}

