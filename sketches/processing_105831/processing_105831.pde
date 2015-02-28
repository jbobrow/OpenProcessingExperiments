
int r= 40;
float a= 8;
float b =5;
float posX= 0;
float posY= 0;


void setup()
{
  size(500, 500);
  posX= random(0, 500);
  posY= random(0, 500);
}


void draw()
{
  background(240); 
  noStroke();
  fill(random(0, 255), random(0, 200), random(0, 255)); 
  ellipse(posX, posY, r, r);
  posX= posX + b;
  posY= posY+ a;
  b*= 1;
  a*= 1;

  if (posX > width || posX < 0)
  {
    b*= -1;
  }
  if (posY > height || posY < 0)
  {
    a*= -1;
  }
}



