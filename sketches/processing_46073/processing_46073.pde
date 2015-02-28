

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


smooth();
x = width/2;
y = height/2;
}

void draw () {


x += random(-speed,speed);
y += random(-speed,speed);


}

void stop()
{

player.close();
minim.stop();

super.stop();
}

void mousePressed(){

minim = new Minim(this);
player = minim.loadFile("04 Rise.mp3", 2048);
player.play();
}

