
float xPos=0;
float yPos=0;

void setup()
{
  size(800, 800);
  background(255);
  noStroke();
}

void draw()

{
  xPos=mouseX;
  yPos=mouseY;

  if (mousePressed)
  {
    fill(255, 0, 0);
    ellipse(xPos, yPos, 50, 50);
  }

  if (keyPressed&&key;== 'f')
  {
    fill(0,0,255);
    ellipse(xPos, yPos, 50, 50);
  }

  if (keyPressed&&key;=='t')

  {
    ellipse(xPos, yPos, 100, 100);
  }
  if(keyPressed&&key;=='r')
  {
    fill(random(0,255),random(0,255),random(0,255));
    ellipse(xPos,yPos, 50,50);
  }
  if(keyPressed&&key;=='v')
  {
    fill(0,255,0);
    ellipse(xPos,yPos,50,50);
  }
}
