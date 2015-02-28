
//  15 Jan 2012
//  http://asymptoticdesign.wordpress.com/
//  This work is licensed under a Creative Commons 3.0 License.
//  (Attribution - NonCommerical - ShareAlike)
//  http://creativecommons.org/licenses/by-nc-sa/3.0/
//  
//  In summary, you are free to copy, distribute, edit, and remix the work.
//  Under the conditions that you attribute the work to me, it is for
//  noncommercial purposes, and if you build upon this work or otherwise alter
//  it, you may only distribute the resulting work under this license.
//
//  Of course, the conditions may be waived with permission from the author.
//
//  Borrowed heavily from Daniel Shiffman's example
//  http://www.learningprocessing.com/examples/chapter-15/example-15-12/
//
//  Included photograph courtesy of Rachel F Boyce (http://www.flickr.com/photos/zaigee/)
//  Also released under Creative Commons 3.0 License
//  (Attribution - NonCommercial - ShareAlike)
//
//  -----------------Description
//
//  A digital photography filter written in Processing.
//  The algorithm takes the brightness value of every pixel in the image
//  compares it to the threshold value, and assigns the pixel black or white
//  This filter was created to convert full color photographs into black/white images
//  ready for laser etching.

//-----------------Globals
PImage target; 
PImage destination;
int threshold = 160;
int mouseCounter = 0;

//-----------------Setup
void setup() {
  size(640,427);
  target = loadImage("data/leaf.jpg");
  destination = createImage(target.width, target.height, RGB);
}

//-----------------Main Loop
void draw() {
  
  target.loadPixels();
  destination.loadPixels();
  //Compare each pixel with its left neighbor, and take the difference of the pixel's .color attribute
  //the difference is compared to a threshold, and that threshold determines if the pixel is black or white
  //because we are looking at left neighbors, start at the second column (otherwise there is no left neighbor!)    
  for (int x = 1; x < width - 1; x++ ) {
    for (int y = 0; y < height; y++ ) {
      
      //snag the location of each pixel
      int loc = x + y*target.width;
      color pix = target.pixels[loc];
      
      //look at the brightness of each pixel, compare it to its left neighbor
      //if the difference is above the threshold value, the pixel becomes white.  Otherwise, make it black.
      //all of the magic is contained it changing the threshold value!
      if (brightness(pix) > threshold) {
        destination.pixels[loc] = color(255);
      }
      else {
      destination.pixels[loc] = color(0);
      }
    }
  }
  
  //Update the pixels in the destination file, show the image, and save it.
  destination.updatePixels();
    if (mouseCounter == 0) {
    image(destination,0,0);
  }
  else {
    image(target,0,0);
  }
}

//-----------------Interactions
//keyPressed(): 
//Press up arrow to increase filter threshold value by 2
//Press down arrow to decrease filter threshold value by 2
//Press any other key to reset the filter to its initial threshold value
void keyPressed() {
  if (key == CODED) {
    if (keyCode == UP) {
      threshold += 2;
    } else if (keyCode == DOWN) {
      threshold -= 2;
    } 
  } else {
    threshold = 160;
  }
}

//mousePressed():
//Press the mouse key to swap back and forth between the target image and the filtered image.
void mousePressed() {
  if (mouseCounter == 0) {
    mouseCounter = 1;
  }
  else {
    mouseCounter = 0;
  }
}

