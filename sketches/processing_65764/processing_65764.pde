

// MANIPULER LE SYNTHÉTISEUR

// Import de la librairie et du package supplémentaire
import ddf.minim.*;
import ddf.minim.signals.*;

// Objet de classe
Minim son ;

// Déclaration d'une sortie Audio + des objets "Ondes"
AudioOutput sortie ;
SawWave saw ;
SineWave sine ;
SquareWave carre ;
TriangleWave tri ;

// ----- ----- ----- -----
// AJOUT
// Coordonnées X et Y de l'objet
float x = 0 ;
float y = 0 ;

// Easing : facteur qui détermine le délai avec lequel un objet se rapproche d'une destination
float easing = 0.2 ; // Puis passer à 0.05

// Facteur qui amoindrit en permanence les valeurs de vitesses calculées
float friction = 0.8 ;

// Variables qui récupèrent la distance entre le curseur et l'objet
float distx ;
float disty ;

// Vitesses X et Y de l'objet
float vx ;
float vy ;
// ----- ----- ----- -----

void setup() {
 
 size(600,600) ;
 noStroke();
 fill(255);
 smooth();
 
 // Construction des objets
 son = new Minim(this) ;
 sortie = son.getLineOut (Minim.STEREO, 512) ; // Sortie stéréo, mémoire tampon de 512
 saw = new SawWave (440, 1, 44100) ; // (Fréquence, Amplitude, Échantillonnage)
 sine = new SineWave (440, 1, 44100) ;
 carre = new SquareWave (440, 1, 44100) ;
 tri = new TriangleWave (440, 1, 44100) ;
 
 //sortie.addSignal (saw) ;
 //sortie.addSignal (sine) ;
 //sortie.addSignal (carre) ;
 sortie.addSignal (tri) ;
  
}

void draw() {
  
  background(0);
 
 // ----- ----- ----- -----
 // Distance entre le curseur et la position actuelle de l'ellipse
 distx = mouseX - x ;
 disty = mouseY - y ;
 
 // En fonction de la distance calculée, on calcule une valeur de vitesse à l'aide de l'easing
 // Ajout à la vitesse de l'objet de la nouvelle valeur de vitesse en fonction de l'éloignement curseur/objet
 vx += distx*easing ; // Plus l'objet est loin, plus il se rapprochera vite, l'easing atténue simplement proportionnellement à la distance cet effet
 vy += disty*easing ;
 
 // Facteur de friction pour réduire l'amplitude des additions de vitesse
 vx *= friction ;
 vy *= friction ;
 
 // Calcul de la nouvelle position à attribuer à l'objet
 x += vx ;
 y += vy ;
 
 // Dessin
 ellipse (x, y, 100, 100) ;
 // ----- ----- ----- -----
 
 //saw.setFreq(x) ;
 //sine.setFreq(y) ;
 //carre.setFreq(x) ;
 tri.setFreq(y) ;
  
}

void stop() {
 son.stop() ;
 super.stop() ; 
}

