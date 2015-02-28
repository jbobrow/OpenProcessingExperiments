
import ddf.minim.*;
PImage a;

Minim minim;
AudioPlayer player1;

void setup () {
  size (1000, 500);
  a = loadImage ("1.png");
  minim = new Minim(this);
  player1 = minim.loadFile ("Machine gun.mp3");
}
  
void draw(){
image(a, 0, 0, a.width/2, a.height/2);

if(mousePressed == true){
  if(mouseX < width/2 && mouseY < height/2){
    player1.play();
  }

}
}


