
float x,y;

void setup() {
  size(200,200);
  smooth();
}


void draw() {
  
  background(255);
  
  // se déplacer avec une vitesse propertionelle vers la souris
  x = (mouseX - x) /15 + x;
  y = (mouseY - y ) /15 + y;
  
  // ajouter un décalage avec noise()
  float xD = x + noise(frameCount*0.05) * 30 - 15;
  float yD = y  + noise(frameCount*0.06+50) * 30 - 15;
  
  
  // Dessin de la mouche réalisé par Sophie Blondeau.
  if( mouseX - x  > 0)
   {
   stroke(0);
   ellipse(xD,yD-5,10,7);
   fill(0);
   ellipse(xD,yD,20,8);
   strokeWeight(2);
   line(xD+10,yD-4,xD+13,yD-8);
   fill(255);
   ellipse(xD+5,yD+1,7,7);}
   else
 {
   stroke(0);
   ellipse(xD,yD-5,10,7);
   fill(0);
   ellipse(xD,yD,20,8);
   strokeWeight(2);
   line(xD-10,yD-4,xD-13,yD-8);
   fill(255);
   ellipse(xD-5,yD+1,7,7);
 }
  
  
}               
