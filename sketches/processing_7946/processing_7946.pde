
void setup() {
  size(200, 500);
  background(#FFFFFF);
  smooth();
  stroke(5);
      // noCursor() pour faire disparaitre le curseur de la souris.
  noCursor();
 }


void draw() {
     //Si je presse la souris.
  if (mousePressed == true) { 
     //Fond de couleur aléatoire entre blanc et noir.
        background(random(100,255));
     
     //Trait blanc.
        stroke(255);
       
     //Quatres lignes aléatoires entre la position 
     //de la souris et la position de la souris + 50. 
        line(mouseX,mouseY,random(mouseX, mouseX+50),random(mouseY-50, mouseY));
        line(mouseX,mouseY,random(mouseX, mouseX+50),random(mouseY, mouseY+50));
        line(mouseX,mouseY,random(mouseX-50, mouseX),random(mouseY-50, mouseY));
        line(mouseX,mouseY,random(mouseX-50, mouseX),random(mouseY, mouseY+50));
 
  } 
  
  //Si je clique sur une touche.
  if (keyPressed == true) {
        //Screenshot
        saveFrame();
        //Reset du clip.
        background(random(100,255));
   };
    }


     //Quand je relache la souris.
void mouseReleased() { 
     //J'ai un fon aléatoire.
        background(random(0,255));
}
  
  






