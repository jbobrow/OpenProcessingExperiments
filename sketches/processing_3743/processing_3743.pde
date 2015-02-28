
/*
//mandalah.pde
//libreria minim, clase BeatDetect by code.compartmental.net
//@uthor Rodrigo Godo, theredcat
//Created on Aug-19-2009
*/

import ddf.minim.*;
import ddf.minim.analysis.*;

Minim minim;
AudioPlayer song;
BeatDetect beat;
BeatListener b1;

void setup(){
  size(800,600); //tamaño
  background(255); //color de back, puede ser rgb con tres argumentos
  smooth(); //suaviza el trazo
  background(0,0,0);
  stroke(0,0,0); //color de linea de borde, puede ser un solo argumento, aca es rgb
  minim = new Minim(this);
  song=minim.loadFile("insomnia.mp3"); //derechos reservados, just for learning purposes, not comercial
  song.play();
  beat= new BeatDetect(song.bufferSize(), song.sampleRate());
  beat.setSensitivity(100);
  b1=new BeatListener(beat, song);
}

void draw(){
    float centroX=width/2;
    float centroY=height/2;  
    float[] radios={550,500,480,380,320,190,150,70}; //radios concentricos
  
    if(beat.isKick()){
      int r=int(random(radios.length));
      int rojo=170;
      int verde=int(random(0,256));
      int azul=74;
      fill(rojo, verde, azul, 80);
      ellipse(centroX, centroY, radios[r], radios[r]);
    }

    if(beat.isSnare()){
      float angulo=51.42;
      float anguloRandom=int(random(1,8))*angulo;
      float radio=95;
      float rads=radians(anguloRandom);
      float x1=(radio*(cos(rads)))+centroX; //x=RcosAlfa
      float y1=(radio*(sin(rads)))+centroY; //x=RsenAlfa
      int rojo=int(random(0,90));
      int verde=141;
      int azul=165;    
      fill(rojo, azul, verde, 125);
      ellipse(x1, y1, 70,70);    
    }  
    
    if(beat.isHat()){
      float angulo2=25.71428;
      float radio=269; //radio con tanteometro :P
      float angulo2Random=int(random(1,15))*angulo2;
      float rads=radians(angulo2Random);
      float x1=(radio*(cos(rads)))+centroX;
      float y1=(radio*(sin(rads)))+centroY;    
      PShape s;
      s= loadShape("forMandalah.svg");
      smooth();
      s.scale(.50);
      shapeMode(CORNERS);    
      println(rads);
      s.rotate(radians(angulo2Random+99.8)); //ese 99.8 fue con tanteometro haha    
      s.disableStyle();
      stroke(255);
      stroke(0);    
      shape(s,x1,y1);    
    }    
  }

void stop(){
    song.close();
    minim.stop();
    super.stop();
}

//code on http://code.compartmental.net/minim/examples/
class BeatListener implements AudioListener
{
  private BeatDetect beat;
  private AudioPlayer source;
  
  BeatListener(BeatDetect beat, AudioPlayer source)
  {
    this.source = source;
    this.source.addListener(this);
    this.beat = beat;
  }
  
  void samples(float[] samps)
  {
    beat.detect(source.mix);
  }
  
  void samples(float[] sampsL, float[] sampsR)
  {
    beat.detect(source.mix);
  }
}


