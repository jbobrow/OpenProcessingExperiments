
import ddf.minim.*;
Minim minim;
AudioPlayer player;
PImage ima;
PImage ima2;
PImage ima3;
PImage ima4;

void setup() {
  size(1000, 400);
  minim = new Minim(this);

  ima4=loadImage("hand03.png");
}

void draw() {
  background(255); 
  imageMode(CENTER);
  if (mousePressed == true) {
    player = minim.loadFile("fire.mp3", 2048);
    player.play();
  }
  if ((mouseX>100) && (mouseX<280)) {
    ima=loadImage("FG.png");
  } 
  else {
    ima=loadImage("G.png");
  }
  if ((mouseX>400) && (mouseX<550)) {
    ima2=loadImage("egg02.png");
  } 
  else {
    ima2=loadImage("egg01.png");
  }
  if ((mouseX>660) && (mouseX<880)) {
    ima3=loadImage("steak02.png");
  } 
  else {
    ima3=loadImage("steak01.png");
  }
  image(ima, 200, 180);
  image(ima2, 490, 180);
  image(ima3, 780, 200);
  imageMode(CORNER);
  image(ima4, mouseX, 130);
}



