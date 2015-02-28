

void setup()
{
  size(500,500);
  smooth();
  noCursor();
 
}
void draw()
{stroke(0);
  ellipse(0,0,2*mouseX,2*mouseY);
  ellipse(0,500,2*mouseX,2*mouseY);
  ellipse(500,0,2*mouseX,2*mouseY);
  ellipse(500,500,2*mouseX,2*mouseY);
  ellipse(250,250,mouseX,mouseY);
}

