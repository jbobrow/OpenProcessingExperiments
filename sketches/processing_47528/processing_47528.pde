
import ddf.minim.analysis.*;
import ddf.minim.*;

Minim minim = new Minim(this);
AudioPlayer audio;

int nb = 200, n = 30;
int coeff1 = - 2, coeff2 = 6;

float rad = 80, w1 = rad * 2 * PI / n, w2;

Boolean sounding = true;
color bgcolor = #21120A;

void setup(){
  rectMode(CORNERS);
  colorMode(HSB,100);
  smooth();
  size(300, 600);
  w2 = float (width - 30) / n;
  strokeWeight(2);
  stroke(15);
  audio = minim.loadFile("audio.mp3");
  audio.play();
}
 
void draw(){
  fill(bgcolor,5);
  rect(0,0,width,height);
  
  FFT fft = new FFT(audio.bufferSize(), audio.sampleRate());
  fft.linAverages(nb);
  fft.forward(audio.mix);
  
  for(int i = 0; i < n; i++) {
    fill(i*100/(n),100,100);
    pushMatrix(); 
    translate(width/2, height/2- 100);
    rotate(i * 2 * PI/(n));
    rect(-w1/2 , rad, w1/2, rad - 10 + fft.getAvg(i)*coeff1);
    popMatrix(); 
    rect(15 + i*w2 , height-12, 15 + (i*w2)  + w2, height - 15 - fft.getAvg(i)*coeff2);
  }
}

