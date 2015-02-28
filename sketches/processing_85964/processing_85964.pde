

float oscillationCompteur = 0;

// Fonction qui n'est appelee qu'au demarrage.
void setup() {

        size(400,400); // La taille de la fenetre.
        frameRate(30); // Le nombre d'images par seconde.
        smooth(); // Lisser les formes dessinees.
}


// Fonction qui est appelee a chaque nouvelle image.
void draw() {

    background(127); // Remplir l'arriere-plan d'une teinte de gris.
    
    noFill();
    strokeWeight(5);
    
    // Creer une oscillation:
    // cos( frameCount * speed + offset ) * radius + center

    beginShape();
    curveVertex(200 , 434.0);
    curveVertex(200 , 400.0);
    oscillationCompteur = oscillationCompteur + 0.11;
    
    float oscillationDuBas = cos( oscillationCompteur + radians(90)) * 25 + 200;
    curveVertex( oscillationDuBas , 274.0);
    
    float oscillationDuHaut = cos( oscillationCompteur ) * 30 + 200;
    curveVertex(oscillationDuHaut , 153.0);
    
    curveVertex(200 , 105.0);
    endShape();
    
}
