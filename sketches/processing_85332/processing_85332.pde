
void setup()
{
  //SIZE
  //La taille en pixel du papier de la fenêtre est largeur= 500 hauteur= 500
  size(500,500);
  
  smooth();
 
  //BACKGROUND
  //Peindre le fond de notre fenetre (0)
  background(0);
}

void draw()
{
  
  
  //NOFILL
  //les formes suivantes ne seront pas remplies
  noFill();
  
  //STROKE
  //Les formes suivnates auront un contour coloré et une épaisseur de 6pt
  stroke(255);
  strokeWeight(6);
  
  //ELLIPSE
  //Dessiné plusieurs ellipses
  strokeWeight(6);
  arc(250,250,100,110,2,3);
  arc(250,250,100,110,5,6);

 //LIGNE
//Dessiné plusieurs traits
  line(250,250,231,298);
  line(264,199,250,250);
  
  
  
  noLoop();
}


