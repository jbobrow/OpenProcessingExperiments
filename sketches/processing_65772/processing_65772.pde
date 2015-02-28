
import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;

Minim minim;
AudioPlayer song;
FFT fftL;
FFT fftR;
//variabili per rotazione al click
int s1 = 0;
int s2 = 0;
int rotation = 0;
int click = 0;

void setup() {
  size(400, 400);
  noStroke();
  smooth();
  minim = new Minim(this);
  song = minim.loadFile("track.mp3", 1024);
  song.play();
  fftL = new FFT(song.bufferSize(), song.sampleRate());
  fftR = new FFT(song.bufferSize(), song.sampleRate());
  fftL.linAverages(100);
  fftR.linAverages(100);
  background(0);
}

void mousePressed() {
  rotation += 90;
  switch(click%4) {
    case 0: s1 = width; s2 = 0; break;
    case 1: s1 = width; s2 = height; break;
    case 2: s1 = 0; s2 = height; break;
    case 3: s1 = 0; s2 = 0; break;
    default: println("What? Noway!");
  }
  click++;
}

void draw() {
  translate(s1, s2);
  rotate(radians(rotation));
  colorMode(HSB, 100);
  fill(0, 100, 0, 25);
  rect(0, 0, width, height); //motion blur
  fftL.forward(song.left);
  fftR.forward(song.right);
  for(int i = 0; i < fftL.avgSize(); i++) {
    fill(map(i, 0, fftL.avgSize(), 0, 100), 100, 100); //colore in base a frequenza
    pushMatrix();
    float limiter = constrain(fftL.getAvg(i), 0, 20); //limiter
    rotate(radians(0.9 * i));
    rect(width/4, 0, map(limiter, 0, 20, 0, width/4*3), 2); //barra con limiter
    popMatrix();
    pushMatrix();
    rotate(radians(-0.9 * i));
    rect(0, height, 5, -map(fftR.getAvg(i), 0, 135, 0, height/4*3)); //barra reale, senza limiter
    fill(random(100));
    rect(0, height, 10, height/2); //angolo in basso a destra
    rect(0, width/4, 1, -width/4); //angolo in alto a sinistra
    popMatrix();
  }
}

void stop() {
  song.close();
  minim.stop();
  super.stop();
}

