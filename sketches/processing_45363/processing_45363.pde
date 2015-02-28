
// Cette classe permet de créer les particules qui composent une explosion et met à jour leurs positions
 
class Explosion
{
//Attributs
  float posX, posY; // Position en X et Y d'une particule
  PVector vitesse = new PVector(); // Vitesse de déplacement des particule
  PVector acceleration = new PVector();// Acceleration d'une particule (en x et y)
  color couleur; // Couleur de l'explosion, est la même que la couleur de la brique touchée
  float tempsPasse = millis(); // Temps écoulé jusqu'à maintenant
  float tempsAffichage = random(300,1000); // Temps que sera affichée une particule
  float angle; // Angle de direction d'une particule
   
//Constructeur
  Explosion(float posX, float posY, color couleur)
  {
    this.posX = posX;
    this.posY = posY;
    this.couleur = color(couleur,200);
 
    angle = random(2*PI); // 360 degrés autour du point d'impact
    acceleration.x = 0;
    acceleration.y = 0;
    vitesse.x= random(0.1,0.5);
    vitesse.y= random(0.1,0.5);
  }
   
 //Méthodes
  boolean draw()
  {
    
  // Si le temps d'affichage est dépasser, retourner faux, donnera pour effet de retirer la particule de la liste
    if ( millis() - tempsPasse > tempsAffichage ) return false;
   
  // Tant que le temps d'affichage n'est pas terminer, mettre à jour la position et la vitesse de la particule.
    else
    {
      vitesse.x=vitesse.x+acceleration.x;
      vitesse.y=vitesse.y+acceleration.y;
      posX = posX+cos(angle)*vitesse.x;
      posY = posY+sin(angle)*vitesse.y;
      stroke(couleur);
      strokeWeight(1);
      point(posX,posY);
      acceleration.x = random(0.1);
      acceleration.y = random(0.1);
     }
      
    return true; // Retourne vrai, ce qui permettera l'affichage de la particule dans la fonction principale
  }
 
}

