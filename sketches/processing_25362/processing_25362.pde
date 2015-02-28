
/* Détermine des éléments de la class abeilles */

class Abeille {
  
 
 float x;
 float y;
 
 PImage a;
  Abeille( float x , float y) {
   
   a = loadImage("abeille.png"); // détermine l'image à utiliser 
   this.x = x;
   this.y = y;
     
  }
   
  /* Détermine la grandeur des abeilles, leur position, 
  le nombre etc. */ 
  
  void draw() {
    
    noStroke();
   image(a,mouseX+random(0,80),mouseY+random(0,80),40,40);
     
  }
   
   
   
}

