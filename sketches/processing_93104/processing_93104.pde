
void setup (){
size (200,200);
background (255);
}

void draw()
{
  stroke (229,39,39);
  strokeWeight (1);
  for (int mouseX=10; mouseX <250; mouseX=mouseX+20) 
  for (int mouseY= 10; mouseY <250; mouseY= mouseY+20)
line(0,0, mouseX, mouseY);
}
