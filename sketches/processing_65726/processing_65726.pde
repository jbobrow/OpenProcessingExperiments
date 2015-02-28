
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;

Minim minim;
AudioPlayer song;
FFT fft;
LowPassSP lowpass;
HighPassSP highpass;
PFont font;
Testo play, pause, rewind, low, high, normale, press1, press2, titolo;

//SETUP
void setup() {
  size(800, 500);
  minim = new Minim(this); 
  song = minim.loadFile("Summer of Love.mp3", 1024);
  fft = new FFT(song.bufferSize(), song.sampleRate());
  fft.logAverages(40, 2);

  //FILTRI
  lowpass = new LowPassSP(100, 44100);
  highpass = new HighPassSP(200, 44100);
  
  //CRAZIONE TESTO
  titolo = new Testo("PROGETTO   Sistemi Multimediali", width/2, 25);
  press1 = new Testo("PRESS:", 25, 50); 
  play = new Testo("'P' to Play", 25, 65);
  pause = new Testo("'S' to Pause", 25, 80);
  rewind = new Testo("'R' to Rewind", 25, 95);
  press2 = new Testo("PRESS:", 25, height-85); 
  normale = new Testo("'N' for Normal song", 25, height-70);
  low = new Testo("'L' for LowPass", 25, height-55);
  high = new Testo("'H' for HighPass", 25, height-40);
  font = loadFont("AmericanTypewriter-18.vlw");
}

//DRAW
void draw() {
  background(0);
  fft.forward(song.mix); 

  //TESTO
  fill(255);
  textFont(font);
  textSize(20);
  textAlign(CENTER);
  titolo.display();

  textSize(14);
  textAlign(LEFT);
  press1.display();
  play.display();
  pause.display();
  rewind.display();
  press2.display();
  normale.display();
  low.display();
  high.display();

  colorMode(HSB);
  //SPETTRO 1°QUADRANTE
  for (int i = 0; i < fft.avgSize(); i++) {
    pushMatrix();
    for (int j = 1; j < fft.getAvg(i)/5; j += 2) {
      fill( map( j, 0, fft.avgSize()*2, 0, 200), 255, 255);
      rect(width/2+i*20, (height/2-j*3), 15, 6);
    }
    popMatrix();
  }

  //SPETTRO 2°QUADRANTE
  for (int i = 0; i < fft.avgSize(); i++) {
    pushMatrix();
    for (int j = 1; j < fft.getAvg(i)/5; j += 2) {
      fill( map( j, 0, fft.avgSize()*2, 0, 200), 255, 255);
      rect(width/2-i*20, (height/2-j*3), 15, 6);
    }
    popMatrix();
  }

  //SPETTRO 3°QUADRANTE
  for (int i = 0; i < fft.avgSize(); i++) {
    pushMatrix();
    for (int x = 1; x < fft.getAvg(i)/5; x += 2) {
      fill( map( x, 0, fft.avgSize()*2, 0, 200), 255, 255);
      rect(width/2-i*20, height/2+3*x, 15, 6);
    }
    popMatrix();
  }

  //SPETTRO 4°QUADRANTE
  for (int i = 0; i < fft.avgSize(); i++) {
    pushMatrix();
    for (int x = 1; x < fft.getAvg(i)/5; x += 2 ) {
      fill( map( x, 0, fft.avgSize()*2, 0, 200), 255, 255);
      rect(width/2+i*20, height/2+3*x, 15, 6);
    }
    popMatrix();
  }
}

//CONTROLLO COMANDI TASTIERA
void keyPressed() {
  if (key == 'p' || key == 'P') {
    song.play();
    play.setPremutoComandi(pause, rewind, low, high, normale);
  }
  else
    if (key == 's' || key == 'S') {
      song.pause();
      pause.setPremutoComandi(play, rewind, low, high, normale);
    }
    else
      if (key == 'r' || key == 'R') {
        song.rewind();
        rewind.setPremutoComandi(pause, play, low, high, normale);
      }
      else
        if (key == 'l' || key == 'L') {
           song.clearEffects();
           song.addEffect(lowpass);
           low.setPremutoFiltri(high, normale, play);
        }
        else
          if (key == 'h' || key == 'H') { 
             song.clearEffects();     
             song.addEffect(highpass);
             high.setPremutoFiltri(low, normale, play);
          }
          else
            if (key == 'n' || key == 'N') {
               song.clearEffects();
               normale.setPremutoFiltri(low, high, play);
          }
}

//STOP
void stop() {
  song.close();
  minim.stop();
  super.stop();
}


