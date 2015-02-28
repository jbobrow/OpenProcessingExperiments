
/*************************************************************
* Assignment #6
* Kelli Breeden
* kbreeden@brynmawr.edu
* CS 110 - Section 2
* Submitted 4/9/2012
*
* This sketch is a collage of versions of a picture title 
* "FlowerBMC". This picture was taken at Bryn Mawr College 
* by Makala Forster. The original photo is displayed in the 
* center of the screen with my four variations behind it. In
* the upper left corner, there is a blended edition where each
* pixel takes the color of one of its neighbors at random. The
* upper right corner features a variation of the famous "obamicon"
* style, but instead of red, blues and white, there are purples,
* green and a very pale yellow. The bottom right corner is a 
* version of the photo in pointillism and the bottom left is in
* grayscale. 
**************************************************************/

void setup(){
  size(800,700);
  
  //OBAMICON WITH A TWIST
  PImage img = loadImage("FlowerBMC.jpg");
  image(img,width/2,0,width,height/2);

  loadPixels();
  color darkPurple = color(102, 0, 102);
  color mediumGreen = color(51,153,0);
  color lightPurple = color(179,153,204);
  color yellow = color(230,255,204);
 
  //TO DETERMINE WHERE THE COLORS APPEAR:
  for (int i = 0; i < pixels.length/2; i++) {
    color c = pixels[i];
    float total = red(c)+green(c)+blue(c);
    if (total < 182) {
      pixels[i] = darkPurple;
    }
    else if (total < 364) {
      pixels[i] = mediumGreen;
    }
    else if (total < 546) {
      pixels[i] = lightPurple;
    }
    else {
      pixels[i] = yellow;
    }
  }
  updatePixels();
  
  //BLURRED VERSION WHERE POINTS TAKE ON COLOR OF NEIGHBOR
  img = loadImage("FlowerBMC.jpg");
  image(img,0,0,width/2,height/2);
  loadPixels();
  for (int y=0; y<height/2; y++) {
    for (int x=0; x<width/2; x++) {
      int newX = int(random(x-1, x+1));
      int newY = int(random(y-1, y+1));
      newX = constrain(newX, 0, width/2-1);
      newY = constrain(newY, 0, height/2-1);
      pixels[y*width+x] = pixels[newY*width+newX];
    }
  }
  updatePixels();
  
  //GRAYSCALE
  img = loadImage("FlowerBMC.jpg");
  loadPixels();
  for (int i=0; i<img.pixels.length; i++) {
    color c = img.pixels[i];
    img.pixels[i] = color(red(c)*0.3+green(c)*0.59+blue(c)*0.11);
  }
  updatePixels();
  image(img,0,height/2,width/2,height);
  
  //POINTILLISM - adding of random colored circles
  img = loadImage("FlowerBMC.jpg");
  image(img,width/2,height/2,width,height);
  loadPixels();
  noStroke();
  ellipseMode(CENTER);
  loadPixels();        
  addPoint();
  
  //ORIGINAL, UNALTERED IMAGE
  img = loadImage("FlowerBMC.jpg");
  pushMatrix();
  translate(270,225);
  image(img,0,0,width/3,height/3);
  popMatrix();
}

//NECESSARY FOR POINTILLISM - defines how/where dots go
void addPoint() {
  for (int i=0; i<9500; i++) {
    int x = (int)random(width/2,width);
    int y = (int)random(height/2,height);
    int k = x + width*y;
    color c = pixels[k];
    fill(c);
    ellipse(x, y, 8, 8);
  }
}

