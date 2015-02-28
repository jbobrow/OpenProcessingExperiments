
/*
DESSIN
*/


void setup() {
  size(500,500);
}

void draw() {
  background(255);
  fill(1);

  
  //PISTIL
  ellipse(250, 250, 105, 105);
  arc(280, 280, 50, 50, 0, HALF_PI); /*en bas à droite*/
  arc(292, 250, 50, 50, -QUARTER_PI, QUARTER_PI); /*à droite*/
  arc(280, 220, 50, 50, -HALF_PI, 0 ); /*en haut à droite*/
  arc(220, 280, 50, 50, HALF_PI, PI); /*en bas à gauche*/
  arc(208, 250, 50, 50, PI -QUARTER_PI, PI+QUARTER_PI); /*à gauche*/
  arc(220, 220, 50, 50, PI, PI+HALF_PI ); /*en haut à gauche*/
  arc(250, 208, 50, 50, PI+QUARTER_PI, PI+QUARTER_PI+HALF_PI ); /*en haut*/
  arc(250, 292, 50, 50, QUARTER_PI, PI-QUARTER_PI ); /*en bas*/
  
  //PETALE
  line(100, 120, 130, 145); 
  line(110, 60, 140, 100); 
  line(210, 210, 180, 180);/*en haut à gauche*/
  line(250, 250, 320, 180);/*en haut à droite*/
  line(250, 250, 250, 158);/*en haut*/
  line(250, 250, 250, 344);/*en bas*/
  line(250, 250, 180, 320);/*en bas à gauche*/
  line(250, 250, 315, 315);/*en bas à droite*/
  line(250, 250, 345, 250);/*à droite*/
  line(250, 250, 155, 250);/*à gauche*/
  
  //ENVELOPPE
  noFill();
  arc(380, 350, 310, 350, PI -QUARTER_PI, PI+QUARTER_PI); /*en bas*/

  // ellipse(250, 360, 35, 120);
  //ellipse(280, 280, 35, 120);

  
  arc(280, 280, 150, 150, 0, HALF_PI); /*en bas à droite*/
  arc(292, 250, 150, 150, -QUARTER_PI, QUARTER_PI); /*à droite*/
  arc(280, 220, 150, 150, -HALF_PI, 0 ); /*en haut à droite*/
  arc(220, 280, 150, 150, HALF_PI, PI); /*en bas à gauche*/
  arc(208, 250, 150, 150, PI -QUARTER_PI, PI+QUARTER_PI); /*à gauche*/
  arc(220, 220, 150, 150, PI, PI+HALF_PI ); /*en haut à gauche*/
  arc(250, 208, 150, 150, PI+QUARTER_PI, PI+QUARTER_PI+HALF_PI ); /*en haut*/
  arc(250, 292, 150, 150, QUARTER_PI, PI-QUARTER_PI ); /*en bas*/
  
  arc(280, 280, 180, 180, 0, HALF_PI); /*en bas à droite*/
  arc(292, 250, 180, 180, -QUARTER_PI, QUARTER_PI); /*à droite*/
  arc(280, 220, 180, 180, -HALF_PI, 0 ); /*en haut à droite*/
  arc(220, 280, 180, 180, HALF_PI, PI); /*en bas à gauche*/
  arc(208, 250, 180, 180, PI -QUARTER_PI, PI+QUARTER_PI); /*à gauche*/
  //arc(220, 220, 180, 180, PI, PI+HALF_PI ); /*en haut à gauche*/
  arc(250, 208, 180, 180, PI+QUARTER_PI, PI+QUARTER_PI+HALF_PI ); /*en haut*/
  arc(250, 292, 180, 180, QUARTER_PI, PI-QUARTER_PI ); /*en bas*/
  
  
  //PETALE
  arc(118, 137, 50, 50, PI, PI+HALF_PI ); /*en haut à gauche*/
  arc(128, 77, 50, 50, PI, PI+HALF_PI ); /*en haut à gauche*/
  
  smooth();
}
