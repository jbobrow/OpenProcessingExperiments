


AudioPlayer player;
Minim minim;

import ddf.minim.*;
PImage jd;
float speed =2.5;
int diameter =20;
float x;
float y;

void setup(){

size(440,420,P2D);
minim = new Minim(this);
player = minim.loadFile("groove.mp3", 2048);
// play the file
player.play();

jd =loadImage("jd.jpg");
smooth();
x=width/2;
y=height/2;

}

void draw(){
image(jd,0,0);

//background(204);
x += random(-speed,speed);
y += random (-speed,speed);
translate(mouseX,mouseY);
ellipse (x,y,diameter,diameter);

}

void stop()
{
// always close Minim audio classes when you are done with them
player.close();
minim.stop();

super.stop();
}

