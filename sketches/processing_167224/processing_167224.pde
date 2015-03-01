
/* @pjs preload="colorblobs.jpeg"; */

PImage blob;

void setup() {
size(600,360);
blob = loadImage("colorblobs.jpeg");
}

void draw () {
image(blob, 0, 0, 600,360);
color c = get(mouseX,mouseY);
float redChannel = red(get(mouseX, mouseY));
stroke(c);
strokeWeight(10);
line(0, 0, 0, 360);
line(597, 0, 597, 360);
line(0, 0, 590, 0);
line(0, 360, 597, 360);
noStroke();
fill(20,redChannel,redChannel,redChannel);
rect(200,0,200,360);
}


