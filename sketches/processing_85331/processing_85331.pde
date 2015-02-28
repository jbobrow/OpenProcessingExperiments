
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
  //Les formes suivnates auront un contour blanc
  stroke(255);
    strokeWeight(6);
  
  //ELLIPSE
  //Dessiné plusieurs ellipses
   arc(250,250,100,110,1,2);
   arc(250,250,100,110,3,4);
  
   //LIGNE
  //Dessiné plusieurs traits
  line(250,250,231,298);
  line(216,209,250,250);
  
  
  
  noLoop();
}


