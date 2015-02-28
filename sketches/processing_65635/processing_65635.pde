
import ddf.minim.*;
import ddf.minim.analysis.*;


Minim minim;
AudioPlayer song;
FFT fft;

AudioMetaData metadata; //metadati
int minuti;
int secondi;

PlayButton playB; // bottoni 
PauseButton pauseB;
RewindButton rewindB;

PFont carattereArtistaTitoloDurata;//font per il carattere

void setup()
{
  size(900, 500, P3D);
  textMode(SCREEN);
  minim = new Minim(this);
  song = minim.loadFile("Avicii - Levels.mp3", 1024); //caricamento file sonoro
  song.loop();
  fft=new FFT(song.bufferSize(), song.sampleRate());
  fft.linAverages(20);
  playB = new PlayButton(600, 450); //posizionamento bottone play    
  pauseB = new PauseButton(710, 450); //posizionamento bottone pause
  rewindB = new RewindButton(810, 450);//posizionamento bottone rewind
  colorMode(HSB, 100);
  metadata=song.getMetaData(); 
  secondi=metadata.length()/1000;
  minuti=secondi/60;
  secondi=secondi % 60;
}

void draw() {
  background(255);
  stroke(0);
  fill(255);
  fft.forward(song.mix);
  int x = int((width)/fft.avgSize());
  for (int i = 0; i < fft.avgSize(); i++) {
    for (int j=0; j<fft.avgSize(); j++) {
      fill( map( i, 0, fft.avgSize(), 0, 100), mouseX/6, mouseY*0.6);
      rectMode(CENTER);
      strokeWeight(1);
      // figura
      rect(i*x+35, 30, 35+fft.getAvg(i), 35+fft.getAvg(i)); // posizione in alto

      rect(i*x+35, 200, 35+fft.getAvg(i), 35+fft.getAvg(i)); //posizione in centro
      rect(i*x+35, 200+60, 35+fft.getAvg(i), 35+fft.getAvg(i));

      rect(i*x+35, 410, 35+fft.getAvg(i), 35+fft.getAvg(i)); // posizione in basso
    }
  } // font e metadati
  carattereArtistaTitoloDurata= loadFont("LucidaSansUnicode-14.vlw");
  textFont(carattereArtistaTitoloDurata);
  text("Artista: "+metadata.author(), 5, height-24); // metadati del file sonoro e loro posizinamento
  carattereArtistaTitoloDurata= loadFont("LucidaSansUnicode-14.vlw");
  textFont(carattereArtistaTitoloDurata);
  text("Titolo: " +metadata.title(), 5, height-10);
  carattereArtistaTitoloDurata= loadFont("LucidaSansUnicode-14.vlw");
  textFont(carattereArtistaTitoloDurata);
  secondi=(song.length()-song.position())/1000;
  minuti=secondi/60;
  secondi=secondi%60;
  if (secondi <10) {
    text("Durata: "+minuti+":0"+secondi, 400, height-24);
  }
  else {
    text("Durata: "+minuti+ ":" +secondi, 400, height-24);
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


