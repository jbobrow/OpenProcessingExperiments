
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;

Minim minim;
AudioPlayer song;
FFT fft;

AudioMetaData metadata;
int minuti;
int secondi;


LowPassSP lowpass;
HighPassSP highpass;
float band;

void setup(){
  size(800, 600);
  smooth(); 
  fill(255,0,30);
  minim = new Minim(this);
  song = minim.loadFile("Benny Benassi - House Music.mp3", 1024); 
  song.loop();
  metadata=song.getMetaData(); 
  secondi=metadata.length()/1000;
  minuti=secondi/60;
  secondi=secondi % 60;  
  fft = new FFT(song.bufferSize(), song.sampleRate());    
  lowpass = new LowPassSP(15000, song.sampleRate()); 
  song.addEffect(lowpass);  
  highpass = new HighPassSP(1, song.sampleRate()); 
  song.addEffect(highpass);
}

void draw(){
  background(0);
  noStroke();
  fill(255); 
  text("Artista: " + metadata.author(), 500, 50); 
  text("Titolo Canzone: " + metadata.title(), 500, 70);
  secondi=(song.length()-song.position())/1000;
  minuti=secondi/60;
  secondi=secondi % 60;
  if (secondi <10) {
    text("Durata"+minuti+":0"+secondi,500, 90);
  }
  else {
    text("Durata:"+minuti+ ":" +secondi, 500, 90);
  }
  
  if (key != 'l' && key != 'L')  { 
    fill(255, 0,246);
    text("Premi L per attivare il filtro passa basso", 70, 50); 
  }      
  if (key != 'h' && key !='H') { 
    fill(53,249,0);
    text("Premi H per attivare il filtro passa alto", 70, 80); 
  }         
  if (key == 'l' || key == 'L') {       //filtro passa basso
    stroke(255);
    line(150, height/5+400, 650, height/5+400); 
    fill(255,0,246);
    text("0", 149, height/5+420);
    text("5000", 625, height/5+420);
    text("Filto passa basso", 350,height-50);
    float g = map(mouseX, 0, width, width/5, 4*width/5); 
    float lowFreq = map(g, width/5, 4*width/5, 0, 5000);     
    line(g, 7*height/8-10, g, 7*height/8+10); 
    lowpass.setFreq(lowFreq);
    println("Freq: " + lowFreq);
  }   
  if (key == 'h' || key == 'H') {    //filtro passa alto
    stroke(255);
    line(150, height/5+400, 650, height/5+400);
    fill(53,249,0);
    text("0", 149, height/5+420);
    text("5000", 625, height/5+420);
    text("Filto passa alto",350, height-50);
    float g= map(mouseX, 0, width, width/5, 4*width/5);
    float highFreq = map(g, width/5, 4*width/5, 0, 5000);    
    line(g, 7*height/8-10, g, 7*height/8+10); 
    highpass.setFreq(highFreq);
    println("Freq: " + highFreq);
  }   
  fft.forward(song.mix);
  for (int i = 0; i < 120; i+=2) {
    band = fft.getBand(i);
    if (key != 'l' && key != 'L' && key != 'h' && key != 'H')
      stroke(255, 0, 30);
    if (key == 'l' || key == 'L')
      stroke(255, 0, 246);
    if (key == 'h' || key == 'H')
      stroke(53,249,0);
    strokeWeight(1);
    line(width/5 + 4*i, 3*height/4, width/5 + 4*i, 3*height/4-4*band);   
    if (key != 'l' && key != 'L' && key != 'h' && key != 'H');
    {
      stroke(255);
      if (key == 'l' || key =='L')
      stroke(255, 0, 0);
      if (key == 'h' || key == 'H') 
      stroke(255, 0, 0);
      strokeWeight(2);
    }
  }

}
void stop(){
  song.close();
  minim.stop();
  super.stop();
}


