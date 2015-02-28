
int Size = 300;
float pX= Size, pY=Y;
int speedX=1, speedY=1;
int i =250;
 
void setup()
{
  size(800, 800);
  background(0);
}

void draw()
{

  fill(0,5);
  rect(0, 0, width, height);
 
  pY = (sin(i*PI/120)+1 )*(width-Size)/3+Size/2;
  fill(255);
  noStroke();
  fill(pX*255, 0, 255, 180);
  ellipse(pX, pY, Size, Size);
  fill(0, 255,108, 180);
  ellipse(pY, pX, Size, Size);
  fill((pX*255/300), 0, 0, 180);
  ellipse(pY, pY, Size, Size);
  fill((pX*255/174), 255, 210, 180);
  ellipse(width-pX, height-pY, Size, Size);
  fill((pX*255/400), pX*255/300, 0, 180);
  ellipse(width-pY, height-pX, Size, Size);
  fill(0, pX*255/300, 210, 180);
  ellipse(width-pY, height-pY, Size, Size);
  
  
  pX += speedX;
  if (pX< Size || pX > width-Size)
    speedX = -speedX;
  i = i + speedY;
  if (i <= 180 || i >= 300)
    speedY = -speedY;
}


