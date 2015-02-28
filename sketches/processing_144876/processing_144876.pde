
PImage mouseCursor;
import ddf.minim.*;

AudioPlayer player;
Minim minim;

void setup() {
  size(1000,1000);
  smooth();
  background(0);
minim = new Minim(this);

  //noCursor();
}

void draw(){
/*  
PImage fragment;
float a = random(1,3);
float x=random(1000);
float y=random(1000);
int fragNumber = int (a);
  fragment = loadImage("w" + fragNumber +".png");
  image(fragment, x, y);*/
  }


void mouseClicked() {
PImage fragment;
float a = random(1,26);
int fragNumber = int (a);
  fragment = loadImage("w" + fragNumber +".png");
  imageMode(CENTER);
  image(fragment, mouseX, mouseY);
  player = minim.loadFile("gdmt.wav");
  player.loop(0);
}


