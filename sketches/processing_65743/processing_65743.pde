
// Détection du mouvement

// Import de la librairie vidéo de Processing, inclue avec le soft
import processing.video.*;

// On déclare une objet de capture :
Capture ma_video; // Capture est une classe de la librairie video

// On crée une variable Image qui nous servira à enregistrer les "images précédentes"
PImage prevFrame;

// On crée une variable pour le seuil que nous accepterons comme déterminant un changement d'état de pixel :
float seuil = 100;

void setup() {
size(320,240);
ma_video = new Capture(this, width, height, 30);

// On crée une image vide dans laquelle on enregistrera chaque image au fur et à mesure afin de permettre la comparaison avec les suivantes :
prevFrame = createImage(ma_video.width,ma_video.height,RGB); // 3 paramètres obligatoires : largeur, hauteur, format couleur.
}

void draw() {
  
// La capture vidéo :
if (ma_video.available()) {
// Avant chaque lecture de nouvelle image vidéo, on enregistre l'image précédente :
prevFrame.copy(ma_video, 0, 0, ma_video.width, ma_video.height, 0, 0, ma_video.width, ma_video.height); // Source, x, y, largeur, hauteur, copie_x, copie_y, copie_largeur, copie_hauteur)
prevFrame.updatePixels(); // Mise à jour de la totalité de l'image. On vient de sauver l'image précédente dans la variable prevFrame.
ma_video.read(); // Lecture du contenu de la vidéo.
}

// Chargement des pixels du sketch, de la variable ma_video, et de la variable prevFrame.
loadPixels();
ma_video.loadPixels();
prevFrame.loadPixels();
  
// Scanner des pixels de la source vidéo :
for (int x = 0; x < ma_video.width; x++ ) {
for (int y = 0; y < ma_video.height; y++ ) {

// 1 variable pour localiser le pixel en question :
int localpixel = x + y*ma_video.width;

// On se sert de la localisation du pixel pour dénicher sa couleur actuelle (ma_video) et précédente (prevFrame) :
color coul_actuelle = ma_video.pixels[localpixel];
color coul_precedente = prevFrame.pixels[localpixel];
      
// A l'aide de variables, on récupère les valeurs de rouge, de vert et de bleu du pixel actuel et du pixel dans sa version précédente :
float r1 = red(coul_actuelle); float v1 = green(coul_actuelle); float b1 = blue(coul_actuelle);
float r2 = red(coul_precedente); float v2 = green(coul_precedente); float b2 = blue(coul_precedente);
float difference_couleur = dist(r1, v1, b1, r2, v2, b2);

// Si la couleur d'un pixel a changé au-delà du seuil prévu, cela signifie qu'il y a eu un mouvement sur ce pixel :
if (difference_couleur > seuil) { 
// Si mouvement, on colorie en bleu le pixel
pixels[localpixel] = color(0,0,255);
} else {
// Sinon, on colorie le pixel en blanc
pixels[localpixel] = color(255);
}
}
}

// Au terme de la boucle, mise à jour des pixels du sketch :
updatePixels();

}

