
import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;

Play play;
PFont font;
//Valori booleani di supporto. Stabiliscono se l'animazione è iniziata o meno.
boolean start = false;
boolean part = false;
//Colori di sfondo (bg) e delle particelle (cPart).
color bg = 70;
color cPart = color(100,250,200);
Minim minim;
AudioPlayer song;
BeatDetect beat;
//Contenitori per le particelle colorate e bianche.
ArrayList<Particle> p = new ArrayList<Particle>();
WhiteParticle[] whiteP = new WhiteParticle[50];

void setup() {
  size(500,500);
  smooth();
  noStroke();
  font = loadFont("Verdana-11.vlw");
  play = new Play(width/2,height/2);
  minim = new Minim(this);
  song = minim.loadFile("song.mp3");
  beat = new BeatDetect(song.bufferSize(), song.sampleRate());
  //Inizializzazione delle particelle bianche, a numero fisso.
  for(int i=0; i<whiteP.length; i++) {
    whiteP[i] = new WhiteParticle(random(width),random(height),2);
  }
}

void draw() {
  rectMode(CORNER);
  noStroke();
  fill(bg,50);
  rect(0,0,width,height);
  
  if(!start) { // Prima schermata con pulsante Play.
    
    play.display();
    text("Press 'C' to Change Particle Color",width/2 - 95, height/2 + 100);
    
  } else { // L'animazione è partita.
     
     //Cambio il colore di sfondo.
     bg = 30;
     
     if(song.isPlaying()) {
       
       float[] mix = song.mix.toArray();
       beat.detect(mix);
       
       //Calcolo il max nell'array mix, e lo trasformo in
       //un valore [-3, 3].
       float a = map(intensity(mix),0,1,-3,3);
       
       //Se si registra un beat, creo delle nuove particelle colorate.
       if(beat.isRange(5,20,3)) { 
           for(int i=0; i<2; i++) {
             Particle part = new Particle(width/2,height/2,10,cPart);
             p.add(part); 
           }        
       }
       //Disegno ed aggiorno la posizione delle particelle bianche.
       for(int i=0; i<whiteP.length; i++) {
         whiteP[i].display();
         whiteP[i].update();
       }
       //Disegno le particelle colorate se sono ancora "vive",
       //altrimenti le cancello dall'ArrayList.       
       for(int i=0; i<p.size(); i++) {
         Particle part = (Particle)p.get(i);
         if(part.isAlive) {
           part.display();            
           part.update(abs(a)); //La loro accelerazione varia in base al max nel buffer mix.  
         } else {
           p.remove(i);
         }       
       }
       
       //Disegno l'indicatore di avanzamento della canzone.
       fill(bg);
       stroke(255,120);
       strokeWeight(1);
       rect(0, height-30, width, 30);       
       float progress = (float)song.position() / song.length();
       fill(255);
       String s = (int(progress*100)) + "%";
       text(s,width/2 - 8, height - 16);
       strokeWeight(5);
       stroke(255);
       line(0, height-10, progress*width, height-10);
       
     } else {  //Se la canzone è terminata
       //non disegno più le particelle bianche
       for(int i=0; i<whiteP.length; i++) {
          whiteP[i].finalize();
       }
       //e visualizzo nuovamente il pulsante Play.
       start = false;
       part = false;
       song.rewind();
       bg = 70;
     }
  }
}

void mouseClicked() {
  //Prima schermata: fa partire la canzone quando
  //si clicca il pulsante Play.
  if(play.contains(mouseX,mouseY)) {
    start = true;
    song.play();
    for(int i=0; i<whiteP.length; i++) {
        whiteP[i].restart();
    }
  }
  //Se l'animazione è iniziata, va gestito l'evento sulle particelle bianche.
  if(part) {
    for(int i=0; i<whiteP.length; i++) {
        whiteP[i].setClicked(!whiteP[i].getClicked());
    }
  }
  part = true;
}

void stop() {
  song.close();
  minim.stop();
  super.stop();
}

//Calcolo del max valore assoluto nel buffer.
float intensity(float[] buffer) {
  float maxValue = 0;
  for(int i=0; i<buffer.length; i++) {
    if(abs(buffer[i])>maxValue) {
      maxValue = buffer[i];
    }
  }
  return maxValue;
}

//Cambia il colore delle particelle.
void changeColor() {
  cPart = color(random(255),random(255),random(255));
    for(int i=0; i<p.size(); i++) {
        p.get(i).setColor(cPart);
    }
}

//Premendo il tasto 'C', il colore delle particelle cambia.
void keyPressed() {
  if(key == 'c' || key == 'C') {
    changeColor();
  }
}
    
    

