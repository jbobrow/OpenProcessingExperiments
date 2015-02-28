
import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;

color c1 = color(233,0,58);
color c2 = color(0,171,111);
color c3 = color(151,0,38);
color c4 = color(195,245,0);

Minim minim;
AudioPlayer song;
BeatDetect beat;

PFont font;

ArrayList<Bolle> recipiente1 = new ArrayList<Bolle>();
ArrayList<Bolle> recipiente2 = new ArrayList<Bolle>();
ArrayList<Bolle> recipiente3 = new ArrayList<Bolle>();
ArrayList<Bolle> recipiente4 = new ArrayList<Bolle>();

void setup(){
  size(400,400);
  minim = new Minim(this);
  song = minim.loadFile("Marry You.mp3");
  beat = new BeatDetect(song.bufferSize(), song.sampleRate());
  song.play();
}
void draw(){
  fill(0,50);
  rectMode(CORNER);
  rect(0,0,width,height);
  if(song.isPlaying()){
    fill(0);
    String s ="R -> REWIND"+"\n"+"S -> STOP"+"\n"+"Click Mouse -> Cambio Colore";
    fill(255);
    textAlign(CENTER);
    font = loadFont("JandaSillyMonkey-48.vlw");
    textFont(font,18);
    text(s,200,180);
    noStroke();
    fill(c1);
    ellipse(60,60,20,20);
    for(int i=80; i<340; i++){
      fill(color(random(255),random(255),random(255)));
      ellipse(i,60,10,10);
      fill(color(random(255),random(255),random(255)));
      ellipse(60,i,10,10);
      i = i+19;
    }
    fill(c2);
    ellipse(60,340,20,20);
    fill(c3);
    ellipse(340,340,20,20);
    for(int i=320; i>60; i--){
      fill(color(random(255),random(255),random(255)));
      ellipse(i,340,10,10);
      fill(color(random(255),random(255),random(255)));
      ellipse(340,i,10,10);
      i = i-19;
    }
    fill(c4);
    ellipse(340,60,20,20);
    fill(255);
    float[] mix = song.mix.toArray();
    beat.detect(mix);
    float a = map(intensita(mix),0,1,-3,3);
    if(beat.isRange(5,20,3)){
      for(int i=0; i<4; i++){
         Bolle b1 = new Bolle(60,60,5,c1);
         Bolle b2 = new Bolle(60,340,5,c2);
         Bolle b3 = new Bolle(340,340,5,c3);
         Bolle b4 = new Bolle(340,60,5,c4);
         recipiente1.add(b1);
         recipiente2.add(b2);
         recipiente3.add(b3);
         recipiente4.add(b4);
      }
    }
    for(int i=0; i<recipiente1.size(); i++){
      Bolle b1 = (Bolle)recipiente1.get(i);
      if(b1.attivo()){
        b1.display();
        b1.update(abs(a));
      }
      else{
        recipiente1.remove(i);
      }
    }
    for(int i=0; i<recipiente2.size(); i++){
      Bolle b2 = (Bolle)recipiente2.get(i);
      if(b2.attivo()){
        b2.display();
        b2.update(abs(a));
      }
      else{
        recipiente2.remove(i);
      }
    }
    for(int i=0; i<recipiente3.size(); i++){
      Bolle b3 = (Bolle)recipiente3.get(i);
      if(b3.attivo()){
        b3.display();
        b3.update(abs(a));
      }
      else{
        recipiente3.remove(i);
      }
    }
    for(int i=0; i<recipiente4.size(); i++){
      Bolle b4 = (Bolle)recipiente4.get(i);
      if(b4.attivo()){
        b4.display();
        b4.update(abs(a));
      }
      else{
        recipiente4.remove(i);
      }
    }
  }
  else {
    fill(0);
    rect(0,0,width, height);
    stroke(255);
    strokeWeight(2);
    fill(255);
    font = loadFont("Advert-48.vlw");
    textFont(font,20);
    text("Fine!!"+"\n"+"Marry You di Bruno Mars", 200,200);
  }
}
 float intensita(float[] buffer) {
  float massimo = 0;
  for(int i=0; i<buffer.length; i++) {
    if(abs(buffer[i])>massimo) {
      massimo = buffer[i];
    }
  }
  return massimo;
}
void cambiaColore(){
  c1= color(random(255),random(255),random(255));
  c2= color(random(255),random(255),random(255));
  c3= color(random(255),random(255),random(255));
  c4= color(random(255),random(255),random(255));
  for(int i=0; i<recipiente1.size(); i++){
    recipiente1.get(i).setColor(c1);
  }
  for(int i=0; i<recipiente2.size(); i++){
    recipiente2.get(i).setColor(c2);
  }
  for(int i=0; i<recipiente3.size(); i++){
    recipiente3.get(i).setColor(c3);
  }
  for(int i=0; i<recipiente4.size(); i++){
    recipiente4.get(i).setColor(c4);
  }
}
void mouseClicked(){ 
  cambiaColore();
}
void stop(){
  song.close();
  minim.stop();
  super.stop();
}

void keyPressed(){
  if(key == 'r' || key == 'R'){
    song.rewind();
    c1 = color(233,0,58);
    c2 = color(0,171,111);
    c3 = color(151,0,38);
    c4 = color(195,245,0);
  }
  else {
    if(key == 's' || key == 'S'){
      song.close();
      minim.stop();
    }
  }
}


