
import ddf.minim.spi.*;
import ddf.minim.signals.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.ugens.*;
import ddf.minim.effects.*;

Minim voz;

AudioInput in;

int ancho=0;
int x=10;


void setup(){
 size(500,500);
 smooth();
 stroke(255,0,0);
 frameRate(25);
 voz=new Minim(this);
 in=voz.getLineIn(Minim.MONO,512);
}


void draw(){
  background(255);
 
 float m=0; 
 for(int i=0; i<in.bufferSize()-1; i++){
   if(abs(in.mix.get(i))>m){
     m=abs(in.mix.get(i));
   }
 }
 

 strokeWeight(60);
 ellipse(x,250,50,50);
 //printLn(ancho);
 
     x=x+int(m*50);
     
  if (x>500){
    x=10;
}

}
