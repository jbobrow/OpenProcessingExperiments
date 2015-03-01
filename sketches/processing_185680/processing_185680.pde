

int diam = 20;
float x = 10;
float y = 10;
float x2 = random(490);
float y2 = random(390);
float velx = 5;
float vely = 5;
boolean fundo = true;
boolean corAzul = false;
PFont fonte;

void setup() {

  frameRate(24);
  size(500, 400);
  background(255);
  fonte = createFont("Arial", 100, true);
}

void draw() {
  
  if (dist(x, y, x2, y2) <= 20 ) {

    for (int i = 0; i <= 100; i = i+1) {

      background(random(255), random(255), random(255));

      textAlign(CENTER);
      textFont(fonte, 40);
      text("YOU WIN!", width/2, 150);
      textFont(fonte, 16);
      text("CONGRATULATIONS", width/2, 200);

    }
  } else {

    if (corAzul == false) {

      fill(255, 255, 50); // bola em amarelo
      stroke(255, 0, 0);
      ellipse(x, y, diam, diam);
      smooth();
      x = x + velx; // para ter a bola a mexer
      y = y + vely;
    } else {

      fill(0, 0, 255); // bola em azul
      stroke(255, 255, 0);
      ellipse(x, y, diam, diam);
      smooth();
      x = x + 1.4*velx; // para ter a bola a mexer mais rápido
      y = y + 1.4*vely;
    }

    if (x >= 490) { // velocidades e limites
      velx = -5;
    }

    if (x <= 0) {
      velx = +5;
    }

    if (y >= 390) {
      vely = -5;
    }

    if (y <= 0) {
      vely = +5;
    }

    fill(0, 255, 0);
    stroke(0, 0, 255);
    ellipse(x2, y2, diam, diam);
    smooth();
  }
}

void mousePressed() {

  if (fundo == true) {
    background(0);
    fundo = false;
    corAzul = true;
  } else {
    background(255);
    fundo = true;
    corAzul = false;
  }
}


