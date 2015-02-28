
float x = 200;
float y = 200;
float largeur = 100;
float hauteur = 50;
float radians = 1.3;

// Fonction qui n'est appelee qu'au demarrage.
void setup() {
        size(400,400); // La taille de la fenetre.
        frameRate(30); // Le nombre d'images par seconde.
        smooth(); // Lisser les formes dessinees.
}


// Fonction qui est appelee a chaque nouvelle image.
void draw() {
        background(127); // Remplir l'arriere-plan d'une teinte de gris.


  // Carré bleu
fill(0,0,255);
pushMatrix(); // sauvegarder la matrice de transformation
translate(x,y); // deplacer la forme a dessiner
rotate(radians); // effectuer la rotation
translate(largeur/2,0); // deplacer l'axe de rotation
rectMode(CENTER);
rect(0,0,largeur,hauteur); // dessiner la forme
popMatrix(); // restaurer la matrice de transformation

radians = radians + 0.3;

}
