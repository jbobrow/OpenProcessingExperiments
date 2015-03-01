
/* @pjs preload="oceano.jpg"; */

//Imatge de fons
PImage fons;

//Petxines
PImage petxina;

//Declaració de variables 
float x = 0;
float y = 0;
int minutAnterior = minute();
int horaAnterior = hour(); //Evitar l'execució de l'esdeveniment de cada hora a l'executar el programa
int comptador = minutAnterior;

// Declaració de variables peixos
PImage[] imgPeixos = new PImage[60];
PImage[] imgPeixosFlip = new PImage[60];
boolean[] flipFlop = new boolean[60];
float[] posX = new float[60];
float[] posY = new float[60];
float[] velX = new float[60];
float[] velY = new float[60];
PImage[] peixos = new PImage[6];
PImage[] peixosFlip = new PImage[6];

// Delaració de variables tauró
PImage fotoTauro;
boolean horaDelTauro = false;
float tauroX;
float tauroY;
float tauroVelX;

void setup() {

  // Mida del canvas en estàtic
  size(600, 400);

  // Assignació de valors a les variablés tauró
  tauroX = width;
  tauroY = height/3;
  tauroVelX = -6;

  //Càrrega fotos peixos
  peixos[0] = loadImage("fish.png");
  peixos[1] = loadImage("fish2.png");
  peixos[2] = loadImage("fish3.png");
  peixos[3] = loadImage("fish4.png");
  peixos[4] = loadImage("fish5.png");
  peixos[5] = loadImage("fish6.png");

  peixosFlip[0] = loadImage("fishflip1.png");
  peixosFlip[1] = loadImage("fishflip2.png");
  peixosFlip[2] = loadImage("fishflip3.png");
  peixosFlip[3] = loadImage("fishflip4.png");
  peixosFlip[4] = loadImage("fishflip5.png");
  peixosFlip[5] = loadImage("fishflip6.png");

  //Càrrega fotos fons, tauró i petxina
  fons = loadImage("oceano.jpg");
  fotoTauro = loadImage("tiburon.png");
  petxina = loadImage("petxina.png");

  //Funció que determina la posició inicial, la velocitat, la imatge i la direcció inicial dels peixos
  initPeixos();
}

void draw() {

  //Fons marítim
  background(fons);

  //Determinació de variables i assignació de valors a les línies de la peixera en relació als segons 
  float llarg = map(second(), 0, 59, x, width);
  float llarg2 = map(second(), 0, 59, y, height);
  float llarg3 = map(second(), 0, 59, width, x);
  float llarg4 = map(second(), 0, 59, height, y);

  // El que s'executa cada hora: activació hora del tauró i reinici dels peixos després de desaparèixer
  if (hour() != horaAnterior) {
    horaDelTauro = true;
    comptador=0;
    horaAnterior = hour();
    initPeixos();
  }

  if (horaDelTauro == true) {
    executeHoraDelTauro();
  }
  
  // Controla quans peixos hi ha a la peixera segons el minut actual
  comptador = minute();
  
  // El que s'executa cada minut: canvi del color de les línies en escala de grisos
  if (minute()!= minutAnterior) {
    minutAnterior=minute();
    stroke(random(255));
  }

  //Funció que determina com es mouen els peixos
  movimentPeixos();
  petxines();
  //Peixera: línies que creixen cada segon, i es reinicien cada minut
  strokeWeight(4);
  line(width, height-50, llarg3, height-50);
  line(x, height-350, llarg, height-350);
  line(x+50, y, x+50, llarg2);
  line(x+550, height, x+550, llarg4);
}

////////////////////////////////////////////////////////////////////////////////FUNCIONS////////////////////////////////////////////////////////////////////////////////////////////////////

void initPeixos() {
  for (int i = 0; i < 60; i++) {
    posX[i] = 60;
    posY[i] = random(60, 300);
    velX[i] = random(1, 4);
    velY[i] = random(1, 4);
    int peixAux = int(random(0, 5));
    imgPeixos[i] = peixos[peixAux];
    imgPeixosFlip[i] = peixosFlip[peixAux];
    flipFlop[i] = true;
  }
}


void movimentPeixos() {
  for (int i = 0; i < comptador; i++) {
    // Pinta el peix amb la imatge que pertoqui segons la direcció en la que es troba
    if (flipFlop[i] == true) {
      image(imgPeixosFlip[i], posX[i], posY[i]);
    } else {
      image(imgPeixos[i], posX[i], posY[i]);
    }

    //Rebot dins la peixera i canvi de direcció
    if (posX[i] >= 480 || posX[i] <= 52) {
      velX[i] = -velX[i];
      flipFlop[i] = !flipFlop[i];
    }

    if (posY[i] >= 300||posY[i] <= 50) {
      velY[i] = -velY[i];
    }

    // Quan es manté el clic del ratolí, els peixos es mouen cap a la posició del ratolí respectant els límits de la peixera
    if (mousePressed == true) {

      float mouseXPerso;
      float mouseYPerso;

      if (mouseX <= 50) {
        mouseXPerso = 52;
      } else if (mouseX >= 480) {
        mouseXPerso = 479;
      } else {
        mouseXPerso = mouseX;
      }

      if (mouseY <= 50) {
        mouseYPerso = 51;
      } else if (mouseY >= 300) {
        mouseYPerso = 299;
      } else {
        mouseYPerso = mouseY;
      }

      float distanciaX = mouseXPerso - posX[i];
      float distanciaY = mouseYPerso - posY[i];

      posX[i] = posX[i]+distanciaX*0.05;
      posY[i] = posY[i]+distanciaY*0.05;
      velX[i] = distanciaX*0.05;
      velY[i] = distanciaY*0.05;

      //Si no s'està fent mousePressed, els peixos es mouen de manera normal
    } else {
      posX[i] += velX[i];
      posY[i] += velY[i];
    }
  }
}

//Quan es deixa de prèmer el ratolí, els peixos es dispersen anant cap a la dreta de la peixera amb una velocitat aleatòria
void mouseReleased() {  
  for (int i = 0; i < 60; i++) {
    velX[i] = random(2, 5);
    velY[i] = random(2, 5);
    flipFlop[i] = true;
  }
}

//Mostra el tauró fent que vagi de dreta a esquerra del canvas i finalitza la seva aparició
void executeHoraDelTauro() {
  image(fotoTauro, tauroX, tauroY);
  tauroX += tauroVelX;

  if (tauroX == -360) {
    horaDelTauro = false;
    tauroX = width;
  }
}

//Cada hora que ha passat es veu reflectida per una petxina a la pantalla. Pel matí s'acumulen a dalt i a partir del migdia a baix
void petxines() {
  int auxiliar = 0; //Valor per a que les petxines es dibuixin a baix a partir del migdia
  for (int i = 0; i < horaAnterior; i++) {
    if (i < 12) {
      image(petxina, 55+42*i, 15);
    } else {
      image(petxina, 517-42*auxiliar, 355);
      auxiliar++;
    }
  }
}




