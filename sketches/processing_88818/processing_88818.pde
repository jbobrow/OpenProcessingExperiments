
float diametre;
int etat;

void setup() {
  size(400, 400);
  smooth();
  frameRate(30);

  diametre = 100;
  etat = 0;
}


void draw() {
  background(0);

  /*
  boolean sourisAGaucheDeDroite = mouseX < width*0.5 + 200;
   boolean sourisADroiteDeGauche = mouseX > width*0.5;
   boolean sourisEnBasDuHaut = mouseY > height * 0.5;
   boolean sourisEnHautDuBas = mouseY < height * 0.5 + 100;
   
   if ( sourisAGaucheDeDroite
   && sourisADroiteDeGauche 
   && sourisEnBasDuHaut 
   && sourisEnHautDuBas
   && mousePressed ) {     
   //println("Dedans");
   fill(0,255,0);
   } else {
   // println("DeHors");
   fill(255);
   }
   */

  if ( etat == 0 ) {
    fill(255);
  } 
  else {
    fill(0, 255, 0);
  }


  rect(width*0.5, height*0.5, 200, 100);

  /*
  
   float distance = dist(mouseX,mouseY,width*0.5,height*0.5); 
   //println(distance);
   
   if ( distance < diametre * 0.5 ) {
   fill(255,0,0);
   } else {
   fill(255); 
   }
   
   ellipse(width*0.5,height*0.5,diametre,diametre);
   */
}


void mousePressed() {

  boolean sourisAGaucheDeDroite = mouseX < width*0.5 + 200;
  boolean sourisADroiteDeGauche = mouseX > width*0.5;
  boolean sourisEnBasDuHaut = mouseY > height * 0.5;
  boolean sourisEnHautDuBas = mouseY < height * 0.5 + 100;

  if ( sourisAGaucheDeDroite
    && sourisADroiteDeGauche 
    && sourisEnBasDuHaut 
    && sourisEnHautDuBas) {     

    if ( etat == 0 ) {
      etat = 1;
    } else {
      etat = 0;
    }
  }
}
/*
void mouseReleased() {
 etat =0; 
}
*/
