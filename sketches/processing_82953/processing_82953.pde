
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
  //NOSTROKE
  noStroke();
  //ELLIPSE
  //Dessiner une ellipse
  fill(255,5,9,50);
  scale(1);
  ellipse(200,200,500,500);
  
   //ELLIPSE
  //Dessiner une ellipse
  fill(255,5,164,50);
  scale(0.8);
  ellipse(200,200,500,500);
  
   //ELLIPSE
  //Dessiner une ellipse
  fill(183,5,255,50);
  scale(0.8);
  ellipse(200,200,500,500);
  
  //ELLIPSE
  //Dessiner une ellipse
  fill(5,44,255,50);
  scale(0.8);
  ellipse(200,200,500,500);
  
  //ELLIPSE
  //Dessiner une ellipse
  fill(5,203,255,50);
  scale(0.8);
  ellipse(200,200,500,500);
 
  //ELLIPSE
  //Dessiner une ellipse
  fill(5,255,103,30);
  scale(0.8);
  ellipse(200,200,500,500);
  
   
  //ELLIPSE
  //Dessiner une ellipse
  fill(108,255,5,50);
  scale(0.8);
  ellipse(200,200,500,500);

  //ELLIPSE
  //Dessiner une ellipse
  fill(238,255,5,50);
  scale(0.8);
  ellipse(200,200,500,500);  

  //NOLOOP
  noLoop();
  
}


