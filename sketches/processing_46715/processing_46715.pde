
PImage F1000011;
PImage F1000022;
float speed=2.5;
int diameter=20;
float x;
float y;
import ddf.minim.*;

AudioPlayer player;
Minim minim;



void setup () {
// background(204,210,30);
size(600,800);
F1000011 = loadImage("F1000011.jpg");
F1000022 = loadImage("F1000022.jpeg");
smooth();
x = width/2;
y = height/2;
}


void draw () {

 
image(F1000011,0,0);
x += random(-speed,speed);
y += random(-speed,speed);


}


void stop()
{
if (mousePressed) {
player.close();
minim.stop();

super.stop();
}
}


void keyPressed(){

minim = new Minim(this);
player = minim.loadFile("‪Tu Ventana _ Manuel Garcia‬‏ - YouTube.mp3", 2048);
player.play();
}



