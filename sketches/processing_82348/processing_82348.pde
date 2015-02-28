
void setup() 
{
  size(800, 500);
  background (255);
  smooth ();
}

//on va lire ce programme en boucle

void draw() 
{
line( mouseX,mouseY,0,250);
line (mouseX,mouseY,800,250);
}




