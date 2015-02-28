
/* @pjs preload="backgroundImage.png";*/

PImage display;

void setup(){
 size(600,600);
display = loadImage("backgroundImage.png"); 

}

void draw(){
  image(display,0,0);
}


