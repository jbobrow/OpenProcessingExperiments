
Temps cronometre;
PImage f1, f2, f3, f4, f5, f6, f7, f8, f9, f10, f11, f12, f13, f14, f15, f16, f17, f18, f19, f20, f21, f22, f23, f24;
import ddf.minim.*;
AudioPlayer main, bauer1, bauer2, bauer3, bauer4;
Minim rep;

void setup(){
  size(800,800);
  rep = new Minim(this);
  main = rep.loadFile("main_sound.mp3");
  bauer1 = rep.loadFile("b1.mp3");
  bauer2 = rep.loadFile("b2.mp3");
  bauer3 = rep.loadFile("b3.mp3");
  bauer4 = rep.loadFile("b4.mp3");
  f1 = loadImage("1.jpg");
  f2 = loadImage("2.jpg");
  f3 = loadImage("3.jpg");
  f4 = loadImage("4.jpg");
  f5 = loadImage("5.jpg");
  f6 = loadImage("6.jpg");
  f7 = loadImage("7.png");
  f8 = loadImage("8.jpg");
  f9 = loadImage("9.jpg");
  f10 = loadImage("10.jpg");
  f11 = loadImage("11.jpg");
  f12 = loadImage("12.jpg");
  f13 = loadImage("13.jpg");
  f14 = loadImage("14.jpg");
  f15 = loadImage("15.jpg");
  f16 = loadImage("16.jpg");
  f17 = loadImage("17.jpg");
  f18 = loadImage("18.jpg");
  f19 = loadImage("19.jpg");
  f20 = loadImage("20.jpg");
  f21 = loadImage("21.jpg");
  f22 = loadImage("22.jpg");
  f23 = loadImage("23.jpg");
  f24 = loadImage("24.jpg");
  cronometre = new Temps();
  background(255);
}

void draw(){
  if(cronometre.cd24s() > 1){
  main.play();
  }else if(cronometre.cd24s() < 1){
  main.pause();
  }
  cronometre.cd24();
  if(keyPressed){
    if(key == 'r'){
      cronometre.rest(25);
      main.rewind();
    }
  }
}

void mousePressed(){
  if(cronometre.cd24s() > 1){
  cronometre.voices();
  }  
}

