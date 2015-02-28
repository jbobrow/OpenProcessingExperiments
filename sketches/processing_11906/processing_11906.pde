
PImage a, b, c, d, e, f, g;

import ddf.minim.*;
AudioPlayer player;
Minim minim;

void setup () {
  size (640, 360);
  a = loadImage("lcd01.jpg");
  b = loadImage("lcd02.jpg");
  c = loadImage("lcd03.jpg");
  d = loadImage("lcd04.jpg");
  e = loadImage("lcd05.jpg");
  f = loadImage("lcd06.jpg");
  g = loadImage("lcd07.jpg");
  imageMode (CORNERS);
  
         minim = new Minim(this);
player = minim.loadFile("funk01.mp3");
player.play();
player.setGain (-7);
player.loop();

  } //VOID SETUP
  
  void draw (){
    
  image(a, 0, 0);
  
if (keyPressed) {

switch (key) {
case 'a' : 
image(b, 0, 0);
minim = new Minim(this);
player = minim.loadFile("funk03.mp3");
player.play();
player.setGain (-8);
} //SWITCH IMG 1

switch (key) {
case 's' :
image (c, 0, 0);
minim = new Minim(this);
player = minim.loadFile("funk04.mp3");
player.play();
player.setGain (-8);
} //SWITCH IMG 2

switch (key) {
case 'd' :
image (d, 0, 0);
minim = new Minim(this);
player = minim.loadFile("funk05.mp3");
player.play();
player.setGain (-8);
} //SWITCH IMG 2

switch (key) {
case 'f' :
image (e, 0, 0);
minim = new Minim(this);
player = minim.loadFile("funk06.mp3");
player.play();
player.setGain (-8);
} //SWITCH IMG 2

switch (key) {
case 'j' :
image (f, 0, 0);
minim = new Minim(this);
player = minim.loadFile("funk07.mp3");
player.play();
player.setGain (-8);
} //SWITCH IMG 2

switch (key) {
case 'k' :
image (g, 0, 0);
minim = new Minim(this);
player = minim.loadFile("funk08.mp3");
player.play();
player.setGain (-8);
} //SWITCH IMG 2
    

} //KEY PRESSED
  
} //VOID DRAW

