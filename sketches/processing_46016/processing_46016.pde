
PImage diosa;
PImage catrina;
float speed=2.5;
int diameter=20;
float x;
float y;
import ddf.minim.*;

AudioPlayer player;
Minim minim;



void setup () {
 // background(204,210,30);
size(334,450);
diosa = loadImage("diosa.jpg");
catrina = loadImage("catrina.jpeg");
smooth();
x = width/2;
y = height/2;
}


void draw () {

image(diosa,0,0);
x += random(-speed,speed);
y += random(-speed,speed);
image(catrina,70,0,x,y);

}


void stop()
{
  
  player.close();
  minim.stop();
  
  super.stop();
}

void mousePressed(){
 
minim = new Minim(this);
player = minim.loadFile("viva la gloria.mp3", 2048);
player.play();
}

void keyPressed() {
   player.close();
  minim.stop();
  
  super.stop();

}


