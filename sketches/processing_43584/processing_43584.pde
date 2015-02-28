
//Computationa Methods - Arch 4050, Fall 2011
//Project 2
//Group Members: Steve Craton, Will Cordes, Danielle Magnus


// based on Prof Senske's Brightness threshold

/*notes written within long notes were made by Will.
 I'm going to run my way through this code to understand
 it, so forgive any ignorance of later mechanisms.*/

//HEX-COLOR CODES
//#000000 (black)
//#B72323 (toned down red)
//#27B937 (toned down green)
//#097290 (toned down blue)
//#F9FA3F (toned down yellow)
//#FA8A3F (toned down orange)

PImage img;
float thresh = 45; 
//threshold (0-255) -- whatever is brighter than this will be shown
//lower theshold values yield more blue, higher values yield more red.

void setup() {
  size(500, 500);
  img = loadImage("Costa Rican Frog.jpg");
  img.loadPixels();
  //smooth();
}

void draw() {
  background(#000000); //black
  //iterate through all of the pixels in our image

  for (int i=0; i<img.pixels.length;i++) {
    if (brightness(img.pixels[i]) > thresh) {
      //if the brightness of a pixel is above threshold, draw a point.
      // simple algorithm to recover x,y coordinates from an image array index:
      // x = divide the index by the width of the image, the remainder (modulo) will be the x-coordinate of the row
      // y = i divided by image width, rounded to the nearest whole number, returns the row number (y-coordinate)

      stroke(#F9FA3F); //toned down yellow (can be altered)
      //assign a particular hue to lower values.
      point(i % img.width, floor(i/img.width));
    }

    else { //iterate through all of the pixels in the source image
      if (brightness(img.pixels[i]) < thresh) { 
        //if the brightness of a pixel is below threshold, draw a point.
        // simple algorithm to recover x,y coordinates from an image array index:
        // x = divide the index by the width of the image, the remainder (modulo) will be the x-coordinate of the row
        // y = i divided by image width, rounded to the nearest whole number, returns the row number (y-coordinate)
        stroke(#B72323);//toned down red (can be changed)
        //assign a particular hue to higher values.
        point(i % img.width, floor(i/img.width));
      }
    }
  }
}


