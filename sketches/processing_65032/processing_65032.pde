
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;

Minim minim;
AudioPlayer song;
FFT trasformata;
BeatDetect bD;
HighPassSP passaAlto;
LowPassSP passaBasso;
float lim1=300;
float lim2=300;
int nrBande=24;

CoronaEsterna beat;
CoronaInterna frequenze;
Pulsante p1;
Pulsante p2;
Indicatore indicatore;

PFont font;

void setup(){
  size(600, 650);
  font= loadFont("Gabriola-24.vlw");
  minim = new Minim(this);
  song = minim.loadFile("Fool's Garden - Lemon Tree.mp3", 1024);
  trasformata= new FFT(song.bufferSize(), song.sampleRate());
  trasformata.logAverages(20,4);
  passaAlto=new HighPassSP(lim1, song.sampleRate());
  passaBasso=new LowPassSP(lim2, song.sampleRate());
  bD=new BeatDetect();
  smooth();
  ellipseMode(CENTER);
  colorMode(HSB);
  background(0);
  //creazione pulsanti, corone e barra
  p1=new Pulsante(width/2, height/2-60, 10, color(255, 150));
  p2=new Pulsante(width/2, height/2+60, 10, color(255, 150));
  indicatore=new Indicatore(200, height-40, color(255));
  beat=new CoronaEsterna();
  frequenze=new CoronaInterna(300, 30, nrBande);
  song.play();
}

void draw(){
  smooth();
  noStroke();
  float[] mix = song.mix.toArray();
  // calcolo dell'intensità
  float max=0;
  for ( int i = 0; i < mix.length - 1; i++ ){
    if(abs(mix[i])>max)
      max=abs(mix[i]);
  }
  bD.detect(mix);
  // tracciatura corona esterna
  beat.update(max);
  if(bD.isOnset()){
    beat.display();
  }
  trasformata.forward(song.mix);
  // tracciatura corona interna
  frequenze.display(trasformata);
  textFont(font); 
  textAlign(CENTER, CENTER);
  fill(255, 200);
  text("PassaBasso", width/2, height/2-30);
  text("PassaAlto", width/2, height/2+20);
  // inserimento pulsanti
  p1.display();
  p2.display();
  indicatore.update();
  indicatore.display();
  lim1=indicatore.valoreBasso();
  lim2=indicatore.valoreAlto();
  passaBasso.setFreq(lim1);
  passaAlto.setFreq(lim2);
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
  if (p1.isOver()){
    if(p2.selected && !p1.selected){
      p1.selected=true;
      p2.selected=false;
    } else if((p1.selected && !p2.selected)|| !p1.selected){
      p1.selected=!p1.selected;
    }
  }
  if (p2.isOver()){
    if(p1.selected && !p2.selected){
      p2.selected=true;
      p1.selected=false;
    } else if((p2.selected && !p1.selected)|| !p2.selected){
      p2.selected=!p2.selected;
    }
  }
  if(!p1.selected){
    song.removeEffect(passaBasso);
    if(p2.selected){
      song.addEffect(passaAlto);
    }
  }
  if(!p2.selected){
    song.removeEffect(passaAlto);
    if(p1.selected){
      song.addEffect(passaBasso);
    }
  }
    
  
}

