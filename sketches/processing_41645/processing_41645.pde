
import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;


Minim r;
AudioPlayer raaw;

float doodX = 250;
float doodY = 250;


void setup() {
  size (500,500);

  r = new Minim(this);
  raaw = r.loadFile("lion-01.wav");
}

void draw() {

  background(0);

  ellipse(doodX,doodY,100,100);
  doodX = doodX + 2;
  
  if(doodX > width)
  doodX = 0;
}

void mousePressed() {
  raaw.loop(0);
  
  if(dist(doodX,doodY,mouseX,mouseY) < 50) {
    if (raaw.isPlaying()) {
      raaw.pause();
      raaw.rewind();
      
    }
  }
}//else{
  //meow.loop(0);


