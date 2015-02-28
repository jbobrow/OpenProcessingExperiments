
////////////////////////VARIABLES///////////////////////////////

//NAVE
int Xrect = 100;
int szrect = 20;
float fuegomax = Xrect*0.4;
int fuegocrece = 10;
float fuegomin = Xrect*0.6;
float fuegoestable = Xrect*0.45;
boolean creciendo = true;
int rojo = 255;
int amarillo = 230;

//EXPLOSION
int explmax = 201;
int explbaja = 1;
int explcreciendo = 50;
boolean explcrece = true;


//OBSTACULOS
int numObst = 40;

float [] Xobst = new float[numObst];
float [] Yobst = new float[numObst];
float [] velXobst = new float[numObst];
float [] velYobst = new float[numObst];
float []szObst = new float [numObst];

//FONDO ESTRELLADO
int numstar = 300;

float [] Xstar = new float[numstar];
float [] Ystar = new float[numstar];
float [] velstar = new float[numstar];
float [] szstar = new float[numstar];


//OBJETOS ESPECIALES

//Power
int numpower = 1;

int [] Xpower = new int[numpower];
float [] Ypower = new float[numpower];
int [] velpower = new int[numpower];
float [] velYpower = new float[numpower];

int szpower = 20;

//MENSAJES

mensajes msg = new mensajes(millis());


/////////////////////////////////////////////////
void setup() {
  size(800, 600);
  for (int i = 0; i<numObst;i++) {
    Xobst[i] = width;
    Yobst[i] = int(random(height));
    velXobst[i] = random(1, 3);
    velYobst[i] = random(-1, 1);
    szObst[i] = random(10, 80);
  }

  for (int i = 0; i<numstar;i++) {
    Xstar[i] = int(random(width));
    Ystar[i] = int(random(height));
    velstar[i] = random(1, 10);
    szstar[i] = random(1, 3);
  }

  for (int i = 0; i<numpower;i++) {
    Xpower[i] = width;
    Ypower[i] = int(random(height));
    velpower[i] = int(random(5, 10));
    velYpower[i] = random(-5, 5);
  }
  //noSmooth();
}

void draw() {
  background(0);
  fondo();
  obstaculos();
  nave();
  Power();
  msg.men();

  gameOver();

  println(frameRate);
}


///////////////////////////////FUNCIONES////////////////////////////

void fondo() {
  //Fondo estrellado
  for (int i=0; i<numstar; i++) {
    Xstar[i] = Xstar[i]-velstar[i];
  }

  for (int i=0; i<numstar; i++) {
    noStroke();
    fill(255);
    ellipse(Xstar[i], Ystar[i], szstar[i], szstar[i]);
    if (Xstar[i] <= 0) {
      Xstar[i] = width;
    }
  }
}

/////////////////////////////////////
void obstaculos() {
  //Obstaculos
  for (int i=0; i<numObst; i++) {
    Xobst[i] = Xobst[i]-velXobst[i];
    Yobst[i] = Yobst[i]+velYobst[i];

    if ((Yobst[i]<0)||(Yobst[i]>height)) {
      velYobst[i] = -velYobst[i];
    }
  }

  for (int i=0; i<numObst; i++) {
    colorMode(HSB, numObst);
    fill(i, i, i);
    stroke(54, 0, 99);
    ellipse(Xobst[i], Yobst[i], szObst[i], szObst[i]);
    if (Xobst[i] <= 0) {
      Xobst[i] = width;
    }
    //RESET
    if (keyPressed) {
      if (key == 'r' || key == 'R') {
        Xobst[i] = width;
      }
    }
  }
}

/////////////////////////////////////
void nave() {
  //Dibujo Nave
  noStroke();
  colorMode(RGB, 255);
  rectMode(CENTER);
  fill(156);

  //cuerpo
  ellipse(Xrect, mouseY, szrect, szrect);
  fill(0, 0, 255);
  ellipse(Xrect, mouseY, szrect*0.3, szrect*0.3);

  //propulsor
  rect(Xrect*0.9, mouseY, szrect*0.5, szrect*0.5);

  //fuego
  if (creciendo == true) {
    fuegoestable = fuegoestable-fuegocrece;
    fill (rojo, amarillo, 0);
  }
  else {
    fuegoestable = fuegoestable+fuegocrece;
    fill (rojo, 0, 0);
  }
  //////MOVIMIENTO FUEGO
  if (fuegoestable > fuegomin) {
    creciendo = true;
  }

  if (fuegoestable < fuegomax) {
    creciendo = false;
  }
  /////
  triangle(Xrect*0.8, mouseY+(szrect/2)/2.5, Xrect*0.8, mouseY-(szrect/2)/2.5, fuegoestable, mouseY);
}

