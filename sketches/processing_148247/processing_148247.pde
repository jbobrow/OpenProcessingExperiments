
void setup()
{
  size(600,600);
  background(50,100,200);
  smooth();
}


void draw()
{ 
  fill(100,mouseX,mouseY);
  ellipse(300,300,mouseX,mouseY);
}

