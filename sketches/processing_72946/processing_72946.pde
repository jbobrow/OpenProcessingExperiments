
import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;

int aX = 0;
int aY = 0;
int mano = 0;
void setup(){
size (447,447);

}

void draw(){
  
  background(0);

 ellipse(aX,223,10,10); 
 
 Minim miaudio;

AudioPlayer miReproductor;

miaudio = new Minim(this);
  
//miReproductor = miaudio.loadFile ("cat.wav");

//miReproductor.play();

//miaudio.stop();



//miReproductor = miaudio.loadFile ("dog.wav");

//miReproductor.play();

//miaudio.stop();

if (mano==0) { //esfera se va a la derecha
    aX=aX+1;
   
   
  }
  
   if(aX>447) { //cuando la esfera llega a la derecha
    
    mano=1;
  }
  
  if (mano==1){ //cuando la esfera baja a la derecha
    aX=aX-1;
    
  }
  
     if(aX<1) { //cuando la esfera llega a la derecha
    
    mano=0;
  }

if (aX==447) { //esfera se va a la derecha
    miReproductor = miaudio.loadFile ("dog.wav");

miReproductor.play();

miaudio.stop();
   
   
  }

if (aX==0) { //esfera se va a la derecha
    miReproductor = miaudio.loadFile ("cat.wav");

miReproductor.play();

miaudio.stop();
   
   
  }

}

