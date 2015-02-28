

// DESSINER UNE FORME D'ONDE

// Import de la librairie
import ddf.minim.*;

// Déclaration d'un objet de la classe Minim
Minim son ;

// Déclaration d'un objet de la classe AudioPlayer
AudioPlayer chanson ;

void setup() {
  
  // ----- ----- -----
  // AJOUT :
  size (512,200) ; // En fonction de la mémoire tampon
  // ----- ----- -----
  
  // Constructeur
  son = new Minim(this) ;
  
  // Chargement du fichier dans l'objet AudioPlayer grâce la méthode loadFile de la classe Minim
  chanson = son.loadFile ("rythme-1.mp3",512) ;
  
  // Jouer en boucle
  chanson.loop() ;
  
}

// ----- ----- -----
// AJOUT :
void draw() {
  
background(0);
stroke(255);

// Une boucle parcourt la mémoire tampon de l'objet "chanson"
// Le dessin connecte d'une ligne chaque valeur voisine avec la suivante
// Le facteur 50 évite l'écueil de se trouver avec des valeurs normalisées (entre -1 et 1)
for(int i = 0; i < chanson.bufferSize() - 1; i++)
{
line(i, 50 + chanson.left.get(i)*50, i+1, 50 + chanson.left.get(i+1)*50); // Dessin d'une ligne pour le canal de gauche
line(i, 150 + chanson.right.get(i)*50, i+1, 150 + chanson.right.get(i+1)*50); // Dessin d'une ligne pour le canal de droite
}
  
}
// ----- ----- -----

void stop() {
  // Fermeture et nettoyage
  chanson.close() ;
  son.stop();
  super.stop() ; 
}



