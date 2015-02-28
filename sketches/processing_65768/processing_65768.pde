
import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;

import processing.opengl.*;

private Minim minim;      
private AudioPlayer song;  
private AudioOutput out; 
public FFT fft;  

private BeatDetect beat;
private BandPass bandPass;

boolean check;

int w = 20;
int h = 50;
int numParticles = 50;

Particle[] particles = new Particle[numParticles];

Snare snare;
Hat hat;
Kick kick;

void setup()
{
  size (800, 500, OPENGL);
  noStroke(); 
  smooth();

  minim = new Minim(this);
  song = minim.loadFile("honky.mp3", 1024); 
  bandPass = new BandPass(20, 50, 44100);
  song.loop();
  

  // FFT
  fft = new FFT(song.bufferSize(), song.sampleRate());
  fft.logAverages(44, 3);
  fft.window(FFT.HAMMING);

  // BEAT
  beat = new BeatDetect(song.bufferSize(), song.sampleRate());

  colorMode(HSB, 360, 100, 100);
  color c = color(105, 94, 92, 20);
  snare = new Snare(492, 432, c);
  c = color(0, 96, 92, 20);
  hat = new Hat(627, 435, c);
  c = color(175, 94, 99, 20);
  kick = new Kick(732, 353, c);

  song.addEffect(bandPass);
  check = false;
}

void draw() {
  fill(0, 5);
  rect(0, 0, width, height);

  beat.detect(song.mix); //detect beats
  fft.forward(song.mix); //compute fft

  hat.display();
  kick.display();
  snare.display();

  if (beat.isHat()) {
    hat.update();
  }
  else if (beat.isKick()) {
    kick.update();
    snare.update();
  }
  /*
  else if (beat.isSnare()) {
    snare.update();
  }
  */


  float[] mix = song.mix.toArray();
  for ( int i = 0; i < mix.length - 1; i++ )
  {
    float x1 = map(i, 0, song.bufferSize(), 0, width);
    float x2 = map(i+1, 0, song.bufferSize(), 0, width);
    colorMode(HSB, 360, 100, 100);
    float hueColor = map(i, 0, width, 0, 360);
    float saturationColor = map(mouseX, 0, width, 20, 100);
    float brightnessColor = map(mouseY, height, 0, 40, 100);
    float alphaColor = map(i, height, 0, 100, 0);
    color c = color(hueColor, saturationColor, brightnessColor, alphaColor);
    stroke(c);
    line(x1, height/3 - mix[i]*100, x2, height/3 - mix[i+1]*100);
  }

  if (check) {
    for (int i=0; i <particles.length; i++) {
      particles[i].update();
      particles[i].checkEdges();
      particles[i].display();
    }
  }
}

void mousePressed() {
  if (hat.checkPosition(mouseX, mouseY)) {
    hat.checkPress = true;
  }
  else if (snare.checkPosition(mouseX, mouseY)) {
    snare.checkPress = true;
  }
  else if (kick.checkPosition(mouseX, mouseY)) {
    kick.checkPress = true;
  }
  else {
    for (int i = 0; i < particles.length; i++) {
      float velX = random(-2, 2);
      float velY = random(-2, 2);
      color co = color(map(mouseX, 0, width, 0, 255), map(mouseY, 0, height, 0, 255), map(mouseX, 0, width, 0, 255));
      particles[i] = new Particle(mouseX, mouseY, velX, velY, 3.0, co);
    }
    check = true;
  }
}

void mouseReleased(){
  if (hat.checkPosition(mouseX, mouseY) && hat.checkPress) {
    song.pause();
  }
  else if (snare.checkPosition(mouseX, mouseY) && snare.checkPress) {
    song.play();
  }
  else if (kick.checkPosition(mouseX, mouseY) && kick.checkPress) {
    song.rewind();
  }
}

void keyPressed(){
  switch(key){
  case 'c' : check = false;
  }
}

void stop() {
  song.close();
  minim.stop();
  super.stop();
}


