
void setup (){
size (200,200);
background (255);
}

void draw()
{
  background(42,7,93);
  stroke (0);
  strokeWeight (1);
  for (int mouseX=5; mouseX <250; mouseX=mouseX+25) 
  for (int mouseY= 5; mouseY <250; mouseY= mouseY+25)
  line(0,0, mouseX, mouseY);
 
}
