
//Emanuele S. Reis - Exercícios linhas 1

void setup (){
size (200,200);
background (255);
}

void draw()
{
  
  background(204);
  strokeWeight (1);
  for (int mouseX=10; mouseX <250; mouseX=mouseX+25) 
  for (int mouseY= 10; mouseY <250; mouseY= mouseY+25)
  line(0,0, mouseX, mouseY);
   
 
}
