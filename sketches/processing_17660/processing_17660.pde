
// PImage is an object for storing images
PImage img;

// Initialize counters
int y = 0;
int x = 0;

// Border width
int border = 20;

// Follower circle radius
int radius = 25;

void setup() {
 // Make a new instance of a PImage by loading an image file
 img = loadImage("hockney2.jpg");

 // Size the window according to the image size
 size(img.width*2+3*border, img.height+2*border);

 // Change the rate at which the program reads pixels
 frameRate(100000);
}

void draw() {

 // Set background to black
 background(255);

 // Draw the image to the screen at coordinate (0,0)
 image(img,20,20);

 // Read all the pixels from img into an array
 img.loadPixels();

 // cycle through the colums, then the rows of the pixel matrix for each cycle of draw
 if (x < img.width) {
   x++;
 } else {
   y++;
   x = 0;
 }

 if ((y == img.height) && (x == img.width)) {
   x = 0;
   y = 0;
 }

   // Name the current pixel location
   int loc = x + y * img.width;

   // And print where you are in the matrix
   println(x);
   println(y);

   // Create variables for the RGB and read in their level values at the present pixel
   float r = red(img.pixels[loc]);
   float g = green(img.pixels[loc]);
   float b = blue(img.pixels[loc]);

   // Create a variable to store that RGB color
   color c = color(r,g,b);

   //  Draw the rectangle filled with that color
   fill(c);
   noStroke();
   rect(img.width+2*border,border,img.width,img.height);

  fill(c,75);
  stroke(c,100);
  strokeWeight(1);
  ellipse(x+border,y+border,radius,radius);

}

