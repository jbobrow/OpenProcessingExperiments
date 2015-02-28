
/* 
 * Animazione 1
 * Autore: Ivo Mazzieri Sankovic
 * Audio: Eduard Khil - Trololo ("I Am Glad, 'Cause I'm Finally Returning Back Home")
*/

import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;

// oggetti usati
Minim minim;
AudioPlayer player;
BeatDetect beat;
BeatShape kick, snare, hat;
Particle[] p;

// variabili
float[] mix;
color c1, c2, c3;
int mX, mY, currentParticle;

void setup() {
  
  size(600,600);
  
  noStroke();

  // modifica il range del colore per adattarlo alle posizioni del mouse
  colorMode(HSB, 360);  
  
  rectMode(CENTER);
  
  minim = new Minim(this);  
  player = minim.loadFile("Trololo.mp3");  
  
  // inizializza indicatori dei beat
  kick = new BeatShape(width/2, height * 4/5);
  snare = new BeatShape(width*1/4, height/2);
  hat = new BeatShape(width*3/4, height * 1/5);
  
  // numero di particelle usate
  p = new Particle[300];  
  
  // calcola i beat in base alla frequenza
  beat = new BeatDetect(player.bufferSize(), player.sampleRate());
  beat.setSensitivity(100); // default 10
  
  player.loop();
  player.play();
  
}

void draw() {  
  
  colorMode(RGB, 255);
      
  background(0); 
  
  colorMode(HSB, 360);
  
  mX = (int) map(mouseX, 0, width, 0, 360);
  
  // gestione del colore
  c1 = color(mX, 360, 360);
  c2 = color(computeColor(mX + 120), 360, 360);
  c3 = color(computeColor(mX + 240), 360, 360);
  
  kick.setColor(c1);
  snare.setColor(c2);
  hat.setColor(c3);    
  
  beat.detect(player.mix);
  
  if ( beat.isKick() )
    kick.hit();
  else
    kick.release();
  if ( beat.isSnare() ) 
    snare.hit();
  else
    snare.release();
  if ( beat.isHat() )
    hat.hit();
  else
    hat.release();
    
  kick.display();
  snare.display();
  hat.display();
  
  // etichette per gli indicatori dei beat
  fill(360,0,360);
  textSize(18);
  text("KICK", width/2 - 20, height * 4/5 + 30);
  text("SNARE", width*1/4 - 25, height/2 + 30);
  text("HAT", width*3/4 -  15, height * 1/5 + 30);   
    
  mix = player.mix.toArray();
  
  // calcolo dell'intensita del suono
  
  float intensita;
  float temp = 0;
  
  for (int i=0; i < (mix.length - 1); i++ ) {
    temp = temp + sq(mix[i]);
  }
  
  intensita = temp / mix.length;
  
  // crea nuove particelle corrispondenti all'intensità

  for (int k=0; k<intensita*100; k++) {
    if (currentParticle >= p.length)
      currentParticle = 0;
    p[currentParticle] = new Particle(width/2, height/2, random(4) - 2, random(4) - 2);
    currentParticle++;
  }
  
  currentParticle = currentParticle + (int)intensita;
  
  // disegna tutte le particelle che sono 'vive'
  
  mY = (int) map(mouseY, 0, height, 0, 360);
  fill (mY, 360, 360);
  
  for (int j=0; j < p.length; j++) {
    if (p[j] != null) {
       p[j].update();
       p[j].display();
     }    
  }

}

// tratta lo spazio dei colori come una struttura ad anello (circolare)
int computeColor (int c) {
  
  if (c > 360)
    return (c - 360);
  else
    return c;
 
}  

// controllo della riproduzione del file tramite tastiera
void keyPressed() {
  
  if (key == ' ') {  // spazio
    
    if (player.isPlaying())
      player.pause();
    else  
      player.play();
    
  } else if (key == BACKSPACE) {
    player.rewind();
  }
}

void stop() {
  
  player.close();
  minim.stop();
  super.stop();
  
}

