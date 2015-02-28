
int a = 150;
int b = 45;
import ddf.minim.*;
Minim minim;
AudioPlayer player;
 
void setup(){
  size(250,250);
  background(50);
  minim = new Minim(this);
  player = minim.loadFile("resonate.wav", 512);
  noLoop();
  smooth();
  frameRate(15);
}

void draw(){
  if(mousePressed){
  player.play();
  stroke(color(random(50),random(0),random(255)));
  strokeWeight(a--);
  point (mouseX++,mouseY);
  }
}
    
  void mousePressed() {
  loop();
}

void mouseReleased() {
  noLoop();
}


