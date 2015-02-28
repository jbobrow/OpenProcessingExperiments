
float endx, endy;
import ddf.minim.*;
Minim minim;
AudioPlayer player;

void setup() {
  size(250,250);
  frameRate(20);
  background(255);
  minim = new Minim(this);
  player = minim.loadFile("Boom.wav", 512);
  noLoop();
  smooth();
}

void draw() {
  if(mousePressed){
    player.play();
  stroke(color(random(255),random(255),random(255)));
  strokeWeight(random(5));
  endx = random(width);
  endy = random(height);
  line(125,125,endx,endy);
  }

}  
void mousePressed() {
  loop();
}

void mouseReleased() {
  noLoop();
}


