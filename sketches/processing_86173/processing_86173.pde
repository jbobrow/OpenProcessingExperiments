
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;

Minim minim;
AudioPlayer song;
BeatDetect beat;
BeatListener bl;
boolean pause=false;

PlayButton playB;
PauseButton pauseB;
RewindButton rewindB;

//PER SLIDER FILTRI
LowPassSP lowpass;
HighPassSP highpass;
boolean premuto=false;
float posXrect, posYrect;

String stringaAzione="No action.";

char charColore;
ArrayList<Drop> dropsR;
ArrayList<Drop> dropsG;
ArrayList<Drop> dropsB;

float kickSize, snareSize, hatSize;

PFont f;
 
void setup() {
  size(600, 500); 
  
  minim = new Minim(this);
  song = minim.loadFile("Adebisi_Shank.mp3", 1024);
  
  lowpass = new LowPassSP(200, 44100);
  highpass= new HighPassSP(200, 44100);
  
  highpass.setFreq(0);
  lowpass.setFreq(10000);
  song.addEffect(lowpass);
  song.addEffect(highpass);
  
  playB = new PlayButton((width/2)- 55, height-40);
  pauseB = new PauseButton((width/2) - 15, height-40);
  rewindB = new RewindButton((width/2) +25, height-40);
  beat = new BeatDetect(song.bufferSize(), song.sampleRate());
  beat.setSensitivity(300);
  bl = new BeatListener(beat, song);
  
  posYrect= height/2;
  kickSize = snareSize = hatSize = 16;
  
  f = createFont("Helvetica", 16, true);
  
  dropsR= new ArrayList<Drop>();
  dropsG= new ArrayList<Drop>();
  dropsB= new ArrayList<Drop>();
}


void draw() {     
  background(0);
  
  if (!pause) {
    stringaAzione="Play Button pressed.";
    
    //RILEVAMENTO KICK, SNARE E HAT
    if(beat.isKick()){
      kickSize = 32;            //modifica size kick
      int i= dropsR.size()+1;  //il nr di bolle di questo colore diventa l'ampiezza della goccia che vado a creare
      Drop d= new Drop('r',i);
      dropsR.add(d);
    }
    if(beat.isSnare()){
      snareSize = 32;
      int i= dropsG.size()+1;
      Drop d= new Drop('g',i);
      dropsG.add(d);
    }
    if(beat.isHat()){
      hatSize = 32;
      int i= dropsB.size()+1;
      Drop d= new Drop('b',i);
      dropsB.add(d);
    }
    
    //MOVIMENTO GOCCE
    for(int k=0; k<dropsR.size(); k++){
      Drop dk= (Drop) dropsR.get(k);
      dk.move();
    }
    for(int k=0; k<dropsG.size(); k++){
      Drop dk= (Drop) dropsG.get(k);
      dk.move();
    }
    for(int k=0; k<dropsB.size(); k++){
      Drop dk= (Drop) dropsB.get(k);
      dk.move();
    }
    
  }
   //VISUALIZZAZIONE GOCCE
   for(int k=0; k<dropsB.size(); k++){
    Drop dk= (Drop) dropsB.get(k);
    dk.display();
    if(dk.finished()){
      dropsB.remove(dk);
    }
  }
  for(int k=0; k<dropsR.size(); k++){
    Drop dk= (Drop) dropsR.get(k);
    dk.display();
    if(dk.finished()){
      dropsR.remove(dk);
    }
  }
  for(int k=0; k<dropsG.size(); k++){
    Drop dk= (Drop) dropsG.get(k);
    dk.display();
    if(dk.finished()){
      dropsG.remove(dk);
    }
  }
  
  
  
  //VISUALIZZAZIONE BOTTONI
  strokeWeight(1);
  stroke(255);
  fill(0);
  playB.display();
  pauseB.display();
  rewindB.display();
  
  //VISUALIZZAZIONE STRINGA AZIONE CORRENTE
  textFont(f, 19);
  fill(255);
  text(stringaAzione, 10, height-20);
  
  //VISUALIZZAZIONE STRINGHE KICK, SNARE E HAT
  fill(255,0,0);
  textSize(kickSize);
  text("KICK", 10, 100);
  fill(0,255,0);
  textSize(snareSize);
  text("SNARE", 10, 200);
  fill(0,0,255);
  textSize(hatSize);
  text("HAT", 10, 300);
  
  //MODIFICA GRANDEZZA FONT SCRITTE KICK SNARE E HAT
  kickSize = constrain(kickSize * 0.95, 16, 32);
  snareSize = constrain(snareSize * 0.95, 16, 32);
  hatSize = constrain(hatSize * 0.95, 16, 32);
  
  //SCRITTE FILTRI E SLIDER LATERALE
  rectMode(CORNER);
  textFont(f, 19);
  fill(220);
  text("Low pass filter",450,20);
  rect(width-20,0,20,height/2);
  fill(160);  
  text("High pass filter",450,height-10);
  rect(width-20,height/2,20,height);
  rectMode(CENTER);
  fill(100);
  rect(width-10, posYrect,20,20);
}


void mousePressed() {
  if((width-mouseX)<20&&abs(mouseY-posYrect)<10){
    premuto=true;
  }
  if (playB.isClicked( mouseX, mouseY)) {
    song.play();
    pause=false;
    
  }
  if (pauseB.isClicked( mouseX, mouseY)) {
    song.pause();
    pause = true;
    stringaAzione="Pause Button pressed.";
  }
  if (rewindB.isClicked( mouseX, mouseY)){
    song.rewind();
    dropsR= new ArrayList<Drop>();
    dropsG= new ArrayList<Drop>();
    dropsB= new ArrayList<Drop>();
    stringaAzione="Rewind Button pressed.";
        
    draw(); 
  }   
}
 
void mouseDragged(){
  if(premuto){
    posYrect=mouseY;
    if(mouseY<height/2){
      lowpass.setFreq( map(mouseY, 0, height/2, 0, 10000));
      highpass.setFreq(0);
    }else{
      highpass.setFreq(map(mouseY, height/2 , height,0,10000));
      lowpass.setFreq(10000);
    }
  }
}
void mouseReleased(){
  premuto=false;
}

void stop() {
  song.close();
  minim.stop();
  super.stop();
}

