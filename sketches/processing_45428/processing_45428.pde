
//IMPORTAR LIBRERIAS

import supercollider.*;
import oscP5.*;

//DEFINIENDO ALGUNOS TERMINOS GLOBALES (VARIABLES QUE SE UTILIZARAN A LO LARGO)

Synth synth2;
int stepX;
int stepY;
float lineLength = 0;
float angle = 0;
float angleSpeed = 1.0;
float grosor_linea=1;

void setup() {
  // use full screen size
  size(screen.width, screen.height);
  background(255);
  smooth();
  cursor(CROSS);
  smooth();
}


void draw() {
  colorMode(HSB, width, height, 100);
stepX=mouseX+2;
stepY=mouseY+2;
color col = color(stepX, height-stepY,random(0,80),random(0,150));
//DEFINE LOS VALORES ALEATORIOS PARA FRAME RATE
float tempo = random(5,15);
  //ALEATOREIDAD EN LA PRODUCCIÓN DE LAS LINEAS Y LOS SONIDOS
  // CAMBIAR EL VALOR DE frameRate de "30" a "tempo"
  frameRate(30);  
  if (mousePressed) {
    pushMatrix();
    strokeWeight(random(grosor_linea/20)); 
    noFill();
    stroke(col);
    translate(mouseX,mouseY);
    rotate(radians(angle));
    line(0, 0, lineLength, 0);
    popMatrix();
    angle += angleSpeed;
    lineLength = random(0.001, 1000);
    grosor_linea= width-mouseX;

// DEFINIR EL SINTE
    synth2= new Synth("length_1");
    float mFX = map (mouseX, 0, width, 20, 2000);
    synth2.set("freqx", mFX);
    synth2.set("amp",lineLength*0.0001);
    float nY = map(mouseY, 0, height, 5, 2000);
    synth2.set("freqF", nY);
    float nX = map (mouseX, 0, width, -1, 1);
    synth2.set("panlength", nX);
    println (nX);
    synth2.create();
  }
}

void stop ()
{
  synth2.free();
}

//SENTIDO DE LA ROTACIÓN
void keyPressed() {
  if (keyCode == LEFT) angleSpeed -= 0.5;
  if (keyCode == RIGHT) angleSpeed += 0.5;
}












