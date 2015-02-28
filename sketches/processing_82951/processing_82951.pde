
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
  //les formes suivantes n'auront pas de contour
  noStroke();
 
  //FILL
  //Les formes suivantes seront peintes
  fill(73,118,240,50);
  
  //RECTANGLE
  //Dessiner un rectangle
  rect(10,10,100,100);
  
  //RECTANGLE
  //Dessiner un rectangle
  fill(255,94,0,50);
  scale(1.5);
  rect(10,10,100,100);
  
   //RECTANGLE
  //Dessiner un rectangle
  fill(38,250,206,50);
  scale(1.8);
  rect(30,10,100,100);
  
   //RECTANGLE
  //Dessiner un rectangle
  fill(32,0,250,50);
  scale(3);
  rect(10,10,100,100);
  
  //RECTANGLE
  //Dessiner un rectangle
  fill(5,255,32,70);
  scale(2);
  rect(20,10,100,100);



  //NOLOOP
  noLoop();
}


