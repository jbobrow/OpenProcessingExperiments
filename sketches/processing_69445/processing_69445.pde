
import ddf.minim.analysis.*;
import ddf.minim.*;
 
Minim minim;
AudioPlayer song;
BeatDetect beat;
AscoltatoreBeat AB;

Quadrato q1 = new Quadrato(0,0,50); 
Quadrato q2 = new Quadrato(0,0,50); 
Quadrato q3 = new Quadrato(0,0,50); 
Quadrato q4 = new Quadrato(0,0,50); 

float r1,r2,r3,r4 ;
int colore;
boolean muovi=false;
 
void setup(){
  size(700,400);
  smooth();
  background(0);
  minim = new Minim(this);
  song = minim.loadFile("Can_t_Say_No-Conor_Maynard.mp3", 512);
  song.play();
  beat = new BeatDetect(song.bufferSize(), song.sampleRate());
  beat.setSensitivity(1);
  AB = new AscoltatoreBeat(beat, song);
  colorMode(HSB, 360, 100, 100);
 
}
 
void draw(){
 fill(0, 10);
 stroke(0);
 rect(0, 0, width, height);
 colore =(int) map(mouseX, 0, width, 0, 360);  
 
    pushMatrix();
    translate(100,150);
    if (muovi) {
      if (mouseX>width/2){
      r1 +=2;}
      else{
      r1 -=2;
      }
      rotate(radians(r1));
      q1.visualizza();
      q1.setColore(colore);
    }
   else {
   r1 +=0;
      rotate(radians(r1));
      q1.visualizza();
      q1.setColore(colore);
   }
    if(beat.isKick()){
    q1.allarga(80);
  }else{
    q1.stringi(80);
  }
    popMatrix();
   
    
    pushMatrix();
    translate(250,150);
    if (muovi) {
      if (mouseX>width/2){
      r2 -=1;}
      else{
     r2 +=1;
      }
      rotate(radians(r2));
      q2.visualizza();
      q2.setColore(colore);
    }
   else {
   r2+=0;
      rotate(radians(r2));
      q2.visualizza();
      q2.setColore(colore);
   }
    if(beat.isSnare()){
    q2.allarga(50);
  }else{
    q2.stringi(50);
  }
    popMatrix();
    
   pushMatrix();
   translate(400,150);
   if (muovi) {
      if (mouseX>width/2){
      r3 +=1;}
      else{
      r3 -=1;
      }
      rotate(radians(r3));
      q3.visualizza();
      q3.setColore(colore);
    }
   else {
   r3 +=0;
      rotate(radians(r3));
      q3.visualizza();
      q3.setColore(colore);
   }
    if(beat.isHat()){
    q3.allarga(50);
  }else{
    q3.stringi(50);
  }
    popMatrix();
 
  pushMatrix();
    translate(550,150);
    if (muovi) {
      if (mouseX>width/2){
      r4 -=2;}
      else{
     r4 +=2;
      }
      rotate(radians(r4));
      q4.visualizza();
      q4.setColore(colore);
    }
   else {
  r4 +=0;
      rotate(radians(r4));
      q4.visualizza();
      q4.setColore(colore);
   }
    if(beat.isKick()){
    q4.allarga(80);
  }else{
    q4.stringi(80);
  }
    popMatrix();
  
  fill(250);
  textSize(13);
  text("Autore: Pecile Francesco ",10,370);
  text("Brano: Can't say no - Conor Maynard",10,380);
  text("Durata: 3.15",10,390); 
}
 
 
 void mousePressed () {
   muovi=!muovi;
 }
  
 
void stop(){
  song.close();
  minim.stop();
  super.stop();
}

