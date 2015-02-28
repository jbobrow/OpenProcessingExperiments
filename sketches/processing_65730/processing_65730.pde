

// Création d'un objet image (PImage), nommé MonImage :
PImage MonImage ;

void setup() {
  size(400,300);
  
  String fichier = selectInput ("Veuillez choisir un fichier");
  MonImage = loadImage(fichier);
}

void draw() {
  // Affichage de l'objet PImage :
  image (MonImage, 0, 0, width, height); // image(Nom de l'objet PImage, x, y,largeur,hauteur) ;
  // On applique une teinte :
  tint (mouseX,mouseY,mouseY-mouseX,255) ; // tint (R,V,B,Alpha) ;
}

