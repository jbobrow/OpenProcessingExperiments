
import ddf.minim.*;
import ddf.minim.analysis.*;

Minim minim;
AudioPlayer Nocturne;
FFT fft;

void setup() {
  size(500,200,P2D);
  minim = new Minim(this); //create a new minim
  Nocturne= minim.loadFile("Nocturne No.2.mp3", 2048);//load the audio file
  Nocturne.loop();
  fft = new FFT(Nocturne.bufferSize(), Nocturne.sampleRate()); //create an FFT object, the time-domain buffer and the sample rate are the same as Nocturne No.2
  fft.linAverages(95); //use 95 averages;
  rectMode(CORNERS); //set the location to one corner
}

void draw() {

  background(255);
  fft.forward(Nocturne.mix); //perform a forward FFT on the samples in Nocturne's mix buffer
  for(int i = 0; i < fft.avgSize(); i++) {  //a for loop,
    fill(random(0,50),random(0,255),random(0,255)); // fill the rectangle random
    rect(i*20, height, i*20 + 20, height- fft.getAvg(i)*20); //draw a rectangle for 20 times each average
  }
}
void keyPressed() { //audio and minim stop when the key is pressed
  Nocturne.close();
  minim.stop();
}


