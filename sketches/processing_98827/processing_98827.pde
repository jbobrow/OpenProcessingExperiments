
int diameter;

void setup()
{
  size(400, 600);
  background(255, 255, 255);
  smooth();
  frameRate(60);
  
  diameter = 0;
}

void draw()
{ 
  ellipse(width/2, height/2, diameter, diameter);
}

void mouseDragged()
{
  diameter = diameter + 2;
}

void mousePressed()
{
  diameter = 0;
  fill( random(255), random(255), random(255) );
}

void keyPressed()
{
  background(255, 255, 255);
  diameter = 0;
}
