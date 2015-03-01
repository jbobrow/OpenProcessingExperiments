


//VARIABLES GENERALS
int puntX, puntY; //variables que definiran el puntX, puntY on es situa el centre del polígon
int r = 150; //variable que defineix el radi dels poligons
int rEsfera = 15; //variable que defineix el radi de l'esfera quan el rellotge marca la 1 o bé les 13:00
int nCostats = 0; //variable que defineix número de costats
color cFons = color(162, 208, 175);

//VARIABLES IMATGES
PImage dia, nit;

///////////////////////////////////////////////////////////////////////////////////////
void setup() {
  size(1024, 576);
  puntX = width/2;
  puntY = height/2;
  dia = loadImage("dia.png");
  nit = loadImage("nit.png");
}

//////////////////////////////////////////////////////////////////////////////////////

void draw() {
  background(cFons);
  //VARIABLES NECESSARIES PER IMPLEMENTAR EL RELLOTGE
  int sec = second();
  int min = minute();
  int hora = hour();

  //DEFINIM LES IMATGES SEGONS L'HORA
  if (hora > 7 && hora < 19) {
    image(dia, 0, 0);
  } else {
    image(nit, 0, 0);
  }

  //FUNCIÓ QUE MOSTRA ELS SEGONS
  esferaGradient(5*width/6, height/2);

  //FUNCIÓ QUE MOSTRA ELS MINUTS
  // barraMinuts(width/6-25, height/2 - 200);
  barraMinuts(width/6, height/2);

  //DEFINIM POLIGON O PUNT SEGONS L'HORA
  poligonOpunt();
}

////////////////////////////////////////////////////////////////////////////////////////


//AQUESTA FUNCIÓ SERÀ L'ENCARREGADA DE DIBUIXAR L'OBJECTE QUE DETERMINA ELS SEGONS
void esferaGradient(float x, float y) {
  int sec = second();
  //  if (sec < 60) {
  color cGradient = color (253, 236, 90);
  float diamGrad = 1;
  for (int i = 0; i<=sec; i++) {
    noStroke();
    fill (cGradient, 100-i);
    ellipse(x, y, diamGrad*sec, diamGrad*sec);
    fill (cGradient, 5);
    ellipse(x, y, 2*diamGrad*sec, 2*diamGrad*sec);
  }
  //} else
  //sec = 0;
}

//AQUESTA FUNCIÓ SERÀ L'ENCARREGADA DE DIBUIXAR L'OBJECTE QUE DETERMINARÀ ELS MINUTS
void barraMinuts(float posX, float posY) {
  int min = minute();
  color cBarra = color(253, 236, 90);
  color cMarcador = color(52, 52, 52);
  color cMarcador2 = cMarcador;
  int cantos = 5;
  int amplada = 5;
  int fCompt = 5*min;
  //float recorregutMin = map(minute(), 0, 59, height/6, 5*height/6);
  fill(cBarra);
  rectMode(CENTER);
  rect(posX, posY, amplada, fCompt, cantos);
  //for (int k=0; k<59; k=k+10){}
  //strokeWeight(0.8);
 // stroke(cMarcador);
  int x1 = (width/6) + 5;
  int x2 = x1 + 5;
  int y = height/2;
  float distMax = 185; //Aquest número surt de múltiplicar els minuts màxim
  //amb el factorComptador i dividir-ho entre 2 (pq la línea augmenta des del centre)
  for ( float k=0; k<distMax; k=k+37.5) {
    if (k ==0) {
      noStroke();
      fill(cMarcador2);
      ellipse (x1+2.5, y+k, 5, 5);
    } else if (k<= distMax-37.5) {
      strokeWeight(0.8);
      stroke(cMarcador);
      line(x1, y+k, x2, y+k);
      line(x1, y-k, x2, y-k);
    } else if (k >distMax-37.5) {
      noStroke();
      fill(cMarcador2);
      ellipse(x1+2.5, y+k, 5, 5);
      ellipse(x1+2.5, y-k, 5, 5);
    }
  }
}


//AQUESTA FUNCIÓ SERÀ L'ENCARREGADA DE DIBUIXAR POLÍGONS
void dibuixaPoligon(float x, float y, int nCostats, int r) {
  float factorSumatori = 360/nCostats;
  float angle = 0;
  float xpos = 0;
  float ypos = 0;
  color cPoligons = color(253, 236, 90);

  noFill();
  stroke(cPoligons);
  strokeWeight(5);

  translate(x, y);
  beginShape();
  for (int i = 0; i < nCostats; i++) {
    xpos = r*cos(radians(angle));
    ypos = r*sin(radians(angle));
    angle = angle + factorSumatori;
    vertex(xpos, ypos);
  }
  endShape(CLOSE);
}

//DEFINIM POLIGON O PUNT SEGONS L'HORA
void poligonOpunt() {
  int hora = hour();
  if (hora == 0) {
    nCostats = 12;
  } else if (hora <=12) {
    nCostats = hora;
  } else {
    nCostats = hora - 12;
  }
  if (nCostats == 1) {
    noStroke();
    fill(253, 236, 90);
    ellipse(puntX, puntY, rEsfera, rEsfera);
  } else {
    dibuixaPoligon(puntX, puntY, nCostats, r);
  }
}



