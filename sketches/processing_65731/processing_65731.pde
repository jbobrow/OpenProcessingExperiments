

// 4 images à charger, donc 4 objets PImage :
PImage HautGauche ;
PImage HautDroit ;
PImage BasGauche ;
PImage BasDroit ;

void setup() {
size(240,200);
noCursor();
// Chargement des 4 fichiers jpeg à l'intérieur des objets image :
HautGauche = loadImage("Spears-1.jpg");
HautDroit = loadImage("Spears-2.jpg");
BasGauche = loadImage("Spears-3.jpg");
BasDroit = loadImage("Spears-4.jpg");
}

void draw() {
background(0);
// Afficher les 4 images :
image (HautGauche, 0, 0, mouseX, mouseY) ;
image (HautDroit, mouseX, 0, width - mouseX, mouseY) ;
image (BasGauche, 0, mouseY, mouseX, height - mouseY) ;
image (BasDroit, mouseX, mouseY, width - mouseX, height - mouseY) ;
}

