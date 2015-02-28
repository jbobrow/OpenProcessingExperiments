
import ddf.minim.*;

PImage a;
PImage b;

AudioPlayer player;
Minim minim;

void setup() {
size(900, 644);
a = loadImage("bathroom.jpg");
b = loadImage("mans.png");


minim = new Minim(this);
player = minim.loadFile("door.wav");
}  

void draw() {
image(a, 0, 0);
image(b, mouseX, mouseY);


if (mouseX >=50 && mouseY >=50){ 
player.play();
}
}



