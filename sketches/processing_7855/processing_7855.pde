
// Jouons avec:  line(x1, y1, x2, y2);




void setup() {
  size(500, 500);
  background(#FFFFFF);
 }


void draw() {
  
if (mousePressed == true) {
line(250, 0, mouseX, 50);
line(mouseX, 50, 250, 100);

line(250, 100, mouseX, 150);
line(mouseX, 150, 250, 200);

line(250, 200, mouseX, 250);
line(mouseX, 250, 250, 300);

line(250, 300, mouseX, 350);
line(mouseX, 350, 250, 400);

line(250, 500, mouseX, 450);
line(mouseX, 450, 250, 400);


line(0, 50, mouseX-250, 100);
line(mouseX-250, 100, 0, 150);

line(0, 150, mouseX-250, 200);
line(mouseX-250, 200, 0, 250);

line(0, 250, mouseX-250, 300);
line(mouseX-250, 300, 0, 350); 

line(0, 350, mouseX-250, 400);
line(mouseX-250, 400, 0, 450); 

line(0, 450, mouseX-250, 500);
line(mouseX-250, 0, 0, 50);


line(500, 50, mouseX+250, 100);
line(mouseX+250, 100, 500, 150);

line(500, 150, mouseX+250, 200);
line(mouseX+250, 200, 500, 250);

line(500, 250, mouseX+250, 300);
line(mouseX+250, 300, 500, 350);

line(500, 350, mouseX+250, 400);
line(mouseX+250, 400, 500, 450);

line(500, 450, mouseX+250, 500);
line(mouseX+250, 0, 500, 50);
 };
  
 if (keyPressed == true) {
   saveFrame();
   background(#FFFFFF);
   };

}






//--------Boite Ã  outils du cours------------//

/*

>>>un double slash // met une ligne en commentaire, ce texte devient gris et est ignorÃ©
>>>slash etoile etoile slash met plusieurs lignes en commentaires

>>>taille du sketch hauteur, largeur
 size(500, 500);

>>>couleur de fond, ou effacer l'Ã©cran
background(hex);
background(hex, alpha);

>>>et voila line() qui trace une ligne entre deux coordonnÃ©es
line(x1, y1, x2, y2);

>>>couleur et Ã©paisseur de la ligne
stroke()
strokeWeight()

>>>coordonnÃ©es actuelles de la souris
mouseX, mouseX

>>>coordonnÃ©es prÃ©cÃ©dentes de la souris
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



