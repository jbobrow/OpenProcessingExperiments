
import ddf.minim.*;

Minim minim;
AudioPlayer bells;
AudioSample bowl;
//imágenes y audio
PImage logo; 
void setup() { 
  minim = new Minim(this);
  bells =minim.loadFile ("bell.wav");
  bowl =minim.loadSample ("bowl.wav");
  bells.play();
 size(200, 400);
 background(0);
logo =loadImage("Logo Monte Rojo.jpg");
imageMode(CENTER);
}

void draw() {
 image(logo, width/2, height/2, 150, 300); 
}

void keyPressed() {
  if (key == 'a') bowl.trigger();
}

