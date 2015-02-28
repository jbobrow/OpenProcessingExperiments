
PImage img;
import ddf.minim.*;
AudioPlayer player;
Minim minim;

void setup() {
size(425, 275);
smooth();
img = loadImage("showerhead.JPG");
minim = new Minim(this);
player = minim.loadFile("shower.wav", 2048);
player.play();
}
 
void draw () {
  image(img, 0,0);
  tint(0,0,0,0);
  stroke(#E3EEF0,10);
  strokeWeight(3);
  line(mouseX, mouseY, random(425), random(425, 0));
  
  if (keyPressed == true){
    if (key == 's')
    player.loop(5);
  }
}

void stop(){
  player.close();
  minim.stop();
  super.stop();
}

