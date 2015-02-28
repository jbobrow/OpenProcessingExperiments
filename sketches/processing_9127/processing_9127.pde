
// outil de dessin
// travail avec les variables

// pdf avec timestamp si clic

//import processing.pdf.*;

int compteur = 0; // types de variables boolean byte char color double float int long


void setup()
{
  smooth();
  size(600,600);
  
 
  background(255,255,255);
}

void draw()
{
 //background(255,255,255); /* pour voir la trace de la souris ou dessiner */
   
  float vitesseSouris= dist(mouseX, mouseY, pmouseX, pmouseY)/50;
  float rando1 = random(10);
  float rando2 = random(10);
  strokeWeight(1/vitesseSouris);
  stroke(0,0,0);
  line(pmouseX, pmouseY,mouseX, mouseY);
  noStroke();
  ellipse (mouseX+rando1, mouseY+rando2, (vitesseSouris), (vitesseSouris) );
  ellipse (mouseX-rando1, mouseY-rando2, (vitesseSouris), (vitesseSouris) );
    
}
/*
void mousePressed()
{
    background(255,255,255);
    long timestamp = (new Date()).getTime();

beginRecord(PDF,"test"+timestamp+".pdf");
}
// enregistre un pdf et ferme

void exit() {

//  endRecord();
  super.exit();
  
}
*/

