
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
  arc(250,250,100,110,0,1);

 //LIGNE
  //Dessiné plusieurs traits
  
  line(250,250,300,250);
  line(250,200,250,250);
  
  
  
  noLoop();
}


