
import ddf.minim.spi.*;
import ddf.minim.signals.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.ugens.*;
import ddf.minim.effects.*;

import ddf.minim.*;

Minim minim;
AudioSample bounce;
AudioPlayer bgsound;

float x = 100, y = 100;
float xSpeed = random(2,4);
float ySpeed = random(2,4);
float PlayerScore = 0;
PImage img;

int xp = 100, r = 0, yp = 100;
int xdir = -3, ydir = 3;

void setup() {

size(300, 300);
noStroke();
noCursor();
img = loadImage("dino.jpg");

minim = new Minim(this);
bounce = minim.loadSample("water_drip.mp3");
bgsound = minim.loadFile("country_sounds.mp3");
bgsound.loop();

}
void draw() {

background(0);
image(img, 0, 0, 300, 300); 
fill(255);
ellipse(x, y, 10, 10);
rect(mouseX-30, height-40, 60, 10);
text("PlayerScore : " +PlayerScore, 20, 20, 50);
textAlign(LEFT);
textSize(12);

x = x + xSpeed;
y = y + ySpeed;

if (x > width-5 || x < 5) {
xSpeed = -xSpeed;
}
if (y > height-5 || y < 5) {
ySpeed = -ySpeed;
}
if (y > height-30 && x > (mouseX-30) && x < (mouseX+30) ) {
ySpeed = -ySpeed; 
bounce.trigger();
}
if (y > height-30 && x > (mouseX-30) && x < (mouseX+30) ) {
PlayerScore = PlayerScore + 10;
}
}

