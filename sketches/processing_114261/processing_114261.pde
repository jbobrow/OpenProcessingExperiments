
import ddf.minim.*;

Minim minim;
AudioSample gun;
AudioPlayer circus;

PImage bg,pic01; 
void setup() {
//resize the background n load the background
size(900,600);
  bg = loadImage("duck.png");
  bg.resize(900,600);
  pic01 = loadImage("Untitled-1.png");
  
  //load the music n sound effect
  minim = new Minim(this);
  gun = minim.loadSample("gun.wav");
  circus = minim.loadFile("Circus.wav");
  circus.loop();
}


void draw() {
background(bg); 
if (mousePressed)  
 gun.trigger();
 background(bg);
 image(pic01,mouseX,mouseY,150,150);

}

