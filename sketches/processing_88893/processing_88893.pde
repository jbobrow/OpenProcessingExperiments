

import ddf.minim.*;

Minim minim;
AudioPlayer player;

PImage img;  // Declare variable "a" of type PImage

void setup(){
  size(500, 500);
  minim = new Minim(this);
   
  img = loadImage("toi.jpg");  // Load the image into the program
  
player = minim.loadFile("poo.mp3");

textFont(createFont("impact", 24));

}


void draw() {
  background(255);
  noStroke();
  image(img,0, 30);
  if (mouseX>width/2-50 && mouseY>height/4-100 && mouseX<width/2+50 && mouseY<height/2+10){
fill(67, 89, 100);
text("FLUSHHH", width/2-70, height/2-200);
player.play();
 }
  else {
  
    fill(#31D3BC);
    text("FLUSH", width/2-70, height/2-200);
    
    player.pause();
  player.rewind();
}
   }




