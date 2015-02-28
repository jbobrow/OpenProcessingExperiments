
//Torres Torres Felipe Andrés

float a=0;

void setup()
{
  size(400,400);
  frameRate(10);
  smooth();
}

void draw()
{
  background(55,75,255);
  fill(255,255,0);
  if(a==0)
  {
    a=1;
    arc(200,200,100,100,0.5,5.7);
    fill(0,0,0);
    arc(183,190,20,20,0.5,5.7);
  }
  else 
  {
    a=0;
    arc(200,200,100,100,0,TWO_PI);
    fill(0,0,0);
    arc(183,190,20,20,0,TWO_PI);
  }
  
}