void balas() {
}

///////////////////////////////////////////
void gameOver() {
  //GAME OVER

  for (int i=0; i<numObst; i++) {
    if (dist(Xrect, mouseY, Xobst[i], Yobst[i]) < (szrect/2)+(szObst[i]/2)) {

      if (explbaja < explmax) {
        explbaja += explcreciendo;
      }
      fill(255, 130, 0);
      ellipse (Xrect, mouseY, explbaja, explbaja);
    }
  }

  if (explbaja == explmax) {
    rectMode(CORNER);
    noStroke();
    fill(255, 0, 0);
    rect(0, 0, width, height);
    PFont letra;
    stroke(156);
    fill(255);
    letra = loadFont("ArialMT-24.vlw");
    textFont(letra, 25); 
    text ("Pulsa R para Reset", width*0.38, height*0.5);
    if (keyPressed) {
      if (key == 'r' || key == 'R') {
        explbaja = 1;
      }
    }
  }
}

//////////////////////////////////////////////


void Power() {

  //OBJETO ESPECIAL
  if (msg.men() > 1000) { //aparece a los X segundos

    for (int i=0; i<numpower; i++) {
      Xpower[i] = Xpower[i]-velpower[i];
      Ypower[i] = Ypower[i]+velYpower[i];

      if ((Ypower[i]<0)||(Ypower[i]>height)) {
        velYpower[i] = -velYpower[i];
      }
    }

    for (int i=0; i<numpower; i++) {
      noStroke();
      fill(255, 255, 0);
      ellipse(Xpower[i], Ypower[i], szpower, szpower);
      PFont letra;
      stroke(156);
      fill(255, 0, 0);
      letra = loadFont("ArialMT-24.vlw");
      textFont(letra, 10); 
      text ("P", Xpower[i], Ypower[i]);
      if (keyPressed) {
        if (key == 'r' || key == 'R') {
          Xpower[i]=width;
          Ypower[i]=int(random(height));
        }
      }

      if (dist(Xrect, mouseY, Xpower[i], Ypower[i]) < (szrect/2)+(szpower/2)) {
        for (int j=0; j<numObst; j++) {
          velXobst[j] = random(0.1, 1);
          velYobst[j] = random(-0.1, 0.1);
        }
        for (int k = 0; k<numstar; k++) {
          velstar[k] = random(4, 40);
        }
      }
    }
  } 

  if (msg.men() >= 10000) { //a los x segundos la velocidad vuelve a ser normal
    for (int j=0; j<numObst; j++) {
      velXobst[j] = random(1, 3);
      velYobst[j] = random(-1, 1);
    }
    for (int k = 0; k<numstar; k++) {
      velstar[k] = random(1, 10);
    }
  }


  if (keyPressed) {//al pulsar R la velocidad vuelve a ser normal
    if (key == 'r' || key == 'R') {
      for (int j=0; j<numObst; j++) {
        velXobst[j] = random(1, 3);
        velYobst[j] = random(-1, 1);
      }

      for (int k = 0; k<numstar; k++) {
        velstar[k] = random(1, 10);
      }
    }
  }
}





class mensajes {

  int savedTime;

  mensajes (int _savedTime) {
    savedTime = _savedTime;
  }

  int men() {

    // Calculate how much time has passed

    int Score = millis() - savedTime;



    PFont letra;
    stroke(156);
    fill(255);
    letra = loadFont("ArialMT-24.vlw");
    textFont(letra, 18); 
    text ("Evita los obstaculos", width*0.7, height*0.1);
    text ("Score:  "+Score, width*0.7, height*0.15);
    noCursor();


    if (keyPressed) {
      if (key == 'r' || key == 'R') {
        savedTime= millis();
      }
    }
    return abs(Score);
  }
}

