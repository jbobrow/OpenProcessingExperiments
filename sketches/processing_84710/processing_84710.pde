
void setup() {
// set window size
size(800, 800);
// styling
smooth();
background(0);
// start in center
mouseX=width/2; mouseY=height/2;
}
void draw() {
// random radius
float r = random(100);
// random color
//fill(random(255),random(255),random(255));
fill(random(190),random(109),250,50);
stroke(255,random(130),random(13),150);
strokeWeight(2);
// draw ellipse
float x = mouseX;
float y = mouseY;
triangle(x, y, x+r/2, y-r, x+r, y);
}


