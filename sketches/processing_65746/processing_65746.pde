
// Démarrer dans l'espace de dessin 3d

// Voici une variable de vitesse pour appliquer des rotations dans un second temps :
// float rythme = 0.0;

void setup() {
// C'est dans size() que l'on gagne une dimension supplémentaire :
size (800,400,P3D);
smooth();
noStroke();
rectMode(CENTER);
ellipseMode(CENTER);

}

void draw() {

background(255);

// Dessin de 3 formes avec des formules quasi identiques mais en déplaçant le crayon à l'aide de la méthode translate :

translate(200,200);
// pushMatrix(); // On enregistre la position du crayon.
fill(255,0,0,90);
// rotateX(rythme);
rect(0,0,150,150);
// popMatrix(); // Retour à la position précédente et enregistrée du crayon.

translate(200,0);
// pushMatrix();
fill(0,255,0,90);
// rotateY(rythme);
ellipse(0,0,150,150);
// popMatrix();

translate(200,0);
// pushMatrix();
fill(0,0,255,90);
// rotateZ(rythme);
rect(0,0,150,150);
// popMatrix();

// Additions sur la valeur de rotation :
// rythme += 0.02;

// A cet instant-là, il y a un bug : les rotations s'accumulent sur la deuxième (x + y) et la troisième forme (x + y + z).
// C'est parce que les ordres de rotation ne sont PAS appliqués aux formes, mais au Sketch tout entier, c'est la scène qui tourne.
// DONC, une forme dessinée après plusieurs ordres de rotation sera dessinée selon l'orientation actuelle du Sketch à ce moment précis.

// Les transformations sont ré-initialisées à l'appel de Draw. Pour les cumuler dans le temps, on utilise donc une variable (pour l'angle par exemple)
// qui s'incrémente et applique une transformation toujours plus grande, appel après appel de Draw.

}

