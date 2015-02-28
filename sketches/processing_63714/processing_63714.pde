
import ddf.minim.analysis.*;
import ddf.minim.*;

Minim minim;
AudioPlayer song;
FFT fft;

void setup(){
  size(512, 150, P3D);
  textMode(SCREEN);
  minim = new Minim(this);
  song = minim.loadFile("David Guetta - I Can Only Imagine.mp3", 1024);
  song.loop();
  fft = new FFT(song.bufferSize(), song.sampleRate());
  fft.linAverages(32);  
  colorMode(HSB, 100);  
}

void draw(){
  background(0);
  stroke(0);
  fft.forward(song.mix);
  int x = int((width)/fft.avgSize());
  for (int i = 0; i < fft.avgSize(); i++){
    for(int j=0; j<fft.avgSize(); j++){
      fill( map( i, 0, fft.avgSize(), 0, 100), mouseX/6, mouseY*0.6);
      rectMode(CENTER);
      strokeWeight(3);
      rect(i*x, 50, 15+fft.getAvg(i),15+fft.getAvg(i));
      rect(i*x, 50+15, 15+fft.getAvg(i),15+fft.getAvg(i));
      rect(i*x, 50+30, 15+fft.getAvg(i),15+fft.getAvg(i));
      rect(i*x, 50+45, 15+fft.getAvg(i),15+fft.getAvg(i));  
    }
  }
  fill(255);
}

void stop(){
  song.close();
  minim.stop();
  super.stop();
}


