
// pdf avec timestamp

//import processing.pdf.*;

//document en mode continu
// premier bloc de code : 1 fois
// initialisation du programme
// déclarer des fonctions

void setup()
{
  size(800,800);
  frameRate(50);
  smooth();
  long timestamp = (new Date()).getTime();
  //beginRecord(PDF,"test"+timestamp+".pdf");
  background(#222222);
}


// dessin qui s'exécute selon le framerate

void draw()
{
  
  float epaisseur= random(1);
  float rayon= random(100);
  float rouge= random(250);
  float vert= random(250);
  float bleu= random(250);
  float opacit= random(250);
  float x= random(800);
  float y= random(800);
  stroke(0, 0,bleu, opacit);
  strokeWeight(epaisseur);
  
  fill(0,vert,0,opacit);
  
  
  line(400,400, mouseX,mouseY);

}

/*
void mousePressed()
{
   saveFrame("monImage-#####.tif");
}

// enregistre un pdf et ferme

void exit() {

  endRecord();
  super.exit();
  
}
*/

