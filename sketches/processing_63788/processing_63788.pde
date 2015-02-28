
import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;

PFont font;
Minim minim;
AudioPlayer song;
Particle[] p = new Particle[100];
BeatDetect beat;
Menu menu;
//Canale alfa per la linea bianca al centro.
int intensity;

void setup() {
  size(800,400);
  smooth();
  background(30);
  
  //Font per la visualizzazione delle etichette.
  font = loadFont("LucidaConsole-12.vlw");
  textFont(font);
  
  minim = new Minim(this);
  song = minim.loadFile("song.mp3");
  menu = new Menu(song);
  beat = new BeatDetect(song.bufferSize(), song.sampleRate());
  song.play();  
  
  //Imposto un frameRate piuttosto basso per ridurre le oscillazioni
  //delle particelle.
  frameRate(15);
  
  //Inizializza le particelle.
  for(int i=0; i<p.length; i++) {
    p[i] = new Particle(map(i, 0, p.length, 0, width), height/2 - 50);
  }
}

void draw() {
  //Motion Blur
  noStroke();
  fill(30,175);
  rectMode(CORNER);
  rect(0,0,width,height - 30);
  
  //Visualizza il menù e passa le coordinate del mouse
  //per i filtri.
  menu.display();
  menu.setFrequency(mouseX);
  
  float[] mix = song.mix.toArray();
  beat.detect(mix);
  
  //Se viene registrato un beat, variano l'intensità e lo spessore
  //della linea bianca al centro dello schermo.
  if(beat.isRange(0,25,2)) {
    intensity = 250;
    strokeWeight(2.5);
  } else {
    intensity = 100;
    strokeWeight(1);
  }
  stroke(255,intensity);
  line(0, height/2 - 50, width, height/2 - 50);
  
  //Disegna le particelle.
  for(int i=0; i<p.length; i++) {
    int pos = int(map(i, 0, p.length, 0, song.bufferSize()));
    p[i].update(mix[pos] * 200);
    p[i].display();
  }
  
  //Disegna l'indicatore di avanzamento del brano.
  fill(30);
  rectMode(CORNER);
  stroke(255,120);
  strokeWeight(1);
  rect(0, height-30, width, 30);
  float progress = (float)song.position() / song.length();
  fill(255);
  String s = (int(progress*100)) + "%";
  text(s,width/2 - 8, height - 5);
  strokeWeight(5);
  stroke(255);
  line(0, height-22, progress*width, height-22);
}

void stop() {
  minim.stop();
  super.stop();
}

//Quando il mouse viene premuto, invia le coordinate
//al menù per l'eventuale attivazione dei controlli.
void mousePressed() {
  menu.pressed(mouseX,mouseY);
}
//Coordinate per il controllo del volume.
void mouseDragged() {
  menu.dragging(mouseX);
}
//Blocco del volume quando il mouse viene rilasciato.
void mouseReleased() {
  menu.blockVolume();
}

