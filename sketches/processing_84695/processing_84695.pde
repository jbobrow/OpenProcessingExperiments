
void setup()
{
  //SIZE
  //La taille en pixel du papier de la fenêtre est largeur= 500 hauteur= 500
  size(500,500);
  
  smooth();
 
  //BACKGROUND
  //Peindre le fond de notre fenetre 
  background(0);
}

void draw()
{
  stroke(255);
  line(10,320,140,185);
  strokeWeight(1);
  noFill();
  ellipse(70,250,105,130);
  
  strokeWeight(7);
  stroke(255);
  noFill();
  ellipse(70,250,75,100);
  
  
  strokeWeight(1);
  stroke(255);
  line(150,320,280,185);
  strokeWeight(9);
  noFill();
  ellipse(210,250,105,130);
  
  strokeWeight(3);
  stroke(255);
  noFill();
  ellipse(210,250,75,100);
  
  strokeWeight(1);
  stroke(255);
  line(290,320,420,185);
  strokeWeight(4);
  noFill();
  ellipse(350,250,105,130);
  
  strokeWeight(6);
  stroke(255);
  noFill();
  ellipse(350,250,75,100);
  
  noLoop();
  
  
}


