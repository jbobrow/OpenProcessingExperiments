
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
    
    Introducing Plus+ Membership!
Enjoy the next level for your sketches
while supporting OpenProcessing
Bigger uploads, no ads,
custom license & private sketches
OpenProcessing 
dashboard
my portfoliolog out
browse classrooms collectionsbooksgo plus+jobs     trait vivant  drawing tools  monts  relief  perspective
fullscreen
relief.pde
void setup() {
  size(1000, 500);
  background(#FFFFFF);
 }
  
 void draw() {
  if (keyPressed == true) {
  
  background(#FFFFFF);
   
};
  smooth();
  if (mousePressed == true) {
  //relief
line(mouseX-200/5-mouseX/1.9, mouseY+300/3-mouseY/2,mouseX-200/5-mouseX/2, mouseY+300/3-mouseY/2);
line(mouseX-200/5-mouseX/2, mouseY+300/3-mouseY/2,mouseX+400/7-mouseX/1.8, mouseY+150/3-mouseY/2);
line(mouseX+600/7-mouseX/1.8, mouseY+150/3-mouseY/2,mouseX+500/7-mouseX/2,mouseY+150/3-mouseY/2);
line(mouseX+400/7-mouseX/1.8, mouseY+150/3-mouseY/2,mouseX+500/7-mouseX/2,mouseY+150/3-mouseY/2);
line(mouseX+500/7-mouseX/2,mouseY+150/3-mouseY/2,mouseX+500/7-mouseX/2, mouseY+200/3-mouseY/2);
line(mouseX+500/7-mouseX/2, mouseY+200/3-mouseY/2,mouseX+200/3-mouseX/4, mouseY+200/5-mouseY/4);
line(mouseX+200/3-mouseX/4, mouseY+200/5-mouseY/4,mouseX+200/3-mouseX/4, mouseY+500/5-mouseY/4);
line(mouseX+200/3-mouseX/4, mouseY+500/5-mouseY/4,mouseX+200/5-mouseX/6, mouseY+500/5-mouseY/6);
line(mouseX+200/5-mouseX/6, mouseY+500/5-mouseY/6, mouseX+mouseX/3,mouseY+mouseY/3);
line(mouseX+mouseX/3,mouseY+mouseY/3, mouseX+mouseX*5,mouseY+mouseY*5);
//point
line(mouseX+400/7-mouseX/1.8, mouseY+100/3-mouseY/2,mouseX+400/7-mouseX/1.8, mouseY+100/3-mouseY/2);
line(mouseX+100/9-mouseX/10, mouseY+500/9-mouseY/10,mouseX+100/9-mouseX/10, mouseY+500/9-mouseY/10);
 
  };
   
  }

*/

