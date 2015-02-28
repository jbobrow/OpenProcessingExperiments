
import ddf.minim.analysis.*;
import ddf.minim.*;
import ddf.minim.effects.*;

/* COSTANTI */
int FREQUENCY_RANGE = 8;
float SAMPLE_RATE = 1024;

/* VARIABILI PER L'AUDIO */
Minim minim;
AudioPlayer song;

FFT fft;
GestoreCerchi gc;

float posX = random(0,width);
float posY = random(0,height);

void setup(){
  size(800,700,P3D);
  
  colorMode(RGB);
  background(0,0,0);
  
  setAudio();
  fft = new FFT(song.bufferSize(), song.sampleRate());
  
  gc = new GestoreCerchi(FREQUENCY_RANGE, new PVector(width/2,height/2,0));
  
} // end setup


void draw(){
  background(0);
  gc.run();
  doFFT();
  posX = random(0,width);
  posY = random(0,height);
} // end draw


/*
* Setting dell'audio
*/
void setAudio(){
  minim = new Minim(this);
  song = minim.loadFile("01-Fuel.mp3", (int) SAMPLE_RATE);
  song.play();  
} // end setAudio


/**
* Effettua l'analisi di Fourier e con i valori visualizza i cerchi
*/
void doFFT(){
  // Vario il numero di bande usate nella suddivisione lineare
  // al variare della posizione orizzontale del mouse
  int bandNumber = (int) map(mouseX, 0, width, 8, 48);
  
  fft.linAverages(bandNumber);
  fft.forward(song.mix);
  
  colorMode(HSB, bandNumber, 100, 100);
  
  float minAmp = fft.getAvg(0);
  float maxAmp = fft.getAvg(0);
  for (int i = 0; i < bandNumber; i++){ 
    if(fft.getAvg(i)<minAmp)
      minAmp = fft.getAvg(i);
    if(fft.getAvg(i)>maxAmp)
      maxAmp = fft.getAvg(i);
  } // end for  
  
  for (int i = 0; i < bandNumber; i++){
    gc.addCerchio(posX, 
                  posY,
                  color(i, 100, map(fft.getAvg(i), minAmp, maxAmp, 20, 100)),
                  map(fft.getAvg(i), minAmp, maxAmp, -5, 5),
                  map(fft.getAvg(i), minAmp, maxAmp, 20, 35),
                   map(mouseY, height, 0, 20, 75));
  } // end for
  
} // end doFFT


void mouseClicked(){
    posX = mouseX;
    posY = mouseY;
} // end mouseClicked


void stop(){
  song.close();
  minim.stop();
  super.stop();
} // end stop

