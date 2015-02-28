
// Cette classe permet de créer un objet Brick et de l'afficher sur le canevas

class Brick
{
//Attributs
  float posX; // Position en X de la brique
  float posY;// Position en Y de la brique
  color couleur; // cCuleur de la brique
  float largeur = 25; // Dimension verticale de la brique
  float hauteur = 25; // Dimension horizontale de la brique
  
//Constructeur
  Brick(float posX, float posY, color couleur)
  {
    this.posX = posX;
    this.posY = posY;
    this.couleur = couleur;
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
  
}

