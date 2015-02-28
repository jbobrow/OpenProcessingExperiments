
int r= 40;
float a= 10;
float posX= 0;
float posY= 0;

void setup()
{
  size(500, 500);
  posX= width/2;
  posY= height/2;
}

void draw()
{
  background(220); 
  fill(20, 240, 0); 
  ellipse(posX, posY, r, r);
  posY+=a;

  if (posY > height-r)
  {
    posY=height-r/2;
  }
}



