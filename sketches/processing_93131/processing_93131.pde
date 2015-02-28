
//Emanuele S. Reis- Exercicio linhas
void setup (){
size (200,200);
background (255);
}

void draw()
{
  background(204);
  fill (0);
  strokeWeight (2);
  for (int mouseX=5; mouseX <250; mouseX=mouseX+25) 
  for (int mouseY= 5; mouseY <250; mouseY= mouseY+25)
  line (30, mouseX,mouseY, 50);
 
}
