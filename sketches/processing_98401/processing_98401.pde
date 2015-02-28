
//Victor Krafft Seminari 5

import ddf.minim.spi.*;
import ddf.minim.signals.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.ugens.*;
import ddf.minim.effects.*;

int numAbelles = 5;

Minim minim;//creem un objecte de so
AudioPlayer daSound;//creem un player

 
//Primer fem la matriu per a determinar la posició i la velocitat de les abelles
//amb les components X,Y de posició
float[] posX = new float[numAbelles];
 
float[] posY = new float[numAbelles];
//i les components X,Y de velocitat
float[] velX = new float[numAbelles];
 
float[] velY = new float[numAbelles];
 
/* A continuació en el setup determinem la mida de la pantalla i els valors
inicials per a posicio i velocitat en els eixos X,Y*/
void setup(){

size(500,500);
background(30,144,250);
   
  for(int i = 0; i<numAbelles; i++){
    posX[i] = width/2;
    posY[i] = height/2;
    velX[i] = random(1,10);
    velY[i] = random(1,10);
     minim = new Minim(this);//instanciem l'objecte de so
  daSound = minim.loadFile("poik.mp3");//carreguem l'mp3 ( no he pogut descarregar MP3, per que el sistema MAC no m'ho permet)
 
  }
}
 
/* En el draw iniciem amb els bucles la construcció d'un mosaic fons de
de pantalla en forma de nuvols grisos tipics de primavera*/
void draw(){
 
  for(int x=0; x<width;x+=55){
  for(int y=0; y<height;y+=55){
  fill(#B7AEAE);
 ellipse(x,y,50,25);
}
}
  
/* Tot seguit iniciem un bucle que ompli els valors de la matriu inicial
i que per tant determina la posició i velocitat de les Abelles*/
  for(int i = 0; i<numAbelles; i++){
// la posicio incrementa amb la suma de la velocitat
    posX[i] += velX[i];
    posY[i] += velY[i];
 
/* en funció de la posició a la pantalla invertim la velocitat per a efectuar
el rebot*/
    if((posX[i]<0)||(posX[i]>width)){
      velX[i] = -velX[i];
        //posem el so de rebot a zero...
    daSound.cue(0);
    //i disparem el so de rebot
    daSound.play();
    }
     
    if((posY[i]<0)||(posY[i]>height)){
      velY[i] = -velY[i];
        //posem el so de rebot a zero...
    daSound.cue(0);
    //i disparem el so de rebot
    daSound.play();
    }
   
// Finalment dibuixem l'Abella
  fill(#F5FFFA);
ellipse(posX[i],posY[i]-20,25,50);

fill(#FFD700);
ellipse(posX[i],posY[i],50,30);

fill(0);

//I utilitzem les que hem utilitzat en els anteriors exercicis que canviaven de color
 
 strokeWeight(6);
stroke(#32CD32);
line(110,375,110,500);
line(250,300,250,500);
line(380,390,380,500);

noStroke();
fill(posX[i],125,200); //els petals de les flors canviaran de color quan l'abella es mogui en l'eix de les X//

ellipse(110,320,55,120);
ellipse(165,375,120,55);
ellipse(110,425,55,120);
ellipse(55,375,120,55);

fill(posX[i],200,375);
ellipse(250,355,55,120);
ellipse(305,300,120,55);
ellipse(250,245,55,120);
ellipse(195,300,120,55);

fill(posX[i],375,480);
ellipse(380,335,55,120);
ellipse(435,390,120,55);
ellipse(380,445,55,120);
ellipse(325,390,120,55);

fill(#FFD700);
ellipse(110,375,55,55);
ellipse(250,300,55,55);
ellipse(380,390,55,55);
 }
}
//Tanquem les coses de so de java
void stop()
{
  // the AudioPlayer you got from Minim.loadFile()
  daSound.close();
  // the AudioInput you got from Minim.getLineIn()
  minim.stop();


  super.stop();
}




