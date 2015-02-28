
void setup (){
size (200,200);
background (255);
}

void draw()
{
  background(204);
  fill (0);
  strokeWeight (5);
  for (int mouseX=5; mouseX <250; mouseX=mouseX+25) 
  line (mouseX, mouseY, mouseX, mouseY);
  }
