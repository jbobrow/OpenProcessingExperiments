
/*Laiane Merino Vignoto
Arquitetura e Urbanismo (s53)
fev/2014*/

void setup() 
{
  size(500, 500);
  background(241, 245, 77);
}
void draw() 
{
  pushMatrix();
  translate(250, 250);
  rotate(mouseX);
  for (int i = 2; i < width/2; i += 10) 
  {
    noFill();
    stroke(random(255), random(155), random(255));
    bezier(0, 0, mouseX/2, i, i, mouseY/2, 0, 0);
  }
  popMatrix();
}


/*Este trabalho está licenciado sob uma Licença Creative Commons Atribuição  4.0 Internacional. Para ver uma cópia desta licença, visite http://creativecommons.org/licenses/by/4.0/deed.pt.*/
