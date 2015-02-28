
import ddf.minim.*;
Minim minim;
AudioPlayer player;
 
void setup() {
size (250,250);
background (80,0,275);
smooth();
minim = new Minim(this);
  player = minim.loadFile("party_crowd_1.wav", 512);
}

void draw() {
  if(mousePressed) {
     player.play();
  stroke(random(255),random(255));
  line(mouseX,mouseY,mouseX+random(200),mouseY+random(200));
  stroke (200,0,0);
  strokeWeight(8);
 
  point(mouseX,mouseY);
  }
}

