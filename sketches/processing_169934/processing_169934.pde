
/* @pjs preload="bubs.jpg"; */

//size(605,403);
//background(0);
//fill(180,100,100,80);
//rect(0,0,width,height);
//PImage arch = loadImage("bubs.jpg");
//int count = arch.width * arch.height;
//arch.loadPixels();
//loadPixels();
//for (int i = 0; i < count; i += 4) {
//pixels[i] = arch.pixels[count-i-1];
//}
//updatePixels();

//PImage arch = loadImage("bubs.jpg");
//background(arch);
//loadPixels();
//for (int i = 0; i < width*height; i++) {
//color p = pixels[i]; // Grab pixel
//float r = 255 - red(p); // Modify red value
//float g = 265 - green(p); // Modify green value
//float b = 255 - blue(p); // Modify blue value
//pixels[i] = color(r, g, b); // Assign modified value
//}
//updatePixels();

PImage arch;
void setup() {
size(605,403);
arch = loadImage("bubs.jpg");
}
void draw() {
background(arch);
loadPixels();
for (int i = 0; i < width*height; i++) {
color p = pixels[i]; // Read color from screen
float r = red(p); // Modify red value
float g = green(p); // Modify green value
float b = blue(p); // Modify blue value
float bw = (r + g + b) / 3.0;
bw = constrain(bw + mouseX/3, 0, 255);
pixels[i] = color(bw+mouseX,bw+mouseY/3,180); // Assign modified value
}
updatePixels();
}


