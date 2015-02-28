
class Enemis {

  // Déclaration des variables globales

  float x, y, rY;
  float vY = 9; // Vitesse des enemis
 
  int[] dir = {  // Tableau contenant les vitesses des enemis
    -1, 1
  };
  int vX = dir[int(random(dir.length))]; // Valeur égalant à l'indice choisie
  float d = 24; // Diamètre de l'enemi
  PImage  e1_1, e1_2, e1_3;

  Enemis(float x, PImage[] images) {
    this.x = x;
    this.y = 75;
    this.rY = 30;
   
      e1_1 = images[0];
      e1_2 = images[1];
      e1_3 = images[2];
   
  }

  void draw() {
    if(x>=0-d && x<width+d) { // Si la valeur X de l'enemi est de 0 à 400...
      if(y<(height-rY)-d) { // Si l'enemi est plus haut que le sol...
        image(e1_1, x, y);
        if(y<120) { // Si l'enemi dépasse la valeur Y 120...
          vY = vY-0.7; // Réduire sa vitesse
        }
        y-=vY;
        x = x + vX;
      }else {
        // Sélection de l'enemi en fonction de la valeur aléatoire vX
        if(vX>=0) {
          image(e1_2,x,y);
        }else {
          image(e1_3,x,y);
        }
        x = x + vX; // Déplacement de l'enemi
      }
    }
  }
}

