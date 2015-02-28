

//identification de mes variables
import processing.video.*;
Capture myCapture;

int largeur;
int hauteur;
int x=0;
int y=0;

//***********SETUP***************- ajout de la fonction myCapture pour la webcam.
void setup() 
{
  size(400, 400);
  noStroke();         
  smooth();           
  myCapture = new Capture(this, width, height, 49);
}

void captureEvent(Capture myCapture) {
  myCapture.read();
}



void draw() {
  
  //Séparation de la zone de travail en carrés, création de boucle pour les rect
 
 if(mouseX<=90 && mouseY<=90){


 }


 largeur = (myCapture.width)/22;
 hauteur = (myCapture.height)/22;
   for(int x=0; x<(myCapture.width); x=x+largeur) {
    for(y=0; y<(myCapture.height); y=y+hauteur) {
      color c = myCapture.get(x, y);
      rectMode(CENTER);
      fill(c);
      rect(x, y, largeur, hauteur);
    }
    }
  
}

