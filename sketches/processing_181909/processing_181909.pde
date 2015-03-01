
int alpha = 75;
int llarg = 66 ;
int ample = 60;
int eixQuadrat = 25;
int vertexCorba = 45;
int puntMigCorva = 0;
int eixTriangles = 65;
int cantos = 30 ;
float escalar;
color cFantasma = color(245, 228, 74);

void dibuixaFantasma() {

  //COS FANTASMA
  noStroke();
  fill(cFantasma);
    if (mousePressed) {
    cFantasma = color(random(255), random(255), random(255));
  }
  rect (0, 0, ample, llarg, cantos, cantos, 0, 0);
  triangle(0, eixTriangles, 0, eixTriangles+20, 20, eixTriangles);
  triangle(ample, eixTriangles, ample, eixTriangles+20, 2*ample/3, eixTriangles);
  triangle(ample/3, eixTriangles, ample/2, eixTriangles+20, 2*ample/3, eixTriangles);

  //ULL FANTASMA
  fill(255);
  ellipse(ample/4, 30, 15, 20);
  ellipse(3*ample/4, 30, 15, 20);

  //PUPILA FANTASMA
  fill(random(255), random(255), random(255));
  ellipse(ample/4, 30, 7, 10);
  ellipse(3*ample/4, 30, 7, 10);
  //BRILLO ULL FANTASMA
  fill(255);
  ellipse(ample/4, 27, 3, 3);
  ellipse(3*ample/4, 27, 3, 3);
}

void setup() {
  size (255, 255);
  noCursor();
}
void draw() {
  background(mouseX, 154, mouseY/2, alpha);

  
  if (mousePressed) {
    pushMatrix();
    translate(mouseX+random(-100, 100), mouseY+random(-100, 100));
    dibuixaFantasma();
    popMatrix();
    pushMatrix();
    translate(mouseX+random(-150, 150), mouseY+random(-70, 70));
    scale(mouseX/255, mouseY/255);
    dibuixaFantasma();
    popMatrix();
  }
  
  escalar = 6*mouseY/255.0;

  pushMatrix();
  translate(mouseX-40, mouseY-40);
  scale(escalar, escalar);
  dibuixaFantasma();
  popMatrix();
}
