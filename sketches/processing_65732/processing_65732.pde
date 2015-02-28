

PImage Warhol ;

void setup() {
  
  size(600,600);
  Warhol = loadImage ("Warhol.jpg") ;
  image (Warhol, 0, 0) ;
  
  // Plusieurs types de filtres :
  // filter (THRESHOLD) ; // Seuil
  // filter (GRAY) ; // Niveaux de gris
  // filter (INVERT) ; // Inversion
  filter (BLUR, 5) ; // Flou, niveau de flou
  
  // On dessine un rectangle qui nous aide à voir où on pioche :
  stroke (255) ;
  noFill() ;
  rect (400,200,30,30) ; // (x,y,largeur,hauteur)
  // Puis on copie la zone :
  copy (400,200,30,30,0,0,300,300) ;
  // copy (x source, y source, largeur source, hauteur source,
  // x destination, y destination, largeur dest, hauteur dest)
}



