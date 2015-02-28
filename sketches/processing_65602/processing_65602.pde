
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
 
Minim minim;
AudioPlayer audio;
FFT istogramma;
 
LowPassSP lowpass;
HighPassSP highpass;
float band;

PlayPulsante playImg;
PausePulsante pauseImg;
RewindPulsante rewindImg;

void setup(){
  size(800, 500);
  smooth();
  colorMode(RGB);
  minim = new Minim(this);
  audio = minim.loadFile("CUT.mp3");
  //Creo i pulsanti
  playImg = new PlayPulsante(200, 425);
  rewindImg = new RewindPulsante(150, 425);
  pauseImg = new PausePulsante(250, 425);
  
  istogramma = new FFT(audio.bufferSize(), audio.sampleRate());   
  lowpass = new LowPassSP(15000, audio.sampleRate());
  audio.addEffect(lowpass); 
  highpass = new HighPassSP(1, audio.sampleRate());
  audio.addEffect(highpass);
}
 
void draw(){
  background(0);
  //Mostro i tasti
  rewindImg.display();      
  playImg.display();
  pauseImg.display();
  
  if ((mousePressed==true)&&(playImg.click(mouseX, mouseY)))     //Avvio la musica
    audio.play();
  if ((mousePressed==true)&&(pauseImg.click( mouseX, mouseY)))   //Metto in pausa
    audio.pause();
  if ((mousePressed==true)&&(rewindImg.click( mouseX, mouseY)) ) //Torno al principio
    audio.rewind();   
    
  fill(157,190,227); 
  text("Dall'Opera Popolare NOTRE DAME DE PARIS",480,40);
  text("Operazioni Eseguibili", 480, 80);
  fill(255);
  text("B : filtro passa-basso", 520, 110);
  text("A : filtro passa-alto", 520, 130);
  text("Clicca PLAY per l'avvio",165,485);
  
  //Barra regolazione filtri
  stroke(255);
  strokeWeight(5);
  line(620, 180,620, 450);
  fill(157,190,227);
  text("0", 635, 180);
  text("10000", 635, 460);
  noStroke();
  
  //Istogramma
  istogramma.forward(audio.mix);
  for (int i = 0; i <70; i+=2) {  //Creo barre
    band = istogramma.getBand(i);
    line(50+5*i, 400, 50+5*i, 400-4*band);  
    stroke(157,190,227);
    strokeWeight(20);
  }  
  
  float button = map(mouseY, 0, height, 180, 450);  //Imposto spostamento bottone di regolazione filtri
  float lowFreq = map(button, 180, 620, 0, 10000);  //Imposto frequenza filtro passa-basso
  float highFreq = map(button, 180, 620, 0, 10000); //Imposto frequenza filtro passa-alto
  noStroke();  //Tolgo spessore all'ellissi
  
  if (key == 'b' || key == 'B') {       //Passa-Basso
    text("PASSA-BASSO", 480,180);      
    ellipse(620,button,20,20);
    lowpass.setFreq(lowFreq);
  } 
  
  if (key == 'a' || key == 'A') {    //Passa-Alto
    text("PASSA-ALTO", 480,180);    
    ellipse(620,button,20,20);
    highpass.setFreq(highFreq);
  }  
}
  
void stop(){
  audio.close();
  minim.stop();
  super.stop();
}

