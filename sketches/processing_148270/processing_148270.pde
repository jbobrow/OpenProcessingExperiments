
void setup ()
{ 
  size (1000, 800);
  background(random(255),random(255),random(255));
}

void draw ()
{
  stroke(random(255),random(255),random(255));
//line(500,400,mouseX,mouseY);
fill(random(255),random(255),random(255));
ellipse(500,400,mouseX,mouseY);
//ellipse(1000,800,mouseX,mouseY);
//ellipse(0,800,mouseX,mouseY);
//ellipse(1000,0,mouseX,mouseY);
//ellipse(0,0,mouseX,mouseY);
}

