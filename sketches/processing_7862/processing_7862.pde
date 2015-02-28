
// Jouons avec:  line(x1, y1, x2, y2);




void setup() {
  size(500, 500);
  background(#FFFFFF);
 }


void draw() {
  
if (mousePressed == true) {
  background(#FFFFFF);
  



line(mouseX, mouseY-100, 300, 200);

line(300, 200, mouseX, mouseY);
line(mouseX, mouseY, 300, 300);

line(300, 300, mouseX, mouseY+100);







line(mouseX, mouseY-100, 200, 200);

line(200, 200, mouseX, mouseY);
line(mouseX, mouseY, 200, 300);

line(200, 300, mouseX, mouseY+100);











line(300, 200, mouseX+100, mouseY);
line(mouseX+100, mouseY, 300, 300);








line(200, 200, mouseX-100, mouseY);
line(mouseX-100, mouseY, 200, 300);



}
  
  
  
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



