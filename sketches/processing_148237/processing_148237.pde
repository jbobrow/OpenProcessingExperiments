
void setup()
{
  size(1200, 750);
  background(0, 0, 0    );
  smooth();
}

void draw()
{

stroke(random(255), random(255), random(255));
  ellipse(mouseX, mouseY, 50,50);
} 

void keyPressed()
{
  fill(random(255), random(255), random(255));
  if(key=='r')
  {
    fill(255,0,0);
  }
  if(key=='b')
  {
    fill(0,0,200);
  }
  if(key==' ')
  {
    background(0,0, 0);
    fill(255,255,255);
  }
}

