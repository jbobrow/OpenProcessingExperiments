
float speed= 2.5;
int diameter= 20;
float x;
float y;
PImage pokeball;
PImage Charizard;

import ddf.minim.*;

AudioPlayer player;
Minim minim;

void setup() {
  background(255);
size(700,700, P2D);


minim = new Minim(this);
  player = minim.loadFile("pokemon.mp3", 1024);
  player.play();
}



void draw() {
  Charizard = loadImage ("Charizard.gif");
 image (Charizard,00,00,700,700);
 translate (mouseX,mouseY);
pokeball = loadImage ("pokeball.gif");
image (pokeball, 0,0,100,100);
x+= random (-speed, speed);
y+= random (-speed, speed);



x+= random (-speed,speed);
y+= random (-speed,speed);

 smooth();
fill(136, 227, 101);

x= width/2;
y= height/2;
}

void stop()
{
   player.close();
  minim.stop();
  
  super.stop();
}



