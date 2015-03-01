
// Dessiner des rectangles
// on va utiliser la fonction rect de processing
// pour dessiner une ellipse il faut préciser quatres paramètres :
// 1- la position dans la largeur de la fenêtre du coin en haut à gauche du rectangle
// 2- la position dans la hauteur de la fenêtre du coin en haut à gauche du rectangle
// 3- la largeur 
// 4- et la hauteur
//
// pour dessiner un rectangle, je peux donc écrire
// rect(50,50,25,25);
// cela va donc dessiner un carré de 25 pixels de côté, à 50 pixels du bord gauche de la fenêtre,
// et à 50 pixels du bord haut de la fenêtre.
 
void setup() {
 
size(300,300);
   
}
 
 
void draw() { 
   
  // effet de transparence
  fill(180,5);
  noStroke();
  rect(0,0,width,height);
 
   
  fill(255); // les formes seront de couleur blanche
  stroke(0); // avec un contour noir
   
  rect(75,75,50,50); // carré en haut à gauche
   
  rect(225,75,50,25); // rectanle écrasé en haut à droite
   
  rect(75,225, 20, 50); // rectangle allongé en bas à gauche
   
   
  // cette partie est un peu plus compliquée
  // on va dessiner un rectangle à la position de la souris (données par les mots clés "mouseX" et "mouseY")
  // (se référer au exemples sur les interactions avec la souris : http://www.openprocessing.org/classroom/4441)
  // ce rectangle va avoir des rayons aléatoires grâce à la fonction random
  // random(5,25) signifie que l'ordinateur doit choisir un nombre aléatoire entre 5 et 25 à chaque fois qu'il exécute
  // cette instruction.
  // mais on dessinera si et seulement si notre souris est placée dans le dernier cadran ;
  // c'est à dire si la valeur de mouseX est supérieure à 150 ET si la valeur de mouseY est supérieure à 150 aussi.
   
  if (mouseX > 150 && mouseY > 150){
   
  rect(mouseX,mouseY, random(5,35), random(5,35));
   
  }
   
   
     
}

