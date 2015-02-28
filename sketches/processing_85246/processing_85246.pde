
void setup()
{ // la taille et le fond
  size(500,500);
  smooth();
  background(0);

}

void draw ()
{ //je crée une boucle for pour faire tourner mes formes
    translate(width/2,height/2);
  for (int i=0;i<360;i+=5)
  { //premiere rotation 
    rotate(radians(5));
    strokeWeight(4);
    stroke(#FFF700,95);
   line(100,100,150,150);
  
   //je crée une rotation de lignes penchées
   strokeWeight(10);
   line(100,100,100,150);
   //je crée une ligne penchée dans l'autre sens
   line(50,100,100,100);
  }
  //je crée une autre série de lignes 
  
  for (int i=0;i<360;i+=10)
  { 
    rotate(radians(10));
    strokeWeight(2);
    stroke(#FFF700,90);
   line(10,10,100,100);
   //je crée une autre série de lignes au centre
   strokeWeight(8);
   line(20,20,70,70);
   
  }
 
  
  noLoop();
}

