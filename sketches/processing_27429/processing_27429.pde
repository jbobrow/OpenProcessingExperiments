
// Cette classe permet de créer un objet Brick et de l'afficher sur le canevas
 
class Brick
{
//Attributs
  float posX; // Position en X de la brique
  float posY;// Position en Y de la brique
  color couleur; // cCuleur de la brique
  float largeur = 25; // Dimension verticale de la brique
  float hauteur = 25; // Dimension horizontale de la brique
  boolean etat;
   
//Constructeur
  Brick(float posX, float posY)
  {
    this.posX = posX;
    this.posY = posY;
    this.couleur = couleurBrick();
  }
   
//Méthodes
   
 //Afficher la brique sur le canevas
  void draw()
  {
    rectMode(CORNER);
    stroke(200);
    strokeWeight(2);
    fill(couleur);
    rect(posX,posY-hauteur, largeur, hauteur);
  }
 
 //Déplace les briques déjà présente d'une rangée vers le bas 
  void translateBrick()
  {
    posY = posY + hauteur; // décale la brique d'une position vers le bas
  }
  
  color couleurBrick()
{
   //Définir une couleur aléatoire pour la brique actuelle
   couleurBrick[0] = color(random(100,200),random(15,50),random(125,160)); 
   couleurBrick[1] = color(random(80,130),random(70,120),random(160,220));
   couleurBrick[2] = color(random(220,255),random(210,250),0);
   couleurBrick[3] = color(random(40,100)); 
   couleurChoisie = couleurBrick[floor(random(4))];
   
   return couleurChoisie;
}


  
   
}

