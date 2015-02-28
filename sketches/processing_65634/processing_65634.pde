
import ddf.minim.analysis.*;
import ddf.minim.*;
import ddf.minim.effects.*;

Minim minim;
AudioPlayer song;
FFT fft;
LowPassSP lowpass;
HighPassSP highpass;
boolean terremoto = false;

void setup(){
  size(660,400);
  minim = new Minim(this);
  song = minim.loadFile("Tung-estrazione.mp3", 1024);
  fft = new FFT(song.bufferSize(), song.sampleRate());
  lowpass = new LowPassSP(180, 44100);
  highpass = new HighPassSP(5000, 44100);
  fft.logAverages(32,22);  
  println(fft.avgSize());
  song.loop();
}

void draw(){
  background(0);
  fft.forward(song.mix);
  pushMatrix();
  //effetto vibrazione attivabile/disattivabile con il click del mouse
  if(terremoto){
    translate(random(-5,5),random(-5,5));
  }else{
    translate(0,0);    
  }
  //disegna lo spettro
  for (int i=0; i<fft.avgSize(); i++){
    fill(255);
    rect((i*3),height/2,3,3);    
    int altezzaFrequenza = (int)(fft.getAvg(i))/6;
    for(int j=0; j<altezzaFrequenza; j++){
      fill(255-(j*10),255-(j*10),255);
      rect((i*3),(height/2-(j*3)),3,3);
      rect((i*3),(height/2+(j*3)),3,3);
    }
  }
  popMatrix();
  
  //copy
  fill(150);
  textSize(11);
  text("Creato da: Matteo Barone",10,370);
  text("Musica: estrazione dal brano Tung di Deniz Koyu",10,380);
  text("Durata: 2.23",10,390);
}

void stop(){
  song.close();
  minim.stop();
  super.stop();
}

//attivazione filtri con tastiera
void keyPressed() {
  if(key=='l' || key=='L'){
    song.clearEffects();
    song.addEffect(lowpass);
  }
  else if(key=='h' || key=='H'){
    song.clearEffects();
    song.addEffect(highpass);
  }
  else if(key=='n' || key=='N'){
    song.clearEffects();
  }
}

void mousePressed(){
  terremoto = !terremoto;
}
 

