
/*
 Practica 5: Nil Pastor Miralles
 */

import ddf.minim.spi.*;
import ddf.minim.signals.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.ugens.*;
import ddf.minim.effects.*;

float posX, posY, velX, velY;
int color1, color2, color3;
int mx=0;
/* Creem un objecte de so i tres players*/
Minim minim;
AudioPlayer daSound;
AudioPlayer daBackgroundSound;
AudioPlayer daMouseSound;

void setup() {
  size(500,450);
  posX = width/2;
  posY = height/2;
  velX = 2;
  velY = 2;
/*instanciem l'objecte de so i carreguem els mp3, i finalment el reproduim*/  
  minim = new Minim(this);
  daSound = minim.loadFile("lazer.mp3");
  daBackgroundSound = minim.loadFile("Silius.mp3");
  daMouseSound = minim.loadFile("laser2.mp3");
  daBackgroundSound.cue(1200);
  daBackgroundSound.play();
}

void draw() {
  background(0);

  /*El primer punt a l'hora de definir la cara es la seva posició i amb aquesta
funció fem que aquesta canvi a mida que es va repetint*/
  posX = posX+velX;
  posY = posY+velY;
  fill(3,97,255);
  stroke(3,97,255);
  ellipse(width/2,height/2,mx,mx);
  fill(color1,color2,color3);
  stroke(255,255,255);
  strokeWeight(3);
  ellipse(posX,posY,100,100);
  fill(0);
  ellipse(posX-20,posY-20,20,20);
  ellipse(posX+20,posY-20,20,20);
  fill(0);
  stroke(0);
  ellipse(posX,posY+10,40,40);
  fill(color1,color2,color3);
  stroke(color1,color2,color3);
  rect(posX-25,posY-12,50,20);
  color1 = 233;
  color2 = 255;
  color3 = 0;

/*actualitzem la posició i la relcionem amb els sons de rebot*/
  if((posX<50)||(posX>width-50)){
    velX = -velX;
    
    daSound.cue(0);
   
    daSound.play();
  } 
  
  if((posY<50)||(posY>height-50)){
    velY = -velY;
    
    daSound.cue(0);
   
    daSound.play();
  }
}


/*Tanquem el so*/
void stop()
{
 
  daSound.close();
 
  minim.stop();

 
  super.stop();
}
/*Finalment afegim l'opcio per que al premer el mouse ...*/
void mousePressed() {
 

// es modifiqui la posició
  posX = mouseX;
  posY = mouseY;
// la velocitat
  velX = random(-15, 15);
  velY = random(-15, 15);
// Y es reprodueixi un nou so
  daMouseSound.cue(0);
  daMouseSound.play();


}



