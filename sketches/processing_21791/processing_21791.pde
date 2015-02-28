
/* 

Tapisserie - Projet 2 
Algoritmie de base et interactivité
Kristine Bergeron
Champ de Bamboo !!! 

*/


// initiation des variables

PImage b;


int bambooWidth = 12;
int bambooHeight = 60;

// ********* SetUp ********* //

void setup() {
  size(400,400); //determine la grandeur de la fenetre
  
  b = loadImage("bambooo.jpg");
background(b); // determine l'image a loader


  }
  
// ****** Draw ******** //

void draw () {


 /* determine la répétition des rectangles,
    la postition etc */ 

  fill(200,243,91);
   for (int y= 7; y<height; y += 20){
    for (int x= 2; x<width; x += 20){
  
  
      rect(x, y,bambooWidth, bambooHeight);
  
      if (mouseX >= x && mouseX <= x+bambooWidth && 
        mouseY >= y && mouseY <= y+bambooHeight) {
       
   
// ********* changement de couleur au clic de souris ****** //

 if(mousePressed) { 
  fill(255,124,233);
 }else { 
  fill(41,255,225);
}  

}
        rect(x, y,bambooWidth, bambooHeight);
      }
      fill(175,250,91);
    }
  }
  
     





