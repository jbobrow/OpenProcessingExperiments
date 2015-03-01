
import ddf.minim.*;
import ddf.minim.analysis.*;

Minim minim;
AudioPlayer song;
FFT fft;
PFont font1, font2, font3, font4;
PImage img;
int FrameCount = 0;

void setup() {
  size(600,600);
  minim = new Minim(this);
  song = minim.loadFile("BF3.mp3");
  fft = new FFT( song.bufferSize(), song.sampleRate() );
  frameRate(30);
  song.loop();
  font1 = loadFont("ARDARLING-48.vlw");
  font2 = loadFont("ARDESTINE-48.vlw");
  font3 = loadFont("BernardMT-Condensed-48.vlw");
  font4 = loadFont("Arial-Black-48.vlw");
  img = loadImage("BF3.png");
}

void draw() {
 background(0);
 float p = song.position()/1000;
 fft.forward(song.mix);
 textAlign(CENTER);
 colorMode(HSB);
  
 if(p<=20) {
  textSize(10+fft.getBand((int)p));
  text("Battlefield 3",width/2,height/2); 
 }   
 else if(p>20&&p<=24) {
  textSize(30);
  text("BATTLEFIELD 3",width/2,height/2); 
 }
 else if(p>24&&p<=29) {
  textFont(font1);
  textSize(15+fft.getBand((int)p)*2);
  text("BATTLEFIELD 3",width/2,height/2); 
 }
 else if(p>29&&p<=58) {
  textSize(15+fft.getBand((int)p)*2);
  text("BATTLEFIELD 3",width/2,height/2);
 }
 else if(p>58&&p<63) {}
 else if(p>=63&&p<80) {
  image(img, 0, 0, 600 + fft.getBand((int)p), 600 + fft.getBand((int)p));
  fill(0,0,60 + fft.getBand((int)p)*50);
  textFont(font2);
  textSize(30+fft.getBand((int)p)*3);
  text("BATTLEFIELD 3",width/2,height/2+fft.getBand((int)p)*2);
  noFill();
  strokeWeight(1+fft.getBand((int)p));
  
  randomText(); randomText(); randomText(); randomText(); randomText(); randomText(); randomText(); randomText(); 
 }
 else if(p>=80&&p<97) {
  image(img, 0, 0, 600 + fft.getBand((int)p), 600 + fft.getBand((int)p));
  textFont(font4);
  textSize(40+fft.getBand((int)p));
  if(p<81) text("B  attlefield 3",width/2,height/2+fft.getBand((int)p));
  else if(81<=p&&p<82) text("b  A  ttlefield 3",width/2+(int)random(0,20),height/2+fft.getBand((int)p));
  else if(82<=p&&p<83) text("ba  T  tlefield 3",width/2+(int)random(0,20),height/2+fft.getBand((int)p));
  else if(83<=p&&p<84) text("bat  T  lefield 3",width/2+(int)random(0,20),height/2+fft.getBand((int)p));
  else if(84<=p&&p<85) text("batt  L  efield 3",width/2+(int)random(0,20),height/2+fft.getBand((int)p));
  else if(85<=p&&p<86) text("battl  E  field 3",width/2+(int)random(0,20),height/2+fft.getBand((int)p));
  else if(86<=p&&p<87) text("battle  F  ield 3",width/2+(int)random(0,20),height/2+fft.getBand((int)p));
  else if(87<=p&&p<88) text("battlef  I  eld 3",width/2+(int)random(0,20),height/2+fft.getBand((int)p));
  else if(88<=p&&p<89) text("battlefi  E  ld 3",width/2+(int)random(0,20),height/2+fft.getBand((int)p));
  else if(89<=p&&p<90) text("battlefie  L  d 3",width/2+(int)random(0,20),height/2+fft.getBand((int)p));
  else if(90<=p&&p<91) text("battlefiel  D  3",width/2+(int)random(0,20),height/2+fft.getBand((int)p));
  else  text("BATTLEFIELD 3",width/2,height/2+fft.getBand((int)p));
  noFill();
  strokeWeight(1+fft.getBand((int)p)); 
 }
 else if(p>=97&&p<105) {
   image(img, 0, 0, 600 + fft.getBand((int)p), 600 + fft.getBand((int)p));
   textFont(font4);
   fill(0,0,60 + fft.getBand((int)p)*50);
   text("BATTLEFIELD 3",width/2+fft.getBand((int)p)*2,height/2+fft.getBand((int)p)*2);
 }
 else if(p>=105&&p<109) {image(img, 0, 0, 600 + fft.getBand((int)p)*10, 600 + fft.getBand((int)p)*10);}
 else {
  fill(255);
  textSize(fft.getBand((int)p)*30);
  text("BATTLEFIELD 3", width/2, height/2); 
 }
 
  for(int k=0; k<width/2; k+=10) {
   stroke(0,0,60 + fft.getBand((int)p)*50);
   line(k,300+fft.getBand(k)*5,k+10,300+fft.getBand(k+10)*5);
   line(width-k,300-fft.getBand(k)*5,width-k-10,300-fft.getBand(k+10)*5);
  }
}

void keyPressed() {
 switch (keyCode) {
  case LEFT:
    song.skip(-5000);
    break;
  case RIGHT:
    song.skip(5000);
    break;     
 }
}

void randomText() {
  float p = song.position()/1000;
  textFont(font3);
  textSize(fft.getBand((int)p)*3);
  text("battlefield 3", (int)random(0,600), (int)random(0,600));
}


