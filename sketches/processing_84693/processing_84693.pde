
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
  strokeWeight(3);
  ellipse(250,250,55,70);
  strokeWeight(4);
  ellipse(250,250,45,60);
  strokeWeight(2);
  ellipse(250,250,65,80);
  strokeWeight(1);
  ellipse(250,250,105,120);
  strokeWeight(1);
  ellipse(250,250,145,160);
  strokeWeight(7);
  ellipse(250,250,155,170);
  
  
  
  strokeWeight(1);
  ellipse(100,100,35,50);
  strokeWeight(3);
  ellipse(100,100,55,70);
  strokeWeight(4);
  ellipse(100,100,45,60);
  strokeWeight(2);
  ellipse(100,100,65,80);
  strokeWeight(1);
  ellipse(100,100,105,120);
  strokeWeight(1);
  ellipse(100,100,145,160);
  strokeWeight(7);
  ellipse(100,100,155,170);
  
  strokeWeight(1);
  ellipse(400,400,35,50);
  strokeWeight(3);
  ellipse(400,400,55,70);
  strokeWeight(4);
  ellipse(400,400,45,60);
  strokeWeight(2);
  ellipse(400,400,65,80);
  strokeWeight(1);
  ellipse(400,400,105,120);
  strokeWeight(1);
  ellipse(400,400,145,160);
  strokeWeight(7);
  ellipse(400,400,155,170);
  
  noLoop();
}


