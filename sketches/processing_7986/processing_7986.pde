
// Jouons avec:  line(x1, y1, x2, y2); 
 
 
 
 
void setup() { 
  size(500, 500); 
  background(#FFFFFF); 
 } 
 
 
void draw() { 
   
 if (mousePressed == true) { 
  
   println("Le bouton de la souris est cliqué !!! Ahahahah");
   
  //petit test de balayage étrange
  line(0, mouseX, 250, mouseY); 
  line(250, mouseY, mouseX, 0);
  line( mouseY, 0, mouseX, 250);
  line( mouseX, 250, mouseY, 0);
  
  }; 

if (keyPressed == true) {

  //export en .tif
  saveFrame();
  
   background(#FFFFFF);
};

} 
 
 
 
 
 
 
//--------Boite à outils du cours------------// 
 
/* 
 
>>>un double slash // met une ligne en commentaire, ce texte devient gris et est ignoré 
>>>slash etoile etoile slash met plusieurs lignes en commentaires 
 
>>>taille du sketch hauteur, largeur 
 size(500, 500); 
 
>>>couleur de fond, ou effacer l'écran 
background(hex); 
background(hex, alpha); 
 
>>>et voila line() qui trace une ligne entre deux coordonnées 
line(x1, y1, x2, y2); 
 
>>>couleur et épaisseur de la ligne 
stroke() 
strokeWeight() 
 
>>>coordonnées actuelles de la souris 
mouseX, mouseX 
 
>>>coordonnées précédentes de la souris 
pmouseX, pmouseY 
 
 
>>>si (l'utilisateur presse le bouton de la souris){ fais ceci); 
 
 if (mousePressed == true) { 
   ecrire ici ce qu'il doit se passer  
  }; 
   
>>>si (l'utilisateur presse un bouton du clavier) { fais cela); 
 
  if (keyPressed == true) { 
  ecrire ici ce qu'il doit se passer  
 
  }; 
   
   
*/

