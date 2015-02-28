
/* @pjs preload= "birthofvenus.jpg"; */
PImage img;
int x;
int y;
color pix;
float pointillize = 4;

void setup() {
size(1200, 800);
img = loadImage("birthofvenus.jpg");
imageMode(CENTER);
noStroke();
}

void draw() { 
//image(img,width/2, height/2); // We don't need this anymore becayse we are drawing our own pixels
background(0);
for (y = 0; y < img.height; y+=4) {
for (x = 0; x < img.width; x+=4) {
pix = img.get(x, y);
if (pix != color(0, 0, 0)) {
noStroke();
fill(pix);

if (dist(mouseX, mouseY, x, y) <= 1.9) {
pointillize=50;
}
else {
pointillize=2;
}
/// This allows you to select a pixel color with the mouse coordinates
ellipseMode(CENTER);
ellipse ( x, y, pointillize, pointillize);// rectagles work just as well, but remember to set the center mode.
// 
ellipse( x, y, pointillize, pointillize);
}
}
}
}


