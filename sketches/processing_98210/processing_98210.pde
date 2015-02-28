
// Giovana Isabela Spanhol

void setup () {
  size(200, 200, P3D); 
  background(0);

  fill(255);
}


void draw() {
  background(255);
  specular(255, 0, 0);
  ambientLight(255,255,255);
  fill(157,213,242);
  rect (0, 0, 200, 200);
  fill(216, 208, 208);
  stroke(0);
  lights();



  pushMatrix();
  float dirY = (100 / float(height)) * 20;
  float dirX = (260/ float(width) ) * 20;
  directionalLight(204, 204, 204, -dirX, -dirY, -1); 
  
  // estrutura da casa
  fill(232,209,77);
  translate(70, 100, 10);
  rotateY(mouseY/150);


  //rotateZ(mouseX/150);
  box(60);
  fill(232,209,77);
  translate(40, 10, 5); 
  box(90);
  fill(255);
  translate (-60, -22, 10);
  box(22);
  fill(240, 234, 121);

  noStroke();
  fill(54, 41, 4);
  translate (20, 55, 15);
  box (10);
  translate (-0, 5, 0);
  box (10);
  stroke (0);
  fill(255);
  // janelas da lateral
  translate (20, -20, 15);
  box (15);
  translate (0, -30, 0);
  box (15);
  translate (15, 0, 0);
  box (15);
  translate (15, 0, 0);
  box (15);
  translate (0, 30, 0);
  box (15);
  translate (-15, 0, 0);
  box (15);

  // janela frente
  translate (-55, -18, -60);
  box (22);

  fill(185, 52, 57);
  translate (15, 0, 60);
  box (5);
  translate (0, 10, 0);
  box (5);
  translate (0, 10, 0);
  box (5);
  fill(28, 118, 64);
  translate (10, 120, -20);
  box (200);

  // arvore
  fill(100, 76, 23);
  translate (20, -100, 60);
  box(5);
  translate (0, -5, 0);
  box(5);
  translate (0, -5, 0);
  box(5);
  translate (0, -5, 0);
  box(5);
  translate (0, -5, 0);
  box(5);
  translate (0, -5, 0);
  box(5);
  translate (0, -5, 0);
  box(5);
  fill (86, 224, 77);
  translate (0, -5, 0);
  sphere (20);

  // sol

  fill(252, 197, 84);
  stroke(252, 243, 48);
  translate (20, -80, 10);
  sphere (10);

  popMatrix();
}



