
import ddf.minim.*;
import ddf.minim.analysis.*;

//Dichiarazione oggetti e variabili
Minim minim;
AudioPlayer song;
BeatDetect beat;
AudioMetaData data;
Box box1,box2,box3;
boolean box = false;

void setup() {
  //Inizializzazione della finestra e degli oggetti
  size(600, 600);
  stroke(255);
  minim = new Minim(this);
  song = minim.loadFile("followrivers.mp3"); 
  song.play();
  data = song.getMetaData();   
  beat = new BeatDetect(song.bufferSize(), song.sampleRate());
  box1 = new Box(30);
  box2 = new Box(30);
  box3 = new Box(30);
}

void draw() {
  background(0);
  fill(255);
  
  //Dati brano musicale
  text("Song: " + data.title(), 10, 20);
  text("Author: " + data.author(), 10, 40);
  float length = data.length() / 60000;
  text("Length: " + length + " minutes", 10, 60);
  
  rectMode(CENTER);
  beat.detect(song.mix);
  //Disegno i quadrati e assegno loro il colore in base alla poszione del mouse
  fill(255, map(mouseX, 0, width, 0, 255), map(mouseY, 0, height, 0, 255));
  rect(width/2, (height/2)-100, 100, 100, 7,7,7,7);
  //Cambio la grandezza del quadrato in base alla banda di frequenza dove è stato rilevato il beat
  if ((beat.isOnset(1))) {
    rect(width/2, (height/2)-100, 200, 200, 7,7,7,7);
  }

  fill(map(mouseX, 0, width, 0, 255), 255, map(mouseX, 0, width, 0, 255));
  rect((width/2)-100, (height/2)+100, 100, 100, 7,7,7,7);
  if ((beat.isOnset(7))) {
    rect((width/2)-100, (height/2)+100, 200, 200, 7,7,7,7);
  }

  fill(map(mouseX, 0, width, 0, 255), map(mouseY, 0, height, 0, 255), 255);
  rect((width/2)+100, (height/2)+100, 100, 100, 7,7,7,7);
  if ((beat.isOnset(15))) {
    rect((width/2)+100, (height/2)+100, 200, 200, 7,7,7,7);
  }
  
  if(box){
      box1.move();
      box1.display();
      box2.move();
      box2.display();
      box3.move();
      box3.display();
    }
}

void mousePressed(){
  box = !box;
}

void stop() {
  song.close();
  minim.stop();
  super.stop();
}


