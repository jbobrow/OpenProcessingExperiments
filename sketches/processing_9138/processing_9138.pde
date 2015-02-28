
//import processing.pdf.*;

//document en mode continu
// premier bloc de code : 1 fois
// initialisation du programme
// déclarer des fonctions

void setup()
{
  size(800,800);
  frameRate(20);
  smooth();
 // beginRecord(PDF,"test.pdf");
  background(#222222);
}


// dessin qui s'exécute selon le framerate

void draw()
{
  
  float epaisseur= random(50);
  float rayon= random(100);
  float rouge= random(250);
  float vert= random(250);
  float bleu= random(250);
  float opacit= random(250);
  float x= random(800);
  float y= random(800);
  stroke(255-rouge, 255-vert,255-bleu, opacit);
  strokeWeight(epaisseur);
  
  fill(0,vert,0,opacit);
  
  
  ellipse(mouseX,mouseY, rayon, rayon);
  //ellipse(x,y, rayon, rayon);
  ellipse(mouseX+random(50),mouseY+random(50), rayon, rayon);
  ellipse(mouseX+random(50),mouseY-random(50), rayon, rayon);
  ellipse(mouseX-random(50),mouseY-random(50), rayon, rayon);
  ellipse(mouseX-random(50),mouseY+random(50), rayon, rayon);
  
}

// fonction
/*
void mousePressed()
{
   saveFrame();
}


// enregistre un pdf et ferme

void exit() {

  endRecord();
  super.exit();
  
}
*/

