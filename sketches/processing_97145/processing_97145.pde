
import ddf.minim.spi.*;
import ddf.minim.signals.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.ugens.*;
import ddf.minim.effects.*;

 Minim voz;
 
AudioInput in;

PFont letras; 
int ancho=0;
int y=500;


void setup(){
 size(500,500);
 smooth();
 stroke(255,0,0);
 frameRate(25);
 voz=new Minim(this);
 in=voz.getLineIn(Minim.MONO,512);
  letras=createFont("Serif-48.vlw",5);
  textFont(letras,50);

 }

void draw(){
  background(255);
  
   float m=0;
 for(int i=0; i<in.bufferSize()-1; i++){
   if(abs(in.mix.get(i))>m){
     m=abs(in.mix.get(i));

      if (y<50){
       fill(0);
     text ("ganaste",250,250);
        }
        
          if (y>450){
      fill(0);
   text ("Perdiste",250,250);
        }
    
    
   }
 }
  
strokeWeight(60);
 y=y+5;
 ellipse(250,y,50,50);
 
  y=y-int(m*50);
      
  if (y<0){
    y=+10;  
 
   }
 }
