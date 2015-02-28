


//es.surveymonkey.com/s/WP8J8RJ
//objetivo
//crear un juego con processing
//1.-El escenatio
//1.1.-El arma
//1.2.-Invasores
//
//
//

void setup() {
  size(600, 600);
  foto=loadImage("bat.jpg");
  fot=loadImage("m.JPG");
}

PImage foto;
PImage fot;
int[] coordenasXinvasor= {
  int(random(600)), int(random(600)), int(random(600)), int(random(600)), int(random(600))
};
int[] coordenasYinvasor= {
  0, 0, 0, 0, 0
};

int diametroInvasor=10;



void draw() {
  background(0);
  image(foto,0,0);
  arma();
  invasores();
}

void arma() {
  fill(0, 255, 0);
  stroke(color(0, 255, 0));
  //image(fot,mouseX,300,mouseX,350);
  triangle(mouseX-8, 580, mouseX, 565, mouseX+8, 580);
}

void invasores() {
  stroke(255);
  fill(255);
  for ( int i=0; i<5 ; i++) {
    ellipse(coordenasXinvasor[i], coordenasYinvasor[i]++, diametroInvasor, diametroInvasor);
  }
}

//El disparo (clic ene el mouse)
void mousePressed() {
  proyectil(mouseX);//tomamos la posicion X del disparo (de mouse)
}

//Rl proyectil
void proyectil(int disparoX) {
  boolean acertar = false;
  for (int i=0; i<5; i++) {
    if ((disparoX >= (coordenasXinvasor[i]-diametroInvasor/2) && (disparoX <=(coordenasXinvasor[i]+diametroInvasor/2)))) {
      acertar=true;
      line(mouseX, 565, mouseX, coordenasYinvasor[i]);
      ellipse(coordenasXinvasor[i], coordenasYinvasor[i], diametroInvasor+25, diametroInvasor+25);//explota

      coordenasXinvasor[i]=int(random(600));
      coordenasYinvasor[i]=0;
    }
  }

  if (acertar==false) {
    line(mouseX, 565, mouseX, 0);//Fallo el proyectil se va hasta arriba
  }
}

void finJuego() {
  for (int i=0; i<5; i++) {
    if (coordenasYinvasor[i]==600) {
      noLoop();
    }
  }
}


