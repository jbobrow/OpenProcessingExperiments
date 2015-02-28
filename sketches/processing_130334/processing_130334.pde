
//Tomas de Camino Beck
//arreglo de nBolas x 2 (con 2 coordenadas 0 es x y 1 es y)
int nBolas = 40;
float[][] bolas = new float[nBolas][2];

void setup() {
  size(600, 600);
  smooth();
  noCursor();
  //inicializa bolas al centro
  for (int i = 0; i<nBolas;i++) {
    bolas[i][0]=width/2;
    bolas[i][1]=height/2;
  }
  ellipseMode(CENTER);
}

void draw() {
  background(255);
  //dibuja el mouse
  fill(139);
  noStroke();
  ellipse(mouseX, mouseY, 50, 50);
  stroke(205, 200, 255, 119);
  noFill();
  //dibuja todas las bolas
  for (int i = 0; i<nBolas;i++) {
    ellipse(bolas[i][0], bolas[i][1], 100, 100);
    bolas[i][0]+=(mouseX-bolas[i][0])/(20+i*i);
    bolas[i][1]+=(mouseY-bolas[i][1])/(20+i*i);
  }
}

