
// ***************** CLASE TEXT STRING ******************

class Tweet {
 // 1.- Propiedades - - - - - - - - - - -  - - - - - - - - 
float posX, posY; // punto de inicio de texto
float tamano; // tamano de texto


// 2.- Construcción  - - - - - - - - - - - - - - - - - 
Tweet (){
 this.posX = random (width-250);
this.posY = random (height-250);
this.tamano = random (10,100);

    
}
  
// 3.- Métodos - - - - -  - - - - - - - - - - - - - - - 

void desahogoSocial () {
  
PFont cohesionSocial;

cohesionSocial = createFont ("Comic Sans MS Bold.ttf", tamano);
   fill(0);
  stroke(0);
  textFont (cohesionSocial);
  textSize (tamano);
  text ("#Nepomuceno",posX,posY);
  
  
  
}
}

