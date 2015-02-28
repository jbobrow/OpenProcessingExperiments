
 int x = 30;
 PFont fontA;
 PImage a, b, c, d, e, f, g, h;
 
 import ddf.minim.*;
AudioPlayer player;
Minim minim;
 
 void setup() {
 smooth();
 size(640, 360);
 background (255);
 imageMode (CENTER);
 rectMode (CENTER);
 a = loadImage("closeup01.jpg");
 b = loadImage("jag01.jpg");
 c = loadImage("jag02.jpg");
 d = loadImage("jag03.jpg");
 e = loadImage("jag04.jpg");
 f = loadImage("jag05.jpg");
 g = loadImage("jag06.jpg");
 h = loadImage("jag07.jpg");
 
 fontA = loadFont("FFDINNEW.vlw");
 textFont(fontA, 180); 
 
    minim = new Minim(this);
player = minim.loadFile("electroma.mp3");
player.play();
player.loop();
player.setGain(-8);



 
} //VOID SETUP
 
void draw() {

 
  float x = pmouseX;
  float y = pmouseY;
  float r = random (50, 200);
  float w = random (100, 255);
  

tint (w, 255);
image (b, 50, 180);
image (c, 420, 180);
image (d, 365, 180);
image (e, 350, 180);
image (f, 70, 180);
image (g, 350, 180);

tint (255, r); 
image (b, x+30, 180);
image (c, x-120, 180);
image (d, x-55, 180);
image (e, x+150, 180);
image (f, x+170, 180);
image (g, x-150, 180);

fill(255, r );
text("WHAT I WAS", -75, 245);

} //VOID DRAW

