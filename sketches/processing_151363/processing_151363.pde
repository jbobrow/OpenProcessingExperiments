
color marrom = color(129, 50, 10, 204);
color vermelho = color(201, 29, 10, 204);
float whichColor, offsetX, offsetY;
float rectSize = 112.00;

void setup() {
  size(600, 600);
  rectMode(CORNER);
  noStroke();
  //randomSeed(4); //número fixo pro random ser sempre o mesmo
  frameRate(1); // redesenha 1 vez por segundo
}

void draw() {

  background(#E3E3E3); // cobre o que tinha desenhado antes

  for (int i = 0; i<5; i++) {//linha
    for (int j = 0; j<5; j++) {//coluna

      whichColor =  random(6);
      if (whichColor < 5)
        fill(marrom);
      else
        fill(vermelho);

      offsetX = random(-3, 3);
      offsetY = random(-3, 3);

      rect(20+rectSize*j+offsetX, 20+rectSize*i+offsetY, rectSize, rectSize);
    }
  }
}



