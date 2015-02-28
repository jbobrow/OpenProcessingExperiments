
float sides; 
import ddf.minim.*;
Minim minim;
AudioPlayer player;
 


void setup(){
  size(250,250);
  background(50,200,50);
  minim = new Minim(this);
  player = minim.loadFile("THX.wav", 512);
  smooth();
  noLoop();
  frameRate(30);
}

void draw() {
  
  if(mousePressed){
    player.play();
    fill(0,100,200);
    rectMode(CENTER);
    rect(mouseX,mouseY,sides,sides);
    sides++;
  }
 
   
}
void mousePressed() {
  loop();
}

void mouseReleased() {
  noLoop();
}


