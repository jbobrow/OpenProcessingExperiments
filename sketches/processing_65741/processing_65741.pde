
// Activer l'entrée vidéo de l'ordinateur

// Import de la librairie vidéo de Processing, inclue avec le soft
import processing.video.*;

// On déclare une objet de capture :
Capture ma_video; // Capture est une classe de la librairie video

void setup() {

size(320,240); // J'utilise un format vidéo pour ne pas déformer l'image.
  
// Création de la capture. Paramètres : source, largeur, hauteur, nombre d'images par seconde capturées.
ma_video = new Capture(this, 320 , 240, 15); // Par défaut, on spécifie this comme source.

// On peut afficher la liste des sources vidéos connectées à l'ordinateur, afin d'en choisir une ensuite :
// println(Capture.list());
// Et ensuite on placera le nom choisi, trouvé dans la liste, comme paramètre de la création de capture :
// ma_video = new Capture(this, width, height, "Camera Name", 30);

}

void draw() {
  
// Si une nouvelle image vidéo est prête à être affichée, alors on la lit :
if (ma_video.available()) {
ma_video.read();
}

// 1er exemple de manipulation, modifier la teinte des images capturées en temps réel :
tint (mouseX, mouseY, 255); // Rouge, vert, bleu

// On affiche l'image en question :
image (ma_video, 0, 0); // x, y, comme coordonnées.

// POINT ESSENTIEL : Processing traîte les images une par une à l'affichage.
// Cela signifie que tout ce que l'on a apprit sur le traitement des images fixes et la manipulation des pixels
// peut s'appliquer à la capture vidéo, image après image.

}

