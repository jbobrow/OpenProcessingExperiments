
 
   
void setup() {
   
size(300,300);
     
}
   
   
void draw() {
     
  // effet de transparence
  fill(180,25);
  noStroke();
  rect(0,0,width,height);
   
     
  fill(255,0,0); // la premiÃ¨re forme sera rouge
  stroke(0); // avec un contour noir
  triangle(50,50,100,50,75,100); // triangle pointe vers le bas en haut Ã  gauche
  
  fill(0,255,0); // la premiÃ¨re forme sera verte
  stroke(0,0,255); // avec un contour bleu
  ellipse(225,75,75,75); // triangle pointe vers le haut en haut Ã  droite
     
 fill(0); // la premiÃ¨re forme sera noire
  stroke(255,180,180); // avec un contour bleu
  rect(50,175,75,75); // triangle pointe vers le haut en haut Ã  droite
     
     
  // cette partie est un peu plus compliquÃ©e
  // on va dessiner un triangle avec comme premier sommetla position de la souris
  // (donnÃ©es par les mots clÃ©s "mouseX" et "mouseY")
  // (se rÃ©fÃ©rer au exemples sur les interactions avec la souris : http://www.openprocessing.org/classroom/4441)
  // mais on dessinera si et seulement si notre souris est placÃ©e dans le dernier cadran ;
  // c'est Ã  dire si la valeur de mouseX est supÃ©rieure Ã  150 ET si la valeur de mouseY est supÃ©rieure Ã  150 aussi.
     
  if(mouseX>150 && mouseY>150){ 
  fill(random(255),random(255),random(255),150);
  noStroke();  
  triangle(mouseX,mouseY, random(150,300), random(150,300),random(150,300), random(150,300));

  }
     
        
}
