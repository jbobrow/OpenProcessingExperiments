
float i, j, l, h;

void setup() {

  size(500, 500);
  noFill();
  smooth();

  background(10, 70, 90);

  i = 50;
  j = 50;
  l = 25;
  h = 25;

  noLoop();
}

void draw() {

  stroke(255,100);
  strokeWeight(4);

  // MOTIF 1

  // Rotation
  rotate(PI/4);
  // Déplacement d'un quart de l'image
  translate(height/4,-width/2); 

  // Répétition motifs ronds
  for (int i = 0; i < height; i = i + 25) {
    for (int j = 0; j < width; j = j +25) {
      ellipse(i, j, l, h);
    }
  }

  // MOTIF 2

  // Décalage par rapport au motif 1
  translate(height/6,-width/6);

  // Répétition motifs carrés
  for (int i = 0; i < height; i = i + 25) {
    for (int j = 0; j < width; j = j +25) {
      rect(i, j, l, h);
    }
  }
}



