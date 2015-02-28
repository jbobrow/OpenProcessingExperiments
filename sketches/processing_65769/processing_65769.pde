
import processing.opengl.*;

import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;

Minim minim;
AudioPlayer song;
HighPassSP highPass;
LowPassSP lowPass;
BandPass pBandB;
FFT fft;
BeatDetect beat;
BeatDetect beatOnSet;

//Lista di oggetti SurfingEllipse
ArrayList<SurfingEllipse> ellipsesList = new ArrayList<SurfingEllipse>();

int hAttivation = 40;
int hReferement = 40;


//Bottoni per i filtri Passa-Basso e Passa-Alto
HighPassButton highPassButton;
LowPassButton lowPassButton;

void setup() {
  size(800, 500, OPENGL);
  smooth();

  //Inizializzo gli oggetti
  minim = new Minim(this);
  song = minim.loadFile("honky.mp3", 1024);
  beat = new BeatDetect(song.bufferSize(), song.sampleRate());
  lowPass = new LowPassSP(200, song.sampleRate());
  highPass = new HighPassSP(700, song.sampleRate());
  fft = new FFT(song.bufferSize(), song.sampleRate());
  fft.logAverages(22, 4);
  
  //Inizializzo i bottoni per i filtri
  highPassButton = new HighPassButton(100, 30, 200, 30, "HighPass Filter");
  lowPassButton = new LowPassButton(500, 30, 200, 30, "LowPass Filter");

  int x = int((width-20)/fft.avgSize());

  colorMode(HSB, 100);
  for (int i=0; i<fft.avgSize();i++) {
    color col = color ( map( i, 0, fft.avgSize(), 0, 100), 100, 100);
    SurfingEllipse surfer = new SurfingEllipse(i*x+27.5, height, 0.0, 2.0, 15.5, col);
    ellipsesList.add(surfer);
  }
  song.loop();
}



void draw() {
  fill(0);
  rect(0, 0, width, height-402);

  colorMode(HSB, 100);
  stroke(255);
  line(0, 200, width, 200);

  beat.detect(song.mix);

  color c = color( map( mouseX, 0, width, 0, 100), 100, 100, 5);
  BeatEllipse beatEllipse = new BeatEllipse(width/2, height/2, 120, c);

  fill(0, 5);
  rect(0, 100, width, height-100);

  fft.forward(song.mix);
  int x = int((width-20)/fft.avgSize());
  for (int i = 0; i < fft.avgSize(); i++)
  {
    float he = height - fft.getAvg(i)-10;
    color col = color ( map( i, 0, fft.avgSize(), 0, 100), 100, 100);
    fill( col);
    ellipse(i*x+27.5, he, 15.5, 15.5);
    fill( col);
    rect(i*x+20, he, 15, height - fft.getAvg(i));

    if (he <= height-hAttivation) {
        SurfingEllipse surfer = new SurfingEllipse(i*x+27.5, height, 0.0, 2.0, 15.5, col);
        surfer.position.y = he;
        surfer.display();
        surfer.update();
        ellipsesList.add(surfer);
    }
  }

  if (beat.isHat()) {
    beatEllipse.display();
  }
  else if (beat.isKick()) {
    beatEllipse.update();
  }

  for (int i=0; i<ellipsesList.size(); i++) { 
    if (ellipsesList.get(i).stillAlive()) {
      ellipsesList.get(i).update();
      ellipsesList.get(i).display();
    }
    else {
      ellipsesList.remove(i);
    }
  }
  
  highPassButton.display();
  lowPassButton.display();

  fill(255);
}


void mousePressed() {
  if (lowPassButton.active(mouseX, mouseY)) {
    if (lowPassButton.active) {
      song.removeEffect(lowPass);
      lowPassButton.active = false;
      hAttivation = hReferement;
    }
    else {
      song.removeEffect(highPass);
      highPassButton.active = false;
      song.addEffect(lowPass);
      lowPassButton.active = true;
      hAttivation = 30;
    }
  }
  
  if (highPassButton.active(mouseX, mouseY)) {
    if (highPassButton.active) {
      song.removeEffect(highPass);
      highPassButton.active = false;
      hAttivation = hReferement;
    }
    else {
      song.removeEffect(lowPass);
      lowPassButton.active = false;
      song.addEffect(highPass);
      highPassButton.active = true;
      hAttivation = 20;
    }
  }
}


void stop() {
  song.close();
  minim.stop();
  super.stop();
}

