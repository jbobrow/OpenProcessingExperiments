
//class Particule
//CCCAM

final float gravite = 0.05;
class Particule {
  //champs
  float posX, posY;
  float velX, velY;
  float longevite;
  color couleur;

  boolean traine=true;
  boolean explosive = false;
  boolean couleurAleatoire = true;

  //constructeur 
  Particule(float posx, float posy, float vx, float vy, float lon, color coul) {
    posX = posx;
    posY = posy;
    velX = vx;
    velY = vy;
    longevite = lon;
    couleur = coul;
  }

  //methodes
  void display() {
    if (couleurAleatoire) {
      fill(random(200,couleur), 255, 255);
    }
    else {
      fill(couleur, 255, 255);
    }

    ellipse(posX, posY, 4, 4);
    
    
    
    
  }

  void move() {
    velX +=0;
    velY += gravite;

    posX += velX;
    posY += velY;
  }
}




