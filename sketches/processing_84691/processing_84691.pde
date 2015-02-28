
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
  
  //ELLIPSE
  //Dessiné plusieurs ellipses
  
  strokeWeight(1);
  ellipse(250,250,35,50);
  strokeWeight(5);
  ellipse(250,250,25,40);
  strokeWeight(1);
  ellipse(250,250,75,90);
  strokeWeight(5);
  ellipse(250,250,85,100);
  
  strokeWeight(1);
  ellipse(170,250,35,50);
  strokeWeight(5);
  ellipse(170,250,25,40);
  strokeWeight(1);
  ellipse(170,250,75,90);
  strokeWeight(5);
  ellipse(170,250,85,100);
  
  strokeWeight(1);
  ellipse(90,250,35,50);
  strokeWeight(5);
  ellipse(90,250,25,40);
  strokeWeight(1);
  ellipse(90,250,75,90);
  strokeWeight(5);
  ellipse(90,250,85,100);
  
  strokeWeight(1);
  ellipse(330,250,35,50);
  strokeWeight(5);
  ellipse(330,250,25,40);
  strokeWeight(1);
  ellipse(330,250,75,90);
  strokeWeight(5);
  ellipse(330,250,85,100);
  
  strokeWeight(1);
  ellipse(410,250,35,50);
  ellipse(410,250,25,40);
  strokeWeight(1);
  ellipse(410,250,75,90);
  strokeWeight(5);
  ellipse(410,250,85,100);
  
  noLoop();
}


