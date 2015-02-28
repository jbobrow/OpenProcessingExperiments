
import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;

Minim minim;
AudioPlayer song;
FFT fft;
HighPassSP highpass;
LowPassSP lowpass;

int colore = 30;
float lato;
float angolo;
float vel = 0.05;
boolean filtroAttivoH=false;
boolean filtroAttivoL=false;
int h = 20;
int w = 20;
BeatDetect beat;

void setup(){
  size(512,200,P2D);
  
  minim = new Minim(this);
  song = minim.loadFile("acdc-tnt.mp3", 512);
  song.play();
  
  beat = new BeatDetect(song.bufferSize(), song.sampleRate());
  highpass = new HighPassSP(800,44100);
  lowpass = new LowPassSP(400,44100);
  fft = new FFT(song.bufferSize(), song.sampleRate());
  fft.logAverages(41,2);
  
  colorMode(HSB, 100);
  
  rectMode(CENTER_RADIUS);
  frameRate(25);
}

void keyReleased() {
  if (key == 'h' || key == 'H') {
    if(!filtroAttivoH){
      song.addEffect(highpass);
      filtroAttivoH=true;}
    }
    else if(key == 'l' || key == 'L'){
    if(!filtroAttivoL){
   song.addEffect(lowpass);
   filtroAttivoL=true;}
    }
    else if(key == 'r' || key == 'R'){
    song.removeEffect(highpass);
    song.removeEffect(lowpass);
    filtroAttivoH=false;
    filtroAttivoL=false;}
}

void draw(){
  
  noStroke();
  
  beat.detect(song.mix);
  
  fft.forward(song.mix);
  println(fft.specSize());
  int x=int((width/2)/fft.avgSize());
  for(int i=0; i<fft.avgSize(); i++){
    fill(colore, map(i,fft.avgSize(), 0, 0, 100), 100);
    rect(i*x+w, height/2, 5.5, (fft.getAvg(i)));
    rect(width-(i*x+w), height/2, 5.5, (fft.getAvg(i)));
  }

 if(beat.isRange(3,3,1)) lato=60;
 
  fill(0, 30);
  rect(0, 0, width, height);
  fill(colore,lato,100);
  translate(width/2, height/2);
  angolo=angolo+vel;
  rotate(cos(angolo));
  rect(0,0, lato, lato);
  lato=lato*0.90;
  if(lato<20)lato=20;
}

void stop()
{
  song.close();
  minim.stop();
  super.stop();
}

