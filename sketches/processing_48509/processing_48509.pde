
void setup()
{
  size(400,600);
  background(188,245,224);
  smooth();
  frameRate(15);
}

void draw()
{
  //fill(0,225,225);
  ellipse(mouseX,mouseY,50,50);
  
}

void mousePressed()
{
  fill(random(255),random(255),random(255),random(255) );
  
  
}

