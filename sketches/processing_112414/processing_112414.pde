
//Lucrecia Esteban

import ddf.minim.*;

AudioPlayer player;
Minim minim;
int A;
int prendidoMovimiento;
int pausarSonido;
int prendidoGris;
int px;
int py;
int x;
int y;

void setup() {

  size(600, 600);
  background(0);
  prendidoMovimiento=1;
  // Cuando esta en 1 hago pausa
  pausarSonido = 0; // ya arranca ON
  // cuando esta en 1 muestro gris
  prendidoGris = 0;
  px=0;
  py=0;

  minim = new Minim(this);
  player = minim.loadFile("respira21.mp3", 2048);
  player.loop(1);
  // volumen alto -1 a 1
  player.setGain(1);
}

void draw () {
  
  if (prendidoMovimiento==1) {


    for (int x=0; x<=600; x=x+100) {
      for (int y=0; y<=600; y=y+100) {

        pushMatrix();
        translate (px+x, py+y);
        rotate(radians(A));


        strokeWeight(random(0, 0001));
        stroke(random(230, 250), mouseX, mouseX, random(250));
        noFill();
        ellipse(30, 30, 20, 20);
        A++;

        stroke(mouseY, mouseY, 51, random(250));
        noFill();
        ellipse(25, 25, 20, 20);
        A++;

        stroke(252, mouseY, 51, random(250));
        noFill();
        rect(10, 10, 10, 10);
        A++;

        stroke(random(255), 243, mouseX, random(250));
        noFill();
        triangle(15, 15, 10, 10, 0, 0);
        A++;

        popMatrix();
      }
    }
  }

  // si esta en 1 pongo el filtro
  if (prendidoGris==1) {
    filter(GRAY);
  }

  // si esta en 1 pongo pausa
  if (pausarSonido == 1) {
    player.pause();
    // y como ya pause le pongo el codigo en 0 nuevamente
    pausarSonido = 0;
  }
}


void mousePressed() {
  
  if (prendidoMovimiento == 0) {
    prendidoMovimiento = 1;
  }
  else {
    prendidoMovimiento = 0;
  }

  if (prendidoGris == 0) {
    // Le digo que prenda gris y pauso sonido
    prendidoGris = 1;
    pausarSonido = 1;
  }
  else {
    // le digo que apague gris y prenda el sonido 
    prendidoGris = 0;
    player.loop(1);
  }
}


