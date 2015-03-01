
void setup () {
  size(600, 200);
  smooth();
  noLoop();
}

void draw () {
  background (#57385c);
  fill (#ffedbc);
  stroke (#A75265);
  strokeWeight (3);

  int anzahlDerElementeX = (int) random(2, 50);
  int anzahlDerElementeY = (int) random(2, 50);
  int gesamtBreite = width;
  int gesamtHoehe = height;

  float rBreite = (float) gesamtBreite / anzahlDerElementeX;
  float rHoehe = (float) gesamtHoehe / anzahlDerElementeY;
  // println(rBreite);

  int j = 0;
  while (j < anzahlDerElementeY) {
    float y = j * rHoehe;
    
    // REIHE Anfang --------------------
    int i = 0;
    while (i < anzahlDerElementeX) {
      float x = i * rBreite;
     
      pushMatrix();
      translate(x+rBreite/2, y+rHoehe/2);
      rotate(random (0, TWO_PI) );
      rect(-rBreite/2, -rHoehe/2, rBreite, rHoehe, rBreite/4);
      popMatrix();
     
      i = i + 1;
    }
    // REIHE Ende --------------------
    
    j = j + 1;
  }
}


void mousePressed () {
  redraw();
}

