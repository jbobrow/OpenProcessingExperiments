
import ddf.minim.*;
import ddf.minim.analysis.*;

Minim minim;
AudioPlayer song;
FFT trasformata;
BeatDetect bD;
int nrBande=24;

CoronaEsterna beat;
CoronaInterna frequenze;
PFont font;

void setup(){
  size(600, 650); // dimensione della finestra
  minim = new Minim(this);
  song = minim.loadFile("Fool's Garden - Lemon Tree.mp3", 1024);
  trasformata= new FFT(song.bufferSize(), song.sampleRate());
  trasformata.logAverages(20,4);
  bD=new BeatDetect();
  beat=new CoronaEsterna();
  frequenze=new CoronaInterna(300, 30, nrBande);
  font=loadFont("Gabriola-20.vlw");
  ellipseMode(CENTER);
  colorMode(HSB);
  background(0);
  song.play();
}

void draw(){
  smooth();
  float[] mix = song.mix.toArray();
  // calcolo dell'intensità
  float max=0;
  for ( int i = 0; i < mix.length - 1; i++ ){
    if(abs(mix[i])>max)
      max=abs(mix[i]);
  }
  // trova i beat
  bD.detect(mix);
  // tracciatura corona esterna
  beat.update(max);
  if(bD.isOnset()){ //controllo della presenza di un beat
    beat.display(); // conseguente visualizzazione di un cerchio
  }
  trasformata.forward(song.mix);
  frequenze.display(trasformata); // tracciatura corona interna
  fill(255);
  textFont(font); 
  textAlign(CENTER, CENTER); // allineamento del testo centrato rispetto all'asse X e all'asse Y
  text("Un click interno al cerchio\npulisce lo schermo.\nUn click esterno al cerchio\ncambia il colore dei beat.", width/2, height/2);
}

void stop(){ 
  // stop() viene sovrascritto per impostare la chiusura
  // corretta dei thread che gestiscono la riproduzione 
  // del file audio
  song.close();
  minim.stop();
  super.stop();
}

void mouseClicked(){ 
  if(dist(mouseX, mouseY, width/2, height/2)<frequenze.getRaggio()){ // se il mouse è all'interno della corona interna
    background(0);                                                   // pulisci lo schermo
  }else{
    beat.setColor(color(random(0, 255), 255, 255, 180));             // cambia il colore della corona esterna con un colore con tinta casuale
  }
}

