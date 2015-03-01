
// Dessiner des triangle
// on va utiliser la fonction triangle de processing
// pour dessiner une ellipse il faut prÃ©ciser six paramÃ¨tres :
// 1- la position dans la largeur de la fenÃªtre du premier sommet du triangle
// 2- la position dans la hauteur de la fenÃªtre du premier sommet du triangle
// 3- la position dans la largeur de la fenÃªtre du deuxiÃ¨me sommet du triangle
// 4- la position dans la hauteur de la fenÃªtre du deuxiÃ¨me sommet du triangle
// 5- la position dans la largeur de la fenÃªtre du troisiÃ¨me sommet du triangle
// 6- la position dans la hauteur de la fenÃªtre du troisiÃ¨me sommet du triangle
// 
//
// pour dessiner un triangle, je peux donc Ã©crire
// triangle(50,50,100,50,75,100);

  
void setup() {
  
size(300,300);
    
}
  
  
void draw() {
    
  // effet de transparence
  fill(180,25);
  noStroke();
  rect(0,0,width,height);
  
    
  fill(255); // les formes seront de couleur blanche
  stroke(0); // avec un contour noir
    
  triangle(50,50,100,50,75,100); // triangle pointe vers le bas en haut Ã  gauche
    
  triangle(200,100,250,100,225,50); // triangle pointe vers le haut en haut Ã  droite
    
  triangle(50,175, 100, 150, 75 ,275); // rectangle allongÃ© en bas Ã  gauche
    
    
  // cette partie est un peu plus compliquÃ©e
  // on va dessiner un triangle avec comme premier sommetla position de la souris 
  // (donnÃ©es par les mots clÃ©s "mouseX" et "mouseY")
  // (se rÃ©fÃ©rer au exemples sur les interactions avec la souris : http://www.openprocessing.org/classroom/4441)
  // ce triangle va avoir des sommets alÃ©atoires grÃ¢ce Ã  la fonction random
  // random(150,300) signifie que l'ordinateur doit choisir un nombre alÃ©atoire entre 150 et 300
  // Ã  chaque fois qu'il exÃ©cute cette instruction.
  // mais on dessinera si et seulement si notre souris est placÃ©e dans le dernier cadran ;
  // c'est Ã  dire si la valeur de mouseX est supÃ©rieure Ã  150 ET si la valeur de mouseY est supÃ©rieure Ã  150 aussi.
    
  if(mouseX>150 && mouseY>150){  
  fill(255);
  stroke(0);
  triangle(mouseX,mouseY, random(150,300), random(150,300),random(150,300), random(150,300));
  }
    
       
}
