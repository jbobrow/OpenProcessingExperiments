
/* Carvajal Santos Christian Uziel
      Audio Frecuencia*/

import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
 
Minim audio;
AudioOutput salida;
SineWave seno;
 
void setup(){
   
 size(500, 600);
 audio = new Minim(this);
 salida =  audio.getLineOut(Minim.STEREO);
 seno = new SineWave(440, 0.8, salida.sampleRate());
 seno.portamento(200);
 salida.addSignal(seno);
   
}
 
void draw(){
   
 float frec=map(mouseY, 0, width, 440, 14400);
 seno.setFreq(frec);
    
 background(0);
 stroke(255);
  
 for(int i = 0; i < salida.bufferSize()-1; i++){
   float x1 = map(i, 0, salida.bufferSize(), 0, width);
   float x2 = map(i+1, 0, salida.bufferSize(), 0, width);
    
   line(x1, 50+salida.left.get(i)*50, x2, 50+salida.left.get(i+1)*50);
   line(x1, 150+salida.right.get(i)*50, x2, 150+salida.right.get(i+1)*50);
 }
  
}

