
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;

Minim minim;
AudioPlayer song;
FFT fft;

AudioMetaData metadata; // metadati
int minuti;
int secondi;

PlayButton playB; //bottoni
PauseButton pauseB;
RewindButton rewindB;

LowPassSP lowpass; //filtri
HighPassSP highpass;

float band;

PFont carattereArtistaTitoloDurataBottoni; // font per il carattere del testo

void setup()
{
  size(1000, 600);
  smooth(); 
  
  minim = new Minim(this);
  song = minim.loadFile("Avicii - Levels.mp3", 1024); //caricamento frammento sononoro
  song.loop();
  metadata=song.getMetaData(); // metadati del frammento
  secondi=metadata.length()/1000;
  minuti=secondi/60;
  secondi=secondi % 60;  
  playB=new PlayButton(850,555); // bottoni e loro posizione
  pauseB= new PauseButton(900,555);  
  rewindB= new RewindButton(950,555);
  fft = new FFT(song.bufferSize(), song.sampleRate());    
  lowpass = new LowPassSP(10000, song.sampleRate()); //filtro passa basso
  song.addEffect(lowpass);  
  highpass = new HighPassSP(1, song.sampleRate()); //filtro passa alto
  song.addEffect(highpass);
  }


void draw()
{
  background(255);
  noStroke();
  fill(0);
  carattereArtistaTitoloDurataBottoni= loadFont("LucidaSansUnicode-14.vlw");
  textFont(carattereArtistaTitoloDurataBottoni);
  text("Artista: " + metadata.author(), 10, height-20); // posizionamento dei metadati del frammaento sonoro
  text("Titolo: " + metadata.title(), 250, height-20);
  secondi=(song.length()-song.position())/1000;
  minuti=secondi/60;
  secondi=secondi % 60;
  if (secondi <10) {
    text("Durata"+minuti+":0"+secondi,490, height-20);
  }
  else {
    text("Durata:"+minuti+ ":" +secondi, 490, height-20);
  }
  
  if (key != 'b' && key != 'B')  // scrittura istruzioni per attivare i filtri 
  { 
    fill(0, 138,255);
    text("Premi B per attivare il filto passa basso", 725, 50); //posizionamento istruzione filtro passa basso
  }      
  if (key != 'a' && key !='A')
  { 
    fill(53,249,0);
   text("Premi A per attivare il filtro passa alto", 10, 50); //posizionamento istruzione filtro passa alto
  }   
    fill(228,0,249);
  if (key == 'b' || key == 'B') //funzionamento del filtro passa basso
  {
    stroke(0);
    line(100, height/5+400, 725, height/5+400); 
    fill(0,138,255);
    text("0", 100,  height/5+420);
    text("1000", 700, height/5+420);
    text("Filto passa basso", 362.5,height-55);
    float g = map(mouseX, 0, width, 100, 725); 
    float lowFreq = map(g, 100, 726, 0, 1000);  
    line(g, 7*height/8-9, g, 7*height/8+9); 
    lowpass.setFreq(lowFreq);
    println("Freq: " + lowFreq);
  } 
  if (key == 'a' || key == 'A') // funzionamento del filtro passa alto
  {
    stroke(0);
    line(100, height/5+400, 725, height/5+400);
    fill(53,249,0);
    text("0", 100, height/5+420);
    text("1000", 700, height/5+420);
    text("Filto passa alto",362.5, height-55);
    float g= map(mouseX, 0, width, 100, 725);
    float highFreq = map(g, 113, 726, 0, 1000);    
    line(g, 7*height/8-9, g, 7*height/8+9); 
    highpass.setFreq(highFreq);
    println("Freq: " + highFreq);
  }   
 
  fft.forward(song.mix);
  for (int i = 0; i < 120; i+=2) // serie di istruzioni per la visualizzazione delle bande 
  {
    band = fft.getBand(i);
    if (key != 'b' && key != 'B' && key != 'a' && key != 'A')
      stroke(0,0, 0);
    if (key == 'b' || key == 'B')
      stroke(0, 106, 251);
    if (key == 'a' || key == 'A')
      stroke(53,249,0);
    strokeWeight(9);
    line(width/8 + 5*i, 3*height/4, width/8 + 5*i, 3*height/4-4*band);   
    if (key != 'b' && key != 'B' && key != 'a' && key != 'A');
    {
      stroke(77,255,245);
      line(width/8 + 5*i, 3*height/4, width/8 + 5*i - 1*band, 3*height/4 + 1*band);
      if (key == 'b' || key =='B')
        stroke(0,106,251);
      if (key == 'a' || key == 'A') 
       stroke(255,190,77);
      strokeWeight(1);
    }
  }
  playB.display();
  pauseB.display();
  rewindB.display();
}

void mousePressed()  //funzionamento dei bottoni
{
  if (playB.isClicked( mouseX, mouseY))
    song.play();
  if (pauseB.isClicked( mouseX, mouseY))
    song.pause();
  if (rewindB.isClicked( mouseX, mouseY))
    song.rewind();
}
void stop()
{
  song.close();
  minim.stop();
  super.stop();
}


