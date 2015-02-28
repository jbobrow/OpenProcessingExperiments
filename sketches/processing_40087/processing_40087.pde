
/*This program uses both Photoshop and Processing to alter an image.
 First, the contrast and saturation of the original image were increased.
 The amount of red in the image was then reduced by increasing the cyan and blue values.
 In Processing, only the red values are drawn and thus creating an abstracted image.
 */
 
PImage picture;

void setup() {
  size(300, 400);
  picture = loadImage("hairwaterflip_1.jpg");
  noStroke();
  smooth();
}

int grid = 12;

void draw() {
  background(0);

  //setting up the grid for the image
  for (int y=grid; y <=399; y+=grid) {
    for (int x=grid; x <=299; x+=grid) {

      //color of rectangles matching the image
      color myFill = color(picture.pixels[x+(y*300)]);
      fill(myFill);

      //drawing rectangles that overlap using the red value in the image
      float radius = grid*(red(picture.pixels[x+(y*300)])/150);
      rectMode(CENTER);
      rect(x, y, radius, radius);
    }
  }
}


