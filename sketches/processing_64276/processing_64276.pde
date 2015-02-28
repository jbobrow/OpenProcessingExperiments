
import ddf.minim.analysis.*;
import ddf.minim.*;

Minim minim;
AudioPlayer jingle;
FFT fft;

void setup(){

size(600,600,P3D);
colorMode(HSB,360);
 
  
  minim = new Minim(this);
  
  jingle = minim.loadFile("06 loud pipes (ratatat - classics).mp3", 2048);
  // loop the file
  jingle.loop();
  
   fft = new FFT(jingle.bufferSize(), jingle.sampleRate());
   fft.linAverages(128);
}


void draw(){
  
  background(0);
   
   fft.forward(jingle.mix);
  int w = int(fft.specSize()/128);
  for(int i = 0; i < fft.avgSize(); i++)
  {
  
  translate(300,300, 10); 
  rotateY(mouseY);
  rotateX(mouseX);
  box(100+fft.getAvg(i)*3,100+fft.getAvg(i)*3,100 + fft.getAvg(i)*3);
 
  noFill();
  
  //stroke(i*5,360,360);
  stroke(255);
  
 
  
  	
}
}
void stop()
{
  // always close Minim audio classes when you finish with them
  jingle.close();
  minim.stop();
  
  super.stop();
}


