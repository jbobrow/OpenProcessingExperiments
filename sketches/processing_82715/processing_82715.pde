
// Fade between photos and embeded hyperlinks

// prepare the images to be loaded
PImage img1, img2;
float fade = 0;
float fadeSpeed = 1;
int rate = 90;
// pause time for the photos in m/s
int pause = 3000;

void setup() {
 size(500, 400);
 img1 = loadImage("2.gif");
 img2 = loadImage("2_night.gif");
 frameRate(rate);
}

void draw() {
 background(img1);
 // adjust the transparency
 fade = fade + fadeSpeed;
 tint(255, 255, 255, fade);
 if ((fade == 255) || (fade == 0)) {
   fadeSpeed = fadeSpeed * -1;
 }
 // delay the program when fade reaches either end
 if ((fade == 255) || (fade == 0)) {
   delay(pause);
 }
 image(img2, 0, 0);
 stroke(0, 0);
 fill(255, 0);
 rect(0, 0, width, height);
}



