
  void setup () 
{
  size(600,600);
  //Fond blanc
  background(255); 
  smooth();
}

void draw()
{
  //Je créer une ellipse non remplie. (ellipse en haut)
  noFill();
  ellipse(300,250,100,100);
  //Je créer trois autres ellipses de la même taille. DUPLICATION/JUXTAPOSITION
  //(Ellipse en bas) 
  ellipse(300,350,100,100);
  //Ellipse à gauche) 
  ellipse(251,298,100,100);
  //(Ellipse à droite)
  ellipse(351,298,100,100);
  
  noLoop();
}


