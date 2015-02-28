
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;

//Dichiarazione oggetti e variabili
Minim minim;
AudioPlayer song;
AudioMetaData data;
FFT fft;
LowPassSP lowpass;
HighPassSP highpass;
float band;
boolean sposta = false;

void setup() {
  //Inizializzazione della finestra e degli oggetti
   size(700, 500);
   minim = new Minim(this);
   song = minim.loadFile("followrivers.mp3");
   song.play();
   data = song.getMetaData();
   fft = new FFT(song.bufferSize(), song.sampleRate());
   fft.logAverages(22,3);
   lowpass = new LowPassSP(100, 44100);
   song.addEffect(lowpass);
   highpass = new HighPassSP(100, 44100);
   song.addEffect(highpass);
   //Cambio la modalità del colore
   colorMode(HSB, 100);
}

void draw() {
  //Dati brano musicale
  smooth();
  text("Song: " + data.title(), width-280, 20);
  text("Author: " + data.author(), width-280, 40);
  float length = data.length() / 60000;
  text("Length: " + length + " minutes", width-280, 60);
  fill(0,5);
  rect(width/2, height/2 , width, height);
  noStroke();
  rectMode(CENTER);
  
  //Eseguo trasformata di Fourier
  fft.forward(song.mix);
  for (int i = 0; i < fft.avgSize(); i++){
    pushMatrix();  
    if(sposta){
      translate(random(-200,200),random(-200,200));
    }
    //Visualizzo le bande colorate
    fill(map( i, 0, fft.avgSize(), 0, 100), 100, 100);
    translate(50+20*i,height/2);
    rect(20, 20, 10,fft.getAvg(i)*5);
    popMatrix();
  }
  
  //Attivo i filtri in base alla posizione del mouse nella finestra
  lowpass.setFreq( map(mouseX, 0, width, 10, 10000));
  highpass.setFreq( map(mouseY, 0, height, 10, 10000)); 
}

void mousePressed(){
  sposta = !sposta;
}

void stop()
{
   song.close();
   minim.stop();
   super.stop();
}

