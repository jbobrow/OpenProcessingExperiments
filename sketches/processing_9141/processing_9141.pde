

//document en mode continu
// premier bloc de code : 1 fois
// initialisation du programme
// déclarer des fonctions

void setup()
{
  size(800,800);
  frameRate(20);
  smooth();
  background(#9A7B9B);
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
  ellipse(800-mouseX,800-mouseY, rayon, rayon);
  ellipse(mouseX,800-mouseY, rayon, rayon);
  ellipse(800-mouseX,mouseY, rayon, rayon);
  

}
/*
void mousePressed()
{
   saveFrame("monImage-#####.tif");
}

*/


