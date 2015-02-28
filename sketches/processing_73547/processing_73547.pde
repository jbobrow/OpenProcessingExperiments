
/*-------------------------------------------------------------------------
 Travail 3 - Le jeu
 Par Ugo Dufour et Simon Gauthier
 EDM4600 - UQAM 2012
 
 Merci a Thomas O Fredericks pour la coquille du jeu : http://www.openprocessing.org/sketch/71912
 -------------------------------------------------------------------------*/  

// Construction de la classe Humain.  
  class Humain {
    
  // Declaration des variables.  
    PImage img;
    float x;
    float y;
    
  // Reception des variables de la classe principale.
    Humain(float x, float y, PImage img) {
      this.x = x;
      this.y = y;
      this.img = img;
    }
    
  // Fonction draw qui dessine nos humains.   
    void draw() {
      image(img, x, y);
    }
    
  }



