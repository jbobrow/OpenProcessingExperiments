
color olive, blue;
void setup() {
size(100, 100);
colorMode(HSB, 360, 100, 100, 100);
noStroke();
smooth();
olive = color(115, 105, 59);
blue = color(180, 100, 72);
}
void draw() {
float y = mouseY / float(height);
background(blue);
fill(olive);
quad(90 + y*6, 0, 100, 0, 100, 100, 30 - y*6, 100);
color yellow = color(60 + y*20, 100, 88 - y*20);
fill(yellow);
rectMode(CENTER);
rect(50, 45 + y*10, 60, 60);
color pink = color(300, 100, 83 - y*10);
fill(pink);
ellipse(50, 42 + y*16, 44, 44);
}
