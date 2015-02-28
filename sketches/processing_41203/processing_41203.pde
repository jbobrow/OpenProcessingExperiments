
///http://www.openprocessing.org/visuals/?visualID=15700
///http://photos1.fotosearch.com/bthumb/CSP/CSP645/k6452030.jpg

PImage img;

int nbcouleurs = 0;
int lignes;
 
 
void setup() {
  size(400,400);
  img = loadImage ("birds.gif");
  background(#ffffff);
  lignes = 0;
}
 
void draw() {
  noStroke();
  ellipse(105,128,50,50);
  ellipse(145,118,70,70);
  ellipse(295,128,50,50);
  ellipse(255,118,70,70);
  ellipse(200,108,90,90);
   
   
  lignes = 35;          //différentes lignes qui créent la pluie.
  while(lignes<100) {
  fill(random(255),255,255,100);
  rect(lignes*3,140,1,352);
  lignes++;
  image (img, 116, 250);
  }
}


