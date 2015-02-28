
void setup()
{
  //SIZE
  //La taille en pixel du papier de la fenêtre est largeur= 220 hauteur= 200
  size(500,500);
  
  smooth();
 
  //BACKGROUND
  //Peindre le fond de notre fenetre 
  background(255);
 
}

void draw()
{
  translate(200, 200);
  quad(0, 0, 20, 10, 75, 66, 15, 80);

}


