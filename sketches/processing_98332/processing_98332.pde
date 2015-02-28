
//Joan Recasens
//Seminari 4
//definim les variables del programa
//inicialitzo els valors que utilitzare per fer la matriu i els bucles

import ddf.minim.spi.*;
import ddf.minim.signals.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.ugens.*;
import ddf.minim.effects.*;

int sz = 45;
int numrect = 3;
 
//fem una matriu de posicions i velocitats per "numrect"
float[] posicionsX = new float[numrect];
//posicionsY
float[] posicionsY = new float[numrect];
//velocitatsX
float[] velocitatsX = new float[numrect];
//velocitatsY
float[] velocitatsY = new float[numrect];
  
  Minim minim;//creem un objecte de so
AudioPlayer daSound;//creem un player

 
void setup(){
size(500,500);
 
//inicialitzem posicions (al extrem inferior dret) i velocitats dels rectangles:
for(int i = 0; i<numrect; i++){
posicionsX[i] = width;
posicionsY[i] = height;
velocitatsX[i] = random(7,10);
velocitatsY[i] = random(7,10);
      minim = new Minim(this);//instanciem l'objecte de so
  daSound = minim.loadFile("whl.wav");
}
//amb el frameRate fem el moviment aleatori de les ellipses i dels rectangles
frameRate(30);
}
 
void draw(){

//Creamos un objeto PImage, de nombre afoto
PImage afoto; 
  //cargamos una foto en concreto en afoto
  //(que tiene que estar en el sketch folder, y moejor dentro de la carpeta data)
afoto = loadImage("nena.jpg"); 
//y dibujamos la foto
image(afoto, -250, -100); 

fill(254,17,17);
//fem el fons estàtic que es paramètric
for (int i = 15; i < width; i = i+30) {
for (int j = 15; j < height; j = j+30) {

ellipse (i,j,10, 10);
  }
}

fill(252,8,249);
//Fem les ellipses
for (int i=0; i<100; i++); {
float posX = random(width);
float posY = random(height);
float tamano = random (60);

ellipse(posX, posY, tamano, tamano);
}

fill(58,28,131);
for (int i=0; i<100; i++) {
float posX = random(width);
float posY = random(height);
float tamanot= random (25);
 

 fill(255,235,13);
rect(posX,posY,tamanot,tamanot);
}
 
 
//iniciem un bucle creei les mateixes accions a tots els valors de les matrius
for(int i = 0; i<numrect; i++){
posicionsX[i] += velocitatsX[i];
posicionsY[i] += velocitatsY[i];
 
//delimitem que els rectangles només es moguin dins del límit i ho fem de forma paramètrica
if((posicionsX[i]<0)||(posicionsX[i]>width)){
velocitatsX[i] = -velocitatsX[i];
     //posem el so de rebot a zero...
    daSound.cue(0);
    //i disparem el so de rebot
    daSound.play();
} 
if((posicionsY[i]<0)||(posicionsY[i]>height)){
velocitatsY[i] = -velocitatsY[i];
    daSound.cue(0);
    //i disparem el so de rebot
    daSound.play();
}
   
//dibuixem els rectangles
fill(58,28,131);
    rect(posicionsX[i],posicionsY[i],sz,sz);
}
   
}
//Tanquem les coses de so de java
void stop()
{
  // the AudioPlayer you got from Minim.loadFile()
  daSound.close();
  // the AudioInput you got from Minim.getLineIn()
  minim.stop();

  // this calls the stop method that
  // you are overriding by defining your own
  // it must be called so that your application
  // can do all the cleanup it would normally do
  super.stop();
}




