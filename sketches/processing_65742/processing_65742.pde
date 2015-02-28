
// Traquer une couleur

// Import de la librairie vidéo de Processing, inclue avec le soft
import processing.video.*;

// On déclare une objet de capture :
Capture ma_video; // Capture est une classe de la librairie video

// Déclaration d'une variable de couleur que l'on va traquer :
color trackColor = color(255,0,0) ;
// Déclaration d'une variable pour le seuil de comparaison :
float seuil = 120 ;

// --- --- --- --- ---

void setup() {

size(320,240); // J'utilise un format vidéo pour ne pas déformer l'image.
smooth(); // Pour le dessin d'ellipse plus tard...
noStroke();
  
// Création de la capture. Paramètres : source, largeur, hauteur, nombre d'images par seconde capturées.
ma_video = new Capture(this, 320 , 240, 15); // Par défaut, on spécifie this comme source.

}

// --- --- --- --- ---

void draw() {
  
// Dans draw, 1ÈRE ÉTAPE :

// Comme précédemment, si une nouvelle image est prête, on la lit :
if (ma_video.available()) {
ma_video.read();
}

// Puis on l'affiche :
image(ma_video, 0, 0);

// ---

// 2ÈME ÉTAPE :

// Boucle scanner des pixels de l'image :

// Pour chaque valeur de pixel en largeur (ligne après ligne) :
for (int x = 0; x < ma_video.width; x++) {
  
// Je fouille tous les pixels dans la hauteur (j'explore la colonne) :
for (int y = 0; y < ma_video.height; y++ ) {

// Puis j'étudie la couleur locale :
color CouleurLocale = ma_video.get(x,y) ;
// Je récupère les valeurs rouge, verte, et bleue dans des variables séparées :
float r1 = red(CouleurLocale);
float v1 = green(CouleurLocale);
float b1 = blue(CouleurLocale);
// Puis je remplis des variables pour contenir les valeurs rouge, verte, et bleue que je recherche :
float r2 = red(trackColor);
float v2 = green(trackColor);
float b2 = blue(trackColor);

// Puis comparaison entre la couleur locale du pixel local et la couleur traquée :
float diffcouleur = dist(r1,v1,b1,r2,v2,b2);
// Initialement, dist() compare la distance entre 2 points dans un espace 2D ou 3D. Ici, cela permet de faire un calcul sur l'addition des 3 couches colorées.

// Si la couleur locale est sous le seuil, je dessine une ellipse sur ce point :
if (diffcouleur < seuil) {
fill(trackColor);
ellipse (x, y, 20, 20);
}
}
}
}
// FIN DE LA BOUCLE



