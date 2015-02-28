

// ARBRE SIMPLE
// On parle de récursion lorsqu'une fonction s'invoque elle-même.

void setup() {
   
  size (500,500) ;
  background(255) ;
  smooth() ;
  colorMode (HSB,100) ;
  
  // 1er et unique appel de la méthode branche
  // Paramètres : x, y, taille, couleur
  branche (width/2, 400, 120, 0) ;
  
}

void branche(float x, float y, float taille, int couleur) {
  
  // Choix du feutre - on change de couleur pour chaque nouveau niveau de branches
  stroke (couleur,100,100) ; // H, S, B
  
  // Dessin d'un segment montant vers la droite
  line (x, y, x + taille, y - taille) ;
  
  // Dessin d'un segment montant vers la gauche
  line (x, y, x - taille, y - taille) ;
  
  // Condition limite pour réitérer la méthode
  // Si la variable "taille" est supérieure à 2, la répétition s'effectue 2 fois, dans 2 directions, avec la taille divisée par 2
  if (taille > 2) {
  branche (x + taille, y - taille, taille/2, couleur + 15) ; // x, y, taille, couleur
  branche (x - taille, y - taille, taille/2, couleur + 15) ;
  }
  
}


