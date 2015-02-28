
void setup() {
  size(500, 700);
  smooth();
  background(color(#7D8AF7));
  beginShape();
  fill (#36C422);noStroke();
  vertex(0, 424);

  vertex(85, 511);

  vertex(164, 485);

  vertex(230, 408);

  vertex(300, 433);

  vertex(357, 450);

  vertex(431, 483);

  vertex(487, 446);

  vertex(499, 446);

  vertex(499, 697);

  vertex(2, 697);


  endShape();

stroke(#937128);strokeWeight (2);}

void drawTree(float x, float y, float big, int levels) {
  pushMatrix();
  {
    translate(x, y);

    
    line(0, 0, 0, -big);   // tronco
    strokeWeight (random(1,1.5));
    line(0, -big/2, -big/2, -big); // brazo izquierdo
    line(0, -big/2, 0, -big);         // brazo central
    line(0, -big/1.6, big/2, -big);  // brazo derecho


    // recursividad
    if (levels > 0) {
      stroke(0, random(100, 250), 0);
      drawTree(0, -big, big*(random(.5, 1)), levels - 1 );     // rama central
      drawTree(-big/2, -big, big*(random(.5, 1)), levels - 1); // Y izquierda
    
      drawTree(big/2, -big, big*(random(.5, 1)), levels - 1);  // Y derecha
    }
  }
  popMatrix();
}

void draw() {
}

void mouseReleased() {
  drawTree(mouseX, mouseY, 100, round(9));
saveFrame("DavidGarcía_arabolrecursividad.png");}

