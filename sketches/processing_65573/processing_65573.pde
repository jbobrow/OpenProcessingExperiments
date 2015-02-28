
/* ---

  In questa animazione viene tracciato uno speaker i cui driver si muovono
  seguendo il beat della traccia audio.
  Le info della traccia vengono visualizzate in un apposito box.
  Viene presentata anche l'immagine di copertina opportunamente scalata.
  La componente casuale dell'animazione genera delle particelle con diverse
  proprietà specifiche.
  
  L'utente può intervenire sul livello di saturazione delle particelle
  muovendo il puntatore lungo l'asse delle ascisse (x), oppure modificare
  la tinta (hue) muovendo il puntatore lungo l'asse delle ordinate (y).

  --- */

import ddf.minim.*;
import ddf.minim.analysis.*;

Minim minim;
AudioPlayer song;
BeatDetect beat;
AudioMetaData meta;
Speaker cassa;
PImage img;

Particle[] particleVector = new Particle[0];
final int MAX_PARTICLES = 250;

// --- Metodo setup ---
void setup() {
  size(700, 700);
  smooth();

  cassa = new Speaker(); //
  minim = new Minim(this);
  song = minim.loadFile("Katy Perry - Part Of Me.mp3");
  song.play();
  meta = song.getMetaData();
  beat = new BeatDetect(song.bufferSize(), song.sampleRate());
  beat.setSensitivity(10);
  colorMode(HSB, 360, 100, 100);
  
  img = loadImage("Katy Perry - Part Of Me.jpg");
}

// --- Metodo draw ---
void draw() { 
  beat.detect(song.mix);
  //Effetto "Motion Blur"
  fill(180, 110);
  rect(0, 0, width, height);

  //Rileva il tipo di beat (Kick, Snare, Hat)
  if (beat.isKick()) {
    cassa.setDimKick(cassa.getMaxKick());
  }
  if (beat.isSnare()) {
    cassa.setDimSnare(cassa.getMaxSnare());
  }
  if (beat.isHat()) {
    cassa.setDimHat(cassa.getMaxHat());
  }

  //Inizia a creare le particelle
  if (particleVector.length<MAX_PARTICLES) {
    Particle anotherParticle = new Particle();
    particleVector = (Particle[]) append(particleVector, anotherParticle);
  }

  //Traccia le particelle e aggiorna la loro posizione; le riposiziona quando escono dalla finestra
  for (int i=0; i<particleVector.length; i++) {
    particleVector[i].display();
    particleVector[i].update();
    
    if (!particleVector[i].checkPosition()) {
      particleVector[i].rebirth();
    }
    //Aggiorna Hue e Saturation in base alla posizione del puntatore del mouse all'interno della finestra
    particleVector[i].setHue( (int)map(mouseY, 0, width, 0, 360) );
    particleVector[i].setSaturation( (int)map(mouseX, 0, height, 0, 100) );
  }

  //Disegna lo speaker
  cassa.displaySpeaker();
  cassa.displayKick();
  cassa.displaySnare();
  cassa.displayHat();

  cassa.setDimKick(constrain(cassa.getDimKick() * 0.95, cassa.getMinKick(), cassa.getMaxKick()));
  cassa.setDimSnare(constrain(cassa.getDimSnare() * 0.96, cassa.getMinSnare(), cassa.getMaxSnare()));
  cassa.setDimHat(constrain(cassa.getDimHat() * 0.96, cassa.getMinHat(), cassa.getMaxHat()));

  //Maschera per box titolo
  fill(220, 200);
  stroke(240);
  rect(width/2-92, 10, 284, 115);
  
  //Info riguardanti la traccia
  fill(0);
  text("Track Name: "+ meta.fileName(), width/2-78, 40);
  text("Author: "+ meta.author(), width/2-78, 70);
  int minuti = meta.length()/ 60000; //length in min
  int secondi = meta.length() % 60000 / 1000; //seconds
  text("Length: "+minuti+ ":"+ secondi, width/2-78, 100);
  
  //Scalatura e posizionamento immagine di copertina
  pushMatrix();
  scale(0.3);
  image(img, width/2-68, 30);
  popMatrix();
}

//Terminating audio's thread
void stop() {
  song.close();
  minim.stop();
  super.stop();
}

