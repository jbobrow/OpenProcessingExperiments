
import dmxP512.*;
import processing.serial.*;
DmxP512 dmxOutput;
int universeSize=512;
int i= 255;

String DMXPRO_PORT="COM4";//case matters ! on windows port must be upper cased.
int DMXPRO_BAUDRATE=115000;

/*//////////////////
 V A R I A B L E S
 ///////////////// */
int numLED; // Define el LED seleccionado 0-3
int posLED; // Define la parte del led que está encendida 0-7
int posOldLED; // Define el led que estaba encencido 0-7
int R; // Cantidad de luz ROJA 0-255
int G; // Cantidad de luz VERDE 0-255
int B; // Cantidad de luz AZUL 0-255
int bgR; // Cantidad de luz ROJA de fondo 0-255
int bgG; // Cantidad de luz VERDE de fondo 0-255
int bgB; // Cantidad de luz AZUL de fondo 0-255

// Crea un array 2D con los canales DMX de las 4 barras LED
int[][] ledDMX = {  
  {
    3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26
  }
  , 
  {
    29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52
  }
  , 
  {
    55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78
  }
  , 
  {
    81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99, 100, 101, 102, 103, 104
  }
};

void setup () {
  size(100, 400, JAVA2D);  
  dmxOutput=new DmxP512(this, universeSize, false);
  dmxOutput.setupDmxPro(DMXPRO_PORT, DMXPRO_BAUDRATE);
// Reseteo inicial de los LEDs (pasamos por 1 por algún problena extraño que no se traga el 0 inicial)
  bgR=1;  
  bgG=1;  
  bgB=1;
  bg();
  bgR=0;  
  bgG=0;  
  bgB=0;
  bg();
}

void draw() {
}

// BACKGROUND Función que manda BG a todos los LED
void bg () { 
  for (int a=0; a<4; a++) {
    bgLED(a);
  }
}
// RESET BG
void resetBG() {
  bgR=1;
  bgG=1;
  bgB=1;
  bg();
}

// Función que define el fondo (iluminación tenue). Le llega el número de led y los valores R G B
void bgLED (int bgNumLED) { 
  for (int n=0; n<24; n=n+3) {
    dmxOutput.set((ledDMX[bgNumLED][n]), bgR);
    dmxOutput.set((ledDMX[bgNumLED][n+1]), bgG);
    dmxOutput.set((ledDMX[bgNumLED][n+2]), bgB);
  }
  return;
}



// TECLAS
void keyReleased () {
  if (key=='q') {
    resetBG();
  }
  if (key=='r') {
    bgR= bgR +5;
    if (bgR>255) {
      bgR=0;
    }
    println(bgR);
    bg();
  }
  if (key=='f') {
    bgR= bgR -5;
    if (bgR<0) {
      bgR=255;
    }
    println(bgR);
    bg();
  }
  if (key=='v') {
    bgR=0;
    println(bgR);
    bg();
  }
  if (key=='t') {
    bgG= bgG +5;
    if (bgG>255) {
      bgG=0;
    }
    println(bgG);
    bg();
  }
  if (key=='g') {
    bgG= bgG -5;
    if (bgG<0) {
      bgG=255;
    }
    println(bgG);
    bg();
  }
  if (key=='b') {
    bgG=0;
    println(bgG);
    bg();
  }
  if (key=='y') {
    bgB= bgB +5;
    if (bgB>255) {
      bgB=0;
    }
    println(bgB);
    bg();
  }
  if (key=='h') {
    bgB= bgB -5;
    if (bgB<0) {
      bgB=255;
    }
    println(bgB);
    bg();
  }
  if (key=='n') {
    bgB=0;
    println(bgB);
    bg();
  }

  //if (key=='2') {
  //  // for (int cdmx = 4; cdmx < 27; cdmx = cdmx+3) {
  //  dmxOutput.set(4, 55);
  //  //      dmxOutput.set(7, 50);
  //  //}
  //}
  //if (key=='3') {
  //  //  for (int cdmx = 5; cdmx < 27; cdmx = cdmx+3) {
  //  dmxOutput.set(5, 55);
  //  //      dmxOutput.set(8, 50);
  //  //}
  //}
  //if (key=='a') {
  //  for (int cdmx = 0; cdmx <27; cdmx = cdmx+1) {
  //    dmxOutput.set(cdmx, 0);
  //  }
  //}
  //if (key=='w') {
  //  dmxOutput.set(1, 15);
  //}
  //if (key=='e') {
  //  dmxOutput.set(1, 1);
  //}
}



