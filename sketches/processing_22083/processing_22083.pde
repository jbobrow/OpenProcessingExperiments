
import ddf.minim.*;
import ddf.minim.signals.*;

//LEVELS CIRCLES VARIABLES
float rightmouseColor;
float leftmouseColor;
float leftWidth;
float rightWidth;

//BACKGROUND CIRCLES VARIABLES
float x = 100;            
float y = 100;
float xspeed = 1;
float yspeed = 3.3;

Minim minim;
AudioPlayer myMusic;

void setup() {
  
  size (600,600, P2D);
  colorMode(HSB,100);
  background(0);
  minim = new Minim(this);
  myMusic = minim.loadFile("07 Everybody.mp3");
  myMusic.loop();
}

void draw() {
  
  musicCircles();  
  
}

void mousePressed () {
  background(0);
}

void musicCircles () {
  background(0);
  rightmouseColor = mouseX/6;
  leftmouseColor = mouseY/6;
  
  leftWidth = myMusic.left.level()*800;
  rightWidth = myMusic.right.level()*800;
  noStroke();
  fill (leftmouseColor, 90, 90, 80);
  ellipse(150,300,leftWidth, leftWidth);
  
  fill (rightmouseColor, 90, 90, 80);
  ellipse(450,300,rightWidth, rightWidth);
}


void stop (){
  myMusic.close();
  minim.stop();
  super.stop();
}

