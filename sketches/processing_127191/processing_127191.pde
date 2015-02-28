
  PImage img;
boolean doIt;

 void setup () {

  size (450,450);
  smooth ();

  img = loadImage("co.png");

stroke(0);
} 
void draw() {
 


 
  if (doIt) {
    endShape ();
    for (int a=1; a<60; a += 3) {
      for (int b=1; b<50; b += 3) {
        stroke (0);
        strokeWeight (1);
        fill (random (0, 70), random (0, 25), random (200, 55), random (155));
        ellipse (random (a*10), random (b*10), 32, 32);
      }
    }   
    }
tint(0,0,0);
  image(img,90,70);

    doIt = false;
  }


void mousePressed () {
  doIt = true;
}

   




