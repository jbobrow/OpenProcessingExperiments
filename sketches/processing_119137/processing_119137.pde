
import ddf.minim.*;
PImage a;

Minim minim;
AudioPlayer player1;

void setup() {
  size (500, 300);
  a =loadImage ("1.jpg");
  minim = new Minim(this);
  player1 = minim.loadFile ("laf.mp3");
}

void draw(){
  image(a, 0, 0, a.width/1, a. height/1);
  
  if(mousePressed == true)
  if (mouseX < width && mouseY < height){
    player1.play();
  }
  
}



