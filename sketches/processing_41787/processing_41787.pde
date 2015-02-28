
PImage img;
int squareW=5;
//float r= random (0, 100);
//float g= random (0, 100);
//float b= random (0,100);
//color [] image.pixels[loc] = new color[max_pixels];

void setup() {
size(400,300);
img = loadImage( "art1.jpg");
background(255);
smooth();
frameRate (1000);
}


void draw() {
// squares appear in random locations
int x = int(random(img.width));
int y = int(random(img.height));
int loc = x + y*img.width;


// Look up the RGB color in the source image
loadPixels();
//for (int i=0; i<img.pixels; i++) {
//float r = random (255);
//float g=random (255);
//float b= random (255);
//}


float r= random (img.pixels[loc]);
float g = green (img.pixels[loc]);
float b = blue (img.pixels[loc]);
noStroke();

r = constrain(r,0,255);
g = constrain(g,0,255);
b = constrain(b,0,255);



// Draw a rectangle at that location with that color
fill(r,g,b);
rect(x, y, squareW, squareW);
// Make a new color and set pixel in the window
pixels[loc]= color(r,g,b);

}


