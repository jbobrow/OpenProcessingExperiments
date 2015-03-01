
import processing.core.PImage;
import ddf.minim.*;
import ddf.minim.analysis.*;
Minim minim;
AudioPlayer song;
FFT fft;
int loopBegin, loopEnd;
boolean pause = false, mute=false;



void setup()
{  
  size(600, 700, P3D);
  minim = new Minim(this);
  song = minim.loadFile("updown.mp3");
  song.loop();
  fft = new FFT( song.bufferSize(), song.sampleRate() );

  b1 = new Slider("Volume", 100, 630, 400, 40, -10, 10, color(191, 0, 92), color(255));
  
}

void draw()
{
  background(191, 0, 92);
  PImage img;
  img = loadImage("exidgg.jpg");
  image(img,0,0,600,600);
  b1.display();
}
void keyPressed()
{
  switch(key) {

  case ' ':
    pause = !pause;
    if (pause) song.pause();
    else song.play();
    break;
  case 'm':
    mute = !mute;
    if (mute) song.mute();
    else song.unmute();
    break;
  }


  if (key == CODED) {
    if (keyCode == RIGHT) {
      background(random(0, 255), random(0, 255), random(0, 255));
    }
    if (keyCode == LEFT) {
      background(random(0, 255), random(0, 255), random(0, 255));
    }
    if (keyCode ==UP) { 
      
      PImage img;
      img = loadImage("up.jpg");
      image(img,0,0,600,600);
      
      float a = random(0,255);
      float b = random(0,255);
      float c = random(0,255);
      fill(a,b,c);
      
      stroke(0);
      strokeWeight(5);
      beginShape();
      vertex(20,100);
      vertex(30,270);
      vertex(50,260);
      vertex(40,90);
      vertex(20,100);
      endShape();
      
      beginShape();
      vertex(80,90);
      vertex(70,260);
      vertex(90,270);
      vertex(100,100);
      vertex(80,90);
      endShape();
      
      beginShape();
      vertex(140,100);
      vertex(150,270);
      vertex(170,260);
      vertex(160,90);
      vertex(140,100);
      endShape();
      
      beginShape();
      vertex(200,90);
      vertex(190,260);
      vertex(210,270);
      vertex(220,100);
      vertex(200,90);
      endShape();
      
      beginShape();
      vertex(260,100);
      vertex(270,270);
      vertex(290,260);
      vertex(280,90);
      vertex(260,100);
      endShape();
      
      beginShape();
      vertex(320,90);
      vertex(310,260);
      vertex(330,270);
      vertex(340,100);
      vertex(320,90);
      endShape();
      
      beginShape();
      vertex(360,100);
      vertex(370,270);
      vertex(390,260);
      vertex(380,90);
      vertex(360,100);
      endShape();
      
      beginShape();
      vertex(420,90);
      vertex(410,260);
      vertex(430,270);
      vertex(440,100);
      vertex(420,90);
      endShape();
      
      beginShape();
      vertex(480,100);
      vertex(490,270);
      vertex(510,260);
      vertex(500,90);
      vertex(480,100);
      endShape();
      
      beginShape();
      vertex(540,90);
      vertex(530,260);
      vertex(550,270);
      vertex(560,100);
      vertex(540,90);
      endShape();     
          
    }
    if (keyCode== DOWN) {
      
      PImage img;
      img = loadImage("down.jpg");
      image(img,0,0,600,600);
      
      float a = random(0,255);
      float b = random(0,255);
      float c = random(0,255);
      fill(a,b,c);
      
      stroke(0);
      strokeWeight(5);
      beginShape();
      vertex(20,500);
      vertex(30,330);
      vertex(50,340);
      vertex(40,510);
      vertex(20,500);
      endShape();
      
      beginShape();
      vertex(80,510);
      vertex(70,340);
      vertex(90,330);
      vertex(100,500);
      vertex(80,510);
      endShape();
      
      beginShape();
      vertex(140,500);
      vertex(150,330);
      vertex(170,340);
      vertex(160,510);
      vertex(140,500);
      endShape();
      
      beginShape();
      vertex(200,510);
      vertex(190,340);
      vertex(210,330);
      vertex(220,500);
      vertex(200,510);
      endShape();
      
      beginShape();
      vertex(260,500);
      vertex(270,330);
      vertex(290,340);
      vertex(280,510);
      vertex(260,500);
      endShape();
      
      beginShape();
      vertex(320,510);
      vertex(310,340);
      vertex(330,330);
      vertex(340,500);
      vertex(320,510);
      endShape();
      
      beginShape();
      vertex(360,500);
      vertex(370,330);
      vertex(390,340);
      vertex(380,510);
      vertex(360,500);
      endShape();
      
      beginShape();
      vertex(420,510);
      vertex(410,340);
      vertex(430,330);
      vertex(440,500);
      vertex(420,510);
      endShape();
      
      beginShape();
      vertex(480,500);
      vertex(490,330);
      vertex(510,340);
      vertex(500,510);
      vertex(480,500);
      endShape();
      
      beginShape();
      vertex(540,510);
      vertex(530,340);
      vertex(550,330);
      vertex(560,500);
      vertex(540,510);
      endShape();  
    
  }

if(keyCode == SHIFT){
  song = minim.loadFile("clap.wav");
  song.loop();
  fft = new FFT( song.bufferSize(), song.sampleRate() );
  
}
}
}

Slider b1;

void mouseDragged() {
  b1.slide();
  song.setGain( -b1.pos() );
} 

class Slider {
  String name;
  int x, y; // position
  int w, h; // width and height
  float min, max;
  float pos; // current value
  color baseCol;
  color highlightCol;
  float pos() {
    return pos;
  }
  Slider(String s, int xp, int yp, int sw, int sh, float mi, float ma, color bc, color hc) {
    name = s; // name
    x=xp; // x position
    y=yp; // y position
    w = sw; // slide width
    h = sh; // slide height
    min = mi; // min
    max = ma; // max
    baseCol = bc; // base color
    highlightCol = hc; // highlight color
    pos = (min+max)/2; // default position
  }
  void slide() {
    if ((mouseX >=x ) && (mouseX <= x+w) &&
      (mouseY >= y) && (mouseY <= y+h) ) {
      pos = map(mouseX, x, x+w, max, min);
    }
  }
  void display() {
    fill(255); 
    stroke(0);
    strokeWeight(3);
    rect(x, y, w, h); 
    fill(baseCol); 
    rect(x, y, map(pos, max, min, 0, w), h);
  }
}



