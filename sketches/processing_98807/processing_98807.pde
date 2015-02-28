
int diameter;

void setup()
{
  size(400, 600);
  background(255, 255, 255);
  smooth();
  frameRate(60);
  
  diameter = 1;
  
  fill(255, 0, 0);
}

void draw()
{ 
  background(255, 255, 255);
 
  ellipse(width/2, height/2, diameter, diameter);
}

void mouseMoved()
{
  diameter = diameter + 2;
}

void mouseDragged()
{
  diameter = diameter - 2;
}

void keyPressed()
{
  fill(random(255), random(255), random(255) );
}
