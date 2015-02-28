
// Clarissa Maier - Computação 1

void setup() {
  size(800, 600); // tamanho da tela
}

void draw() {
  background(89, 127, 237); // cor do fundo
  strokeWeight(2); // espessura do contorno

  fill (240, 217, 10); // sol
  ellipse (mouseX, 75, 85, 85); 
  line (490, 343, 630, 343);
  fill (44, 155, 30); // grama
  rect (0, 600, 1800, 300);

  fill (200); // semi esfera 1
  arc (560, 345, 140, 90, 0, PI);
  ellipse (250, 400, 140, 90);
  rectMode (CENTER); // base do prédio
  rect (width/2, 420, 550, 60);

  for (int a=0; a<11; a++) { 
    rect (150+a*50, 420, 50, 50);
  }
  //  rectMode (CENTER); // pilar central
  rect (width/2, height/2, 70, 181);
  fill (234, 242, 7);
  fill (89, 127, 237);
  rect (width/2, height/2, 10, 181);

  if (mousePressed) { // mudança da grama com clic  
    fill(#4AD620);
    rect (0, 600, 1800, 300);
    // mudança das nuvens com clic
    fill(#1875B9);
    ellipse (270, 90, 170, 70);
    ellipse (380, 70, 220, 80);
    ellipse (550, 120, 300, 100);
  }
  fill (#F7F7F5, 100); // nuvens
  ellipse (270, 90, 170, 70);
  ellipse (380, 70, 220, 80);
  ellipse (550, 120, 300, 100);
}
