
import ddf.minim.*;

PImage a;
PImage b;

AudioPlayer player;
Minim minim;

void setup() {
size(600, 443);
a = loadImage("1.jpg");
b = loadImage("coffee_cup.png");


minim = new Minim(this);
player = minim.loadFile("kettle.aif");

}  


void draw() {
image(a, 0, 0);
image(b, mouseX, mouseY);

if (mouseX > 200 && mouseY > 50){
player.play();
}
}



