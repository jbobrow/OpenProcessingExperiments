

void setup()
{
  size(800,800);
  background(255);
  smooth();
  noFill();
  
  //Rapidité d'éxécution
  frameRate(15);
  
  }
  //Création d'ellipse sous condition
  void draw()
  {
   if (mousePressed)
   {
   
   //Paramètre couleurs et oppacité
    stroke(random(255), random(0), random(155), 60);
    
    //StrokeWeight au hasard de 1 à 55
    float strokeweight=random(55)
    strokeWeight(strokeweight);
    
    //Diamètre au hasard de 1 à 250, suivant la position de la souris
    float diametre=random(250);
 ellipse(mouseX,mouseY,diametre,diametre);
}
}




