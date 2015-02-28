
PImage img0;

void setup() {
size(500,700);
smooth();
noStroke();
frameRate(10);
PFont font;
font=loadFont ("GillSans-UltraBold-45.vlw");
textFont(font);
img0 = loadImage("45-illustration-artists.jpg");
}

void draw() {
background(255);
image(img0,105,195);
  fill(#A2A2A2,120);
    for (int i = 0; i <= mouseY; i += 5) {
  text("E",mouseX, random(0,700),mouseY,random(0,700));}
}


