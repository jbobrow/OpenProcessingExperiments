
import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
  
Minim minim;
  
AudioOutput salida;
SineWave seno;
  
  
void setup () {
  smooth();
size(800,500);
minim = new Minim (this);
  
salida = minim.getLineOut(Minim.STEREO);
  
seno = new SineWave(14400, 0.9, salida.sampleRate());
  
seno.portamento(200);
salida.addSignal(seno);
}
  
void draw () {
  
//  background(255);
  float frec = map(mouseY, 0, width, 40, 18400);
  seno.setFreq(frec);
   background (0);
   stroke(100,100,200);
  
   for (int i = 0; i < salida.bufferSize() - 1 ; i++)
   {
     float x1= map(i,0,salida.bufferSize(), 0, width);
     float x2 =map(i+1, 0, salida.bufferSize(), 0, width);
       
     line(x1, 50 + salida.left.get(i)*50, x2, 50+salida.left.get(i+1)*50);
     line(x1, 150 + salida.right.get(i)*50, x2, 150+salida.right.get(i+1)*50);
    
   }
}


