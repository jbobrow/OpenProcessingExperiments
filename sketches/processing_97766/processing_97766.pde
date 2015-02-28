
float posX=random (400);
import ddf.minim.spi.*;
import ddf.minim.signals.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.ugens.*;
import ddf.minim.effects.*;

Minim miaudio;

AudioPlayer mireproductor1, mireproductor2;

float posY=random (800);

 
float sentidoX=8;
float sentidoY=0;
 

 
void setup(){
  size(800,400);
  background(255);
   miaudio= new Minim(this);
  //mireproductor1= miaudio.loadFile("perro.mp3");
  //mireproductor2= miaudio.loadFile("gato.mp3");
  frameRate(20);
}

 
void draw(){
  background(255);

   
  fill(0,0,255);
  ellipse(posX,200,60,60);
   
   posY=posY+sentidoY;
   posX=posX+sentidoX;
    
    if(posY>=height-30){
      sentidoY=-sentidoY;
    float distancia=abs (mouseX-posX);
   
    }
     
    if(posY-30<=0){
      sentidoY=-sentidoY;
       
    }
     
 
    if(posX>=width-30){
      sentidoX=-sentidoX;
       mireproductor1= miaudio.loadFile("perro.mp3");
      mireproductor1.play();
  
    }
     
    if(posX-30<=0){
      sentidoX=-sentidoX;
      mireproductor2= miaudio.loadFile("gato.mp3");
      mireproductor2.play();
       
    }
     

}
