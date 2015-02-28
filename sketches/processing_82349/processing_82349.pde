
void setup() 
{
  size(800, 500);
  background (255);
  smooth ();

}

//on va lire ce programme en boucle

void draw() 
{
line(0, mouseY, 200, mouseX);
line(200, mouseX,400, mouseY);
line(400, mouseY, 600, mouseX);
line(600, mouseX, 800, mouseY);
}


