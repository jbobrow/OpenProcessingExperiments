

import ddf.minim.*;

Minim minim;
AudioPlayer player;

PImage img;  // Declare variable "a" of type PImage

void setup(){
  size(400, 500);
   minim = new Minim(this);
   
  img = loadImage("rc.png");  // Load the image into the program
player = minim.loadFile("gand.wav");

  textFont(createFont("Arial", 24));
 
}

void draw(){
  
   background(#317921);
  noStroke();
  fill(#F5DF19);
  rect(20, 20, 360,50);
  if (mouseX>width/2-50 && mouseY>height/2-50 && mouseX<width/2+50 && mouseY<height/2+50){
  fill(#160543);
  noCursor();
  image(img,150, mouseY, mouseX, 400);
 
}
else {
  fill(#F5DF40);
  
}
ellipse(width/2, height/2, 100, 100);
fill(#5F1007);
text("COOL", 170, 255);
fill(#F5DF19);
text("COOL", width/2-30, height/2+5);
imageMode(CENTER);

  if(keyPressed == true) {
    if(key == ' ') {
    player.play();
  }
  else{
    player.pause();
  player.rewind();
  }
 

}


}


