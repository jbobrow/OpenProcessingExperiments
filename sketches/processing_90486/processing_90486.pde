
import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
int musicplay = 0;

Minim minim;
AudioSample demo;

void setup() {
  size(500,500);
  minim = new Minim(this);
  demo = minim.loadSample("Jeopardy music.mp3");
  
}
  
void draw() {
  background(255, 0, 0);
  rect(300, 200, 500, 500);
  if(mouseX > 300 && musicplay == 0) {demo.trigger(); musicplay = 1;}
  if(mouseX < 300 && musicplay == 1) {demo.stop(); musicplay = 0;}
}


