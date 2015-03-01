
//by Valentin, Fanny & Emilie

//autoevaluation
// le sketch fonctionne bien ****
// copyright présent *
// le code est commenté ****
// bonne disposition et lisibilité ***
// le son produit un effet visible ****
// pas d'interactivité 
// effet graphique oui, association avec les couleurs de pixels d'une image ***

import ddf.minim.spi.*;
import ddf.minim.signals.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.ugens.*;
import ddf.minim.effects.*;

PImage craies; //variable (comme int ou float)
boolean etat=true;
Minim minim;
AudioPlayer player;
FFT fft;

void setup(){

  
  background(255);//couleur d'arriÃ¨re plan
  noStroke();//pas de contours
  craies = loadImage("craies.jpg");//intÃ©gration de l'image
  size(500,500);//taille de la fenÃªtre
  minim = new Minim(this);//On se rÃ©fÃ¨re au sketch sur lequel on est en train de travailler
  player = minim.loadFile("Caribou - Odessa.mp3");//On charge le son
  fft = new FFT(player.bufferSize(), player.sampleRate());//on analyse le son
}

void draw(){
  player.play();
  fft.forward(player.mix);//on analyse le son
  int posX, posY;
  posX=(int) random(width);
  posY=(int) random(height);
  fill(craies.get(posX,posY));//couleur en fonction de l'image d'arriÃ¨re plan
  
  
  if(frameCount>30000){
    noLoop();//quand le nombre d'ellipse atteint 30 000, la crÃ©ation d'ellipses se stoppe
  }
    for(int i = 200; i < player.left.size() -1; i++)//conditions 
  {
    ellipse(player.left.get(i)*random(width)+250,player.right.get(i)*random(width)+250,5,5);//crÃ©ation de l'ellipse
  }
 
  //Compte le nombre de fois que draw s'exÃ©cute
}

void stop() {//on demande d'arrÃªter le son
  player.close();
  minim.stop();
  super.stop();
}

void keyPressed(){//ne fonctionne pas?
  if (key == 's'){//si on presse 's's, la musique s'arrÃªte
    if(etat == false){//on inverse l'Ã©tat de la touche 's'
    player.pause();
  }else{
    player.play();
  }
}
}


