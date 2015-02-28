
/*import ddf.minim.spi.*;
import ddf.minim.signals.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.ugens.*;
import ddf.minim.effects.*;*/

PImage foto;
PImage picture;
PImage abella;
var audioElement = document.createElement("audio");
 


void setup() {
  size(300, 300);
  foto=loadImage("tulips2.jpg");
  picture=loadImage("tulips1.jpg");
  abella=loadImage("abella1.png");
  noCursor();
}



void draw() {
  background(0);
  fill(0, 6);
  rect(0, 0, width, height);
  image(picture, 0, 0, 400, 300);
  image(abella,mouseX-25,mouseY-25,50,50);
}



 void mousePressed (){
  audioElement.setAttribute("src","fly.mp3");
  audioElement.play();
 
}



