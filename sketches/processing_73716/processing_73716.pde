
import ddf.minim.*;

PImage a;
PImage b;
PFont fontA;

AudioPlayer player;
Minim minim;

void setup() {
size(600, 600);
a = loadImage("fridge.jpg");
b = loadImage("hand-stop-2.png");
fontA = loadFont("Aharoni-Bold-48.vlw");
textFont(fontA, 80);

minim = new Minim(this);
player = minim.loadFile("nooo.wav");
}  
void draw() {
background(10);
image(a, 0, 0);
image(b, mouseX, mouseY);

if (mouseX >=170 && mouseY >= 100) {
player.play();
text("Hands OFF,", 100, 200);
fill(0, 200, 150);
text ("B**TH!!!", 160, 300);
}
}


