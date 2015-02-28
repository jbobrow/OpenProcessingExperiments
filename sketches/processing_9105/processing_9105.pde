
/*import processing.video.*;
import processing.pdf.*;
MovieMaker mm;
*/
// Initialisation du programme
void setup()
{

  //PFont typo;
  size(400,400);
  smooth();
  frameRate(60);
  background(random(255),random(255),random(255),random(255));
/*typo = loadFont("HelveticaNeue-48.vlw");
  textFont(typo, 16);
    beginRecord(PDF, "motif.pdf");
  mm = new MovieMaker(this, width, height, "movie.mov");*/
}


// Dessin
void draw()
{
   //text("test",mouseX,mouseY);
  noStroke();
  //stroke(255,255,255,155);
  //float c = random(255);
  float rayon = random(50);
   
  fill(random(255),random(255),random(255),random(255));
  rect(mouseX,mouseY,20,50);
  ellipse(mouseX,mouseY,rayon,rayon);
  ellipse(400-mouseX,mouseY,rayon,rayon);
  ellipse(400-mouseX,400-mouseY,rayon,rayon);
  ellipse(mouseX,400-mouseY,rayon,rayon);
  //mm.addFrame();
}

void mousePressed()
{
  //println("Souris !");
  rect(random(300),random(300),100,100);
  //saveFrame("img-####");
}

/*void exit()
{
  endRecord();
  mm.finish();
  super.exit(); // Termine le processus
}*/

