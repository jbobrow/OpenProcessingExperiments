
void setup() {
 //Taille du sketch. 
   size(300, 500);
 //Fond noir. 
   background(#FFFFFF);
 //Taux d'image. (Image par seconde = ips)
   frameRate(60);
 //Adoucir les angles. 
   smooth();
 //Epaisseur des traits. 
   strokeWeight(0.5);
 // noCursor() pour faire disparaitre le curseur de la souris.
   noCursor();
 }

//Variable ou r = 0.
float r =  0;

void draw() {
//Si je presse la souris.
  if (mousePressed == true) { 
//Fond de couleur noir.
        background(0);
//Boucle.       
   for (int b=1; b<200;b++  ) 
    {
//Couleur de ligne, blanche.      
     stroke(255);
//Definition du point de départ et d'arrivée de la ligne.     
     line (r, frameCount/b/2, width-r, frameCount/b); 
     line (r, frameCount/b, width-r, frameCount/b/2);
     line (frameCount/b/2, r, width-r, frameCount/b); 
     line (width-frameCount/b/2, r, r, frameCount/b); 
     }  
  }
  
  }  
  
//Quand je relache la souris.  
  void mouseReleased()
{
//Screenshot !  
  saveFrame();
}
  
  
 //Thomas Fontaine. Musique écoutée pendant la réalisation du Sketch, bande originale de More, par Pink Floyd.

