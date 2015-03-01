
/* @pjs preload="colorblobs.jpeg"; */

//PImage arch;
//int index;
//void setup() {
//size(100, 100);
//smooth();
//fill(0);
//arch = loadImage("hamster.jpg");
//arch.loadPixels();
//}
//void draw() {
//background(204);
//color c = arch.pixels[index]; // Get a pixel
//float r = red(c) / 3.0; // Get the red value
//ellipse(width/2, height/2, r, r);
//index++;
//if (index == width*height) {
//index = 0; // Return to the first pixel
//}
//}

PImage arch;
void setup() {
size(400, 400);

arch = loadImage("colorblobs.jpeg");
arch.loadPixels();
}
void draw() {
background(0);
fill(mouseX-100,mouseY-100,(mouseX-145)+(mouseY-145)/2,150);
strokeWeight(.5);
stroke((mouseX-145)+(mouseY-145)/2,mouseX-145,mouseY-145);
int mx = constrain(mouseX, 0, arch.width-1);
int offset = mx * arch.width;
beginShape(TRIANGLE_STRIP);
for (int i = 0; i < arch.width; i += 2) {
float r1 = blue(arch.pixels[offset + i]);
float r2 = blue(arch.pixels[offset + i + 1]);
float vx = map(r1, 0, 255, 0, height);
float vy = map(r2, 0, 255, 0, height);
vertex(vx, vy);
}
endShape();
}


