
import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;

Minim minim;
AudioPlayer song;
BeatDetect beat;
Particle particles[] = new Particle[0];
AudioMetaData metadata;
boolean modeMouse;
int minuti;
int secondi;
void setup() {
  size(512, 400);
  minim = new Minim(this);
  smooth();
  song = minim.loadFile("04 - Epic Soul Factory - POLTERGEIST ATTACK.mp3", 1024);
  beat = new BeatDetect(song.bufferSize(), song.sampleRate());
  beat.setSensitivity(50); 
  noStroke();
  song.play();
  metadata= song.getMetaData();
  secondi = metadata.length()/1000;
  minuti = secondi / 60;
  secondi = secondi % 60;
  modeMouse = true;
}

void draw() {
  beat.detect(song.mix);
  fill( 0, 45 );
  rect(0, 0, width, height);
  fill(0);
  rect(0, 0, width, 24);
  fill(255);
  text("Author: " + metadata.author(), 5, height-24);
  text("Title: " + metadata.title(), 5, height-12);
  secondi = (song.length()-song.position())/1000;
  minuti = secondi / 60;
  secondi = secondi % 60; 
  if (secondi < 10) {
    text("Time: " + minuti + ":0" + secondi, 400, height-24 );
  } 
  else {
    text("Time: " + minuti + ":" + secondi, 400, height-24 );
  }
  if(modeMouse){
      text(" Mouse ON ", 5, 24 );
  } else {
      text(" Mouse OFF ", 5, 24 );
  }
  if (beat.isRange(5, 20, 2)) {
    colorMode(HSB);
    color col = color(random(255), random(255), random(255));
    float radius = random(1,5);
    float vx =  random(-2, 2);
    float vy = random(-4, 2);
    for ( int j = 0; j < abs(song.mix.level() * 50); j++ ) {
      Particle p =new Particle(int(random(0, width)), int(random(24, height-24)),vx, vy, radius, col);
      particles = (Particle[])append(particles, p);
    }
  }
  for (int i = 0; i < particles.length ; i++) {
    particles[i].update();
    if (particles[i].active) {
      particles[i].display();
    }
  }
}

void keyPressed(){
  key = Character.toUpperCase(key);
  if(key == 'M'){
    modeMouse = !modeMouse;
  }
  /* Salvo l'immagine del frame corrente per inserirla nell'animazione */
  if (key == 'S') {
    save("frame" + frameCount + ".png");
  }
}
void stop() {
  song.close();
  minim.stop();
  super.stop();
}


