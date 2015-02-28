
// Mapper avec des images ou de la vidéo :

// Import de la librairie vidéo de Processing :
import processing.video.*;


// On déclare une objet de capture vidéo :
Capture ma_video;

// Une variable image fixe :
PImage fixe;

// Variable de vitesse pour appliquer des rotations :
float rythme = 0.0;

void setup() {
size (800,400,P3D);
smooth();
noStroke();

// Chargement de l'image fixe :
fixe = loadImage ("spiral.jpg");
// Démarrage de la capture vidéo :
ma_video = new Capture(this, width, height, 30);
}

void draw() {
  
background(0);
  
if (ma_video.available()) {
ma_video.read(); // Lecture du contenu de la vidéo.
}

/*
// 1ère méthode, on dessine tout dans Draw, le problème va être pour faire tourner l'élément, trop de chiffres !
beginShape();
texture(fixe);
textureMode(NORMALIZED);
vertex(100, 100, 0, 0);
vertex(300, 100, 1, 0);
vertex(300, 300, 1, 1);
vertex(100, 300, 0, 1);
endShape(CLOSE);

beginShape();
texture(ma_video);
textureMode(NORMALIZED);
vertex(350, 80, 0, 0);
vertex(710, 80, 1, 0);
vertex(710, 320, 1, 1);
vertex(350, 320, 0, 1);
endShape(CLOSE);
*/


// 2nde méthode, on crée une fonction qui dessine l'objet avec des valeurs de base, et draw multiplie et transforme seulement ces valeurs pour dessiner à sa guise :
// Décomposons l'action du crayon :
pushMatrix(); // Position du crayon enregistrée
translate (width/3,height/2); // Déplacement du crayon là où on veut dessiner
rotateZ(rythme); // Rotation de la feuille de papier
scale(100); // Agrandissement des côtes de l'objet que l'on va dessiner
forme1 (); // Dessin !
popMatrix(); // Retour du crayon à sa position d'avant le dessin...

pushMatrix();
translate (((width/3)*2),height/2);
rotateY(rythme);
scale(100);
forme2 ();
popMatrix();

rythme += 0.02;

}

// Une fonction qui dessine la forme 1 et attribue une texture :
void forme1 () {
beginShape(QUADS); // POINTS, LINES, TRIANGLES...
texture(fixe);
textureMode(NORMALIZED);
vertex(-1, -1, 0, 0);
vertex(1, -1, 1, 0);
vertex(1, 1, 1, 1);
vertex(-1, 1, 0, 1);
endShape();
}

void forme2 () {
beginShape(QUADS);
texture(ma_video);
textureMode(NORMALIZED);
vertex(-1.8, -1.2, 0, 0);
vertex(1.8, -1.2, 1, 0);
vertex(1.8, 1.2, 1, 1);
vertex(-1.8, 1.2, 0, 1);
endShape();
}

