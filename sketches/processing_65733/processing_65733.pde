

PImage Warhol ;
PImage Fleur ;

void setup() {

  size(600,600);
  Warhol = loadImage("Warhol.jpg");
  Fleur = loadImage("Fleur.jpg");
  image (Warhol, 0, 0) ;
  image (Fleur, 0, 0) ;

  // Types de mélanges :
  // blend (Image Source, x, y, width, height, dest x, dest y,
  // dest width, dest height, MODE de mélange) ;

  // blend (Warhol, 200, 200, 200, 200, 200, 200, 200, 200, ADD);
  // ADD : pixels additionnés
  // blend (Warhol, 200, 200, 200, 200, 200, 200, 200, 200, SUBTRACT);
  // Soustraction
  // blend (Warhol, 200, 200, 200, 200, 200, 200, 200, 200, DARKEST);
  // Garde le pixel le plus sombre
  // blend (Warhol, 200, 200, 200, 200, 200, 200, 200, 200, LIGHTEST);
  // Garde le pixel le plus clair
  blend (Warhol, 200, 200, 200, 200, 200, 200, 200, 200, DIFFERENCE);
  // Ecart de valeur de couleur entre les pixels superposés
}



