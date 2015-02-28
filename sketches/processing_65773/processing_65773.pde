
import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;

Minim minim;
AudioPlayer song;
FFT fft;
LowPassSP filter;
float hue = 0;
//variabili per calcolo del tempo
float time;
float unit = 1000;

void setup() {
  size(400, 400);
  noStroke();
  smooth();
  minim = new Minim(this);
  filter = new LowPassSP(10000, 44100);
  song = minim.loadFile("track.mp3", 1024);
  song.play();
  time = millis();
  song.addEffect(filter);
  fft = new FFT(song.bufferSize(), song.sampleRate());
  fft.linAverages(10);
  background(0);
}

void draw() {
  translate(width/2, height/2);
  rotate(radians(random(0, 360)));
  rectMode(CENTER);
  colorMode(HSB, 100);
  fill(0, 100, 0, 5);
  rect(0, 0, width, height); //motion blur
  fft.forward(song.mix);
  int w = int(width/2/fft.avgSize());
  isFinished(); //cambia tinta ogni secondo
  for(int i = 0; i < fft.avgSize(); i++) {
    float limiter = constrain(fft.getAvg(i), 0, 5); //limiter
    fill(hue, 100, map(limiter, 0, 5, 0, 100));
    rect(width/2 - w/2 - w * i, 0, w, 5);
  }
  PVector or = new PVector(width/2, height/2);
  PVector mouse = new PVector(mouseX, mouseY);
  float d = constrain(or.dist(mouse), 0, 200);
  filter.setFreq(map(d, 0, 200, 0, 10000));
}

void isFinished(){
  if(millis()-time > unit){
    time = 0;
    time = millis();
    hue = random(0, 100);
  }
}

void stop() {
  song.close();
  minim.stop();
  super.stop();
}

