

boolean abrazo=false;
int cuentasegundos=0;
PFont fuente; //tipo de fuente
int CuentaAbrazos=1; 
int Objetivo=10;
int numFrame=0;
boolean OkFrame=true;
float escalaactiva=0; 


void setup() {
  size (196, 196);
  fuente = createFont("visitor1", 12);
  textFont (fuente, 11);
  textAlign (CENTER);
  frameRate(5);
  smooth();
}

void draw() { 
  background(#000000);
  stroke(255);  
  noFill();
  if (abrazo) {
    DibujaArcoIris(escalaactiva);
    escalaactiva=escalaactiva+0.05;
  } 
  else {
    DibujaInvitacion();
    numFrame++;
    if (numFrame>20) {
      numFrame=0;
      OkFrame=!OkFrame;
    }
  }
}

void keyPressed() {
  if (key == 'a' || key == 'A') {
    abrazo=true;
  }
}


