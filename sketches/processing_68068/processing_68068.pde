
float a=QUARTER_PI;
float b=TWO_PI-QUARTER_PI;
int mov=0;
void setup()
{
  size(500,500);
  smooth();
}

void draw()
{
  frameRate(5);
  background(0);
  fill(255,255,0);
  stroke(0);
  arc(250,250,120,120,a,b);
  fill(0);
  ellipse(220,220,20,20);
  if(mov==0)
  {
    mov=1;
    a=0;
    b=TWO_PI;
  }
  else
  {
    mov=0;
    a=QUARTER_PI;
    b=TWO_PI-QUARTER_PI;
  }
}

