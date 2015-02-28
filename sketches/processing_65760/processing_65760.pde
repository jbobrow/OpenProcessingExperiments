

// CHARGER UN FICHIER AUDIO

// Import de la librairie
import ddf.minim.*;

// Déclaration d'un objet de la classe Minim
Minim son ;

// Déclaration d'un objet de la classe AudioPlayer
AudioPlayer chanson ;

void setup() {
  
  // Constructeur
  son = new Minim(this) ;
  
  // Chargement du fichier dans l'objet AudioPlayer grâce la méthode loadFile de la classe Minim
  chanson = son.loadFile ("rythme-1.mp3",512) ;
  
  // Jouer en boucle
  chanson.loop() ; // play() ; pause() ; stop() ;
  
}

void stop() {
  // Fermeture et nettoyage
  chanson.close() ;
  son.stop();
  super.stop() ; 
}



