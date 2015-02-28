
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
  
  
  //ELLIPSE
  //Dessiné plusieurs ellipses
 
  stroke(255);
  noFill();
  ellipse(200,250,105,130);
  
  noStroke();
  fill(255);
  ellipse(305,250,105,130);
  
  stroke(0);
  noFill();
  ellipse(355,200,75,100);
  
  strokeWeight(5);
  stroke(0);
  noFill();
  ellipse(355,200,105,130);
  
  strokeWeight(1);
  stroke(0);
  noFill();
  ellipse(355,200,115,140);
  
  strokeWeight(10);
  stroke(0);
  noFill();
  ellipse(355,200,55,80);
  
  
  
  noLoop();
}


