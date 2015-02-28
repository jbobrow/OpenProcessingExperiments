
/* @pjs preload="fons.jpg"; 
 */

PImage fons;
int anchura = 400; 
int altura = 200;
float posX = 20;
float posY = random(60, 80);
float angulo = random(25, 35);
float modulo = 2;
float futPosX = posX;
float futPosY = posY;

int lineX = 20;
int lineY = 20;

int puntuacion1 =0;
int puntuacion2 =0;
int nivel = 0;

boolean aPressed = false;
boolean zPressed = false;
boolean jPressed = false;
boolean mPressed = false;
boolean jugadores = false;
boolean ordenadores = false;

void setup() {
  size(400, 200);
    fons = loadImage("fons.jpg");
}

void draw() {
  background(120);
  if (nivel == 0) introduccio();
  else if (nivel == 1) {
    image (fons, 0, 0);
    actualitzaPos();
    ellipse(posX, posY, 10, 10);
    line(20, lineX, 20, lineX+20);
    line(anchura-20, lineY, anchura-20, lineY+20);
    if (jugadores){
      if (aPressed && lineX > 1) lineX = lineX - 2;
      if (zPressed  && lineX < altura -20) lineX = lineX + 2;
    }
    if (jPressed && lineY > 1) lineY = lineY - 2;
    if (mPressed  && lineY < altura -20) lineY = lineY + 2;
    if (angulo >90 && angulo <270 && !jugadores) {
      if (futPosY > (lineX+10) && lineX < altura -20) lineX = lineX + 2;
      if (futPosY < (lineX+10) && lineX > 1) lineX = lineX - 2;
    }
    if ((angulo <90 || angulo >270) && ordenadores) {
      if (futPosY > (lineY+10) && lineY < altura -20) lineY = lineY + 2;
      if (futPosY < (lineY+10) && lineY > 1) lineY = lineY - 2;
    }
  } 
  else if (nivel == 2) {
    mostrarFinalPartida();
  }
  else if (nivel == 3) {
    ganador();    
  }
  else if (nivel == 4) {
    //delay(3000);
    nivel = 1;
  }
}
void introduccio() {
  fill(#FFFFFF);
  rect (20, 20, 360, 150);
  fill(#000000);
  text ("PING PONG!!", 40, 50);
  text ("Presiona '1' para 1 jugador", 40, 70);
  text ("Presiona '2' para 2 jugadores", 40, 90);
  text ("Presiona '3' para solo ordenador", 40, 110);
  text ("Teclas Jugador 1: 'a' y 'z'", 40, 130);
  text ("Teclas Jugador 2: 'j' y 'm'", 40, 150);
  fill(#FFFFFF);
}

void actualitzaPos() {
  float x = modulo*cos(radians(angulo));
  float y = modulo*sin(radians(angulo));

  if (posY+y>altura-5 || posY+y <5) {
    angulo = 360-angulo;
  }
  if ((posX+x>anchura-25 && (posY>lineY && posY<lineY+20)) || (posX+x<25 && (posY>lineX && posY<lineX+20))) {
    angulo = random(180-angulo-5, 180-angulo+5);
    modulo += 0.1;
    if (angulo <0) angulo =360+angulo;
    calcularImpacto(x, y);
  } else {
    posX = posX+x;
    posY = posY+y;
  }
//  line(futPosX, 0, futPosX, altura);  
//  line(0, futPosY, anchura, futPosY);  

  if (posX>anchura-25) {
    nivel = 2;
    puntuacion1 +=1;
  }
  if (posX+x<10) {
    nivel = 2;
    puntuacion2 +=1;
  }
}

float coseno(float a, float angulo) {
  return (a/tan(radians(angulo)));
}
float adjacente(float a, float angulo) {
  return (a*tan(radians(angulo)));
}
void calcularImpacto(float x, float y) {
  if (posX+x>anchura-25 && y > 0) {
    futPosX = posX-coseno(altura-posY-5, 180-angulo);
    if (futPosX<25) {
      futPosY = posY+adjacente(posX-25, 180-angulo);
    }
    else {
      futPosY = altura-adjacente(futPosX-25, 180-angulo);
    }
    if (futPosY <5) {
      futPosX = futPosX-coseno(altura -5, 180-angulo);
      futPosY = adjacente(futPosX-25, 180-angulo);
    }
  } 
  else if (posX+x>anchura-25 && y < 0) { 
    futPosX = posX-coseno(posY-5, angulo%90);
    if (futPosX<25) {
      futPosY = posY-adjacente(posX-25, angulo%90);
    }
    else {
      futPosY = adjacente(futPosX-25, angulo%90);
    }
    if (futPosY >altura-5) {
      futPosX = futPosX-coseno(altura -5, 180-angulo);
      futPosY = altura-5 - (futPosY-altura+5);
    }
  } 
  else if (posX+x<25 && y > 0) {
    futPosX = posX+coseno(altura-posY-5, angulo%90);
    if (futPosX>anchura-25) {
      futPosY = posY+adjacente(anchura-posX-25, angulo%90);
    }
    else {
      futPosY = altura-5-adjacente(anchura-futPosX-25, angulo%90);
    }
    if (futPosY<5) {
      futPosX = futPosX+coseno(altura -10, angulo%90);
      futPosY = -futPosY+5;
    }
  } 
  else if (posX+x<25 && y < 0) {
    futPosX = posX+coseno(posY-5, 360-angulo);
    if (futPosX>anchura-25) {
      futPosY = posY-adjacente(anchura-posX-25, 360-angulo);
    }
    else {
      futPosY = adjacente(anchura-futPosX-25, 360-angulo);
    }
    if (futPosY >altura-5) {
      futPosX = futPosX+coseno(altura -10, angulo%90);
      futPosY = altura-5 - (futPosY-altura+5);
    }
  }
}

void mostrarFinalPartida() {
  rect (50, 50, 100, 100);
  fill(#000000);
  text ("Final Partido", 60, 70);
  if (jugadores)text ("Jugador 1:".concat(String.valueOf(puntuacion1)), 60, 90);
  else text ("Ordenador:".concat(String.valueOf(puntuacion1)), 60, 90);
  if (!ordenadores) text ("Jugador 2:".concat(String.valueOf(puntuacion2)), 60, 110);
  else text ("Ordenador 2:".concat(String.valueOf(puntuacion2)), 60, 110);
  reiniciar();
  //if (puntuacion1 == 10 || puntuacion2 == 10) nivel = 3;
  //else nivel = 4;
  nivel = 4;
}
void ganador() {
  rect (20, 20, 360, 150);
  fill(#000000);
  text ("Final Partido!!!", 60, 70);
  if (jugadores && puntuacion1 == 10) text ("Jugador 1 GANADOR",60, 90);
  else if (!jugadores && puntuacion1 == 10) text ("Ordenador GANADOR", 60, 90);
  else if (!ordenadores && puntuacion2 == 10) text ("Jugador 2 GANADOR", 60, 90);
  else text ("Ordenador 2 GANADOR", 60, 90);
  reiniciar();
  puntuacion1=0;
  puntuacion2=0;
  nivel = 4;
}
void reiniciar (){
  posX = 20;
  posY = random(60, 80);
  println(posY);
  angulo = random(25, 35);
  println(angulo);
  modulo = 2;
  lineX = 20;
  lineY = 20;
  float x = modulo*cos(radians(angulo));
  float y = modulo*sin(radians(angulo));
  calcularImpacto(x, y);
  
  fill(#FFFFFF);
 
}

void keyPressed() {
  if (key=='a') {
    aPressed = true;
  }
  else if (key=='z') {
    zPressed = true;
  }
  else if (key=='j') {
    jPressed = true;
  }
  else if (key=='m') {
    mPressed = true;
  }
  else if (key=='1') {
    nivel = 1;
  }
  else if (key=='2') {
    jugadores = true;
    nivel = 1;
  }  else if (key=='3') {
    ordenadores = true;
    nivel = 1;
    float x = modulo*cos(radians(angulo));
    float y = modulo*sin(radians(angulo));
    calcularImpacto(x, y);
  }


}
void keyReleased( ) {
  if (key=='a') {
    aPressed = false;
  }
  else if (key=='z') {
    zPressed = false;
  }
  else if (key=='j') {
    jPressed = false;
  }
  else if (key=='m') {
    mPressed = false;
  }
}
/*
    if (mousePressed == true && mouseButton == LEFT && lineY > 1) {
 lineY=lineY-2;
 } 
 else if (mousePressed == true && mouseButton == RIGHT && lineY < altura -20) {
 lineY=lineY+2;
 }
 
 */



