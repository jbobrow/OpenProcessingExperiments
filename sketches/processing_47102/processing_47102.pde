
import ddf.minim.analysis.*;
import ddf.minim.*;

Minim minim;
AudioPlayer jingle;
//FFT fft;
FFT fftLin;
//FFT fftLog;


void setup() {
  size(600, 300);
  smooth();
  noStroke();
  colorMode(HSB, 360, 100, 100);
  rectMode(CENTER);
  ellipseMode(CENTER);
  minim = new Minim(this);

  jingle = minim.loadFile("02 Alchemy (feat. Zoe Johnston).mp3", 2048);
  jingle.loop();

  fftLin = new FFT(jingle.bufferSize(), jingle.sampleRate());
  fftLin.linAverages(30);
  //fft = new FFT(jingle.bufferSize(), jingle.sampleRate());
}

void draw() {

  fill(0);
  rect(width/2, height/2, width, height);

  float centerFrequency = 0; 
  fftLin.forward(jingle.mix);

  // println(fftLin.specSize());
  //println(fft.specSize());



  for (int i = 0; i < fftLin.specSize()/3; i+=4) {
    float c= map(fftLin.getBand(i), 0, 10, 100, 150);
    float s = map(fftLin.getBand(i+1), 0, 15, 0, 100);
    float y = height/2 + map(fftLin.getBand(i+2), 0, 10, -height/2, height/2);
    float x = width/2 + map(fftLin.getBand(i+3), 0, 10, -width/2, width/2);
    noStroke();
    fill(c, 80, 100, 20);
    ellipse(-x+600, y, s, s);
    //println(i+ " "+fftLin.getBand(i)+" "+ c+ " "+ s + " "+ x +" "+ y);
  }

  for (int i = fftLin.specSize()/3; i < 2*fftLin.specSize()/3; i+=4) {
    float c= map(fftLin.getBand(i), 0, 0.5, 0, 50);
    float s = map(fftLin.getBand(i+1), 0, 0.5, 0, 100);
    float y = height/2 + map(fftLin.getBand(i+2), 0, 0.5, height/2, height/2);
    float x = width/4 + map(fftLin.getBand(i+3), 0, 0.5, -width/4, width/2);
    noFill();
    stroke(c, 100, 100, 50);
    rect(x, y, s, s);
    //println(i+ " "+fftLin.getBand(i)+" "+ c+ " "+ s + " "+ x +" "+ y);
  }

  for (int i = 2*fftLin.specSize()/3; i < fftLin.specSize(); i++) {
    float c= map(fftLin.getBand(i), 0, 0.4, 200, 360);
    float s = map(fftLin.getBand(i+1), 0, 0.4, 0, 100);
    //float y = height/2 + map(fftLin.getBand(i+2), 0, 0.4, -height/2, height/2);
    //float x = width/2 + map(fftLin.getBand(i+3), 0, 0.4, -width/2, width/2);    

    float r =  map(fftLin.getBand(i+2), 0, 0.5, 0, TWO_PI);
    float t = map(fftLin.getBand(i+3), 0, 0.5, -width/4, width/4);
    float x =width/4 +t*cos(r);
    float y =height/2 +t*sin(r);

    stroke(c, 100, 50);
    strokeWeight(1);
    ellipse(x, y, s, s);
  }
}

void stop()
{
  jingle.close();
  minim.stop();

  super.stop();
}


