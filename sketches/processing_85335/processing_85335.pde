
void setup()
{
  //SIZE
  //La taille en pixel du papier de la fenêtre est largeur= 500 hauteur= 500
  size(500,500);
  
  smooth();
 
  //BACKGROUND
  //Peindre le fond de notre fenetre (0)
  background(255);
}

void draw()
{
  
  
  //NOFILL
  //les formes suivantes ne seront pas remplies
  noFill();
  
  //STROKE
  //Les formes suivnates auront un contour coloré et une épaisseur de 6pt
  stroke(88,255,0,70);
  strokeWeight(9);
  
   //ELLIPSE
  //Dessiné plusieurs ellipses
  arc(250,250,100,110,0,1);

 //LIGNE
  //Dessiné plusieurs traits
  
  line(250,250,300,250);
  line(250,200,250,250);
  
   //STROKE
  //Les formes suivnates auront un contour coloré et une épaisseur de 6pt
  stroke(80,0,255,70);
  strokeWeight(9);
  
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


