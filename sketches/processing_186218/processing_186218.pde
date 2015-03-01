
//variables Sol
float solX, solY, velX, velY;
int szSol;

//variables nieve
int totalNieve = 250;
float [] nieveX = new float[totalNieve];
float [] nieveY = new float[totalNieve];
float [] velNieve = new float[totalNieve];

int szNieve;

//fotos
PImage fuji;
PImage rama;
PImage flor;
PImage pagoda;


void setup() {
  size(600, 600);

  //posicion inicial Sol
  solX = -100;
  solY = height/2;
  szSol = 200;
  velY = 0.5;


  //posicion inicial nieve
  for (int i=0; i<totalNieve; i++) {
    nieveX[i] = random(0, width);
    nieveY[i] = random(-600, -10);
    velNieve[i] = random(1, 2);
  }

  szNieve = 5;

  //precarga imagenes
  fuji = loadImage("fuji.png");
  rama = loadImage("ramaVacia.png");
  flor = loadImage("flor.png");
  pagoda = loadImage("pagodaAntena.png");
}


void draw() {

  dibujaFondo();

  dibujaSol();
  movimientoSol();
  reiniciaSol();

  dibujaElementos();

  nieveAcumulada();

  dibujaPagoda();

  dibujaNieve();

  dibujaFlores();

  dibujaMarco();
}


////////////////////////////////////////////////FUNCIONES///////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////

void dibujaFondo() {
  if (hour()>1 && hour()<12) {
    background(33, 187, 255);
    } else {
  for (int i=0; i<600; i++) {
    strokeWeight(3);
    stroke(i, 160, 220);
    line(0, i, width, i);
  }
}
}



void dibujaSol() {
  noStroke();
  fill(255, 231, 152);
  ellipse(solX, solY, szSol, szSol);
}

void movimientoSol() {

  float recorridoSolX = map(second(), 0, 59, -75, width+75);
  float recorridoSolY = map(second(), 0, 59, height/2, 0);
  solX = recorridoSolX;
  solY = recorridoSolY;

  //para que se ponga el Sol
  if (solX >= width/2) {
    float puestaSolY = map(second(), 0, 59, 0, height/2);
    solY = puestaSolY;
  }
}

void reiniciaSol() {
  //para que el Sol aparezca otra vez por la izquierda
  if (solX > width+szSol/2) {
    solX = -100;
  }
}

void dibujaElementos() {

  //montaña
  image(fuji, 0, 0);

  //rayas tela
  for (int i=0; i<600; i = i+3) {
    //stroke(223, 220, 212);
    stroke(203, 195, 175);
    strokeWeight(1);
    line(0, i, width, i);
  }
}

void dibujaFlores() {

  //rama cerezo
  image(rama, 0, 0);

  //dibujar flores segun la hora
  if (((hour()>=1) && (hour()<13)) || ((hour()>=13) && (hour()<24))) {
    image(flor, width/2+50, height/4-25);
  }

  if (((hour()>=2) && (hour()<13)) || ((hour()>=14) && (hour()<24))) {
    image(flor, width/2+7, height/4-15, 40, 40);
  }

  if (((hour()>=3) && (hour()<13)) || ((hour()>=15) && (hour()<24))) {
    image(flor, width/2-25, height/4);
  }

  if (((hour()>=4) && (hour()<13)) || ((hour()>=16) && (hour()<24))) {
    image(flor, width/2-70, height/2-80, 40, 40);
  }

  if (((hour()>=5) && (hour()<13)) || ((hour()>=17) && (hour()<24))) {
    image(flor, width/2-50, height/2-55);
  }

  if (((hour()>=6) && (hour()<13)) || ((hour()>=18) && (hour()<24))) {
    image(flor, width/2-10, height/2-50, 40, 40);
  }

  if (((hour()>=7) && (hour()<13)) || ((hour()>=19) && (hour()<24))) {
    image(flor, width/2+40, height/2+20);
  }

  if (((hour()>=8) && (hour()<13)) || ((hour()>=20) && (hour()<24))) {
    image(flor, width/2+70, height/2+50, 40, 40);
  }

  if (((hour()>=9) && (hour()<13)) || ((hour()>=21) && (hour()<24))) {
    image(flor, width/2+width/4-3, height/2-20);
  }

  if (((hour()>=10) && (hour()<13)) || ((hour()>=22) && (hour()<24))) {
    image(flor, width/2+width/4+20, height/2+20, 40, 40);
  }

  if (((hour()>=11) && (hour()<13)) || ((hour()>=23) && (hour()<24))) {
    image(flor, width/2+width/4+45, height/2+50);
  }

  if (((hour()>=12) && (hour()<13)) || ((hour()>=24) && (hour()<1))) {
    image(flor, width/2+70, height-height/3);
  }
}

void dibujaNieve() {
  for (int i=0; i<totalNieve; i++) {
    noStroke();
    fill(255);
    ellipse(nieveX[i], nieveY[i], szNieve, szNieve);

    //movimiento nieve
    nieveY[i] = nieveY[i] + velNieve[i];

    //reinicio nieve
    if (nieveY[i]>width) {
      nieveY[i] = -10;
    }
  }
}


void dibujaPagoda() {
  image(pagoda, 0, 0);
}


void nieveAcumulada() {
  float minutera = map(minute(), 0, 59, 0, 250);

  noStroke();
  fill(255);
  arc(67, 439, 30, minutera, PI, 2*PI);
}




void dibujaMarco() {

  noFill();
  stroke(4, 5, 5);
  strokeWeight(25);
  rect(0, 0, width, height);
}



