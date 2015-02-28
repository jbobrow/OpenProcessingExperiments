
/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/54126*@* */
/* !do not delete the line above, required for linking your tweak if you upload again */
/**
 Frosty, the Snowman
 */


void setup() {

  size(300, 300);
  smooth();
}


void draw() {

  //Hintergrund:
  background(255);

  frosty((int)(sin(frameCount*0.05)*50), 0, 30);
  frosty(200, 0, 30);
}



//Methode: Frosty zeichnen
void frosty(int x, int y, float winkel) {

  //Alten Zustand merken:
  pushMatrix();

  //Ursprung verschieben:
  translate(x, y);
  rotate(radians(winkel));

  fill(255);
  strokeWeight(3);
  stroke(0);

  //Körper:
  ellipse(100, 150, 50, 50);
  ellipse(100, 200, 60, 60);

  //Augen:
  strokeWeight(5);
  point(90, 140);
  point(110, 140);

  //Hut:
  strokeWeight(3);
  fill(0);
  line(60, 125, 140, 125);
  rect(75, 100, 50, 25);

  //Alten Zustand wiederherstellen:
  popMatrix();
}



