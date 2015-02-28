
// sample code
void setup() {
// set window size
size(800,800);
//size(displayWidth, displayHeight);
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
//fill(random(190),109,250,70);
noFill();
stroke(255,random(130),random(13),90);
strokeWeight(3);
// draw ellipse
ellipse(mouseX, mouseY, r, r);
}



