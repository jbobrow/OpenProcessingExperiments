

import processing.video.*;

Capture video;
PFont f;

void setup() {
  size(640, 480); // Change size to 320 x 240 if too slow at 640 x 480
  // Uses the default video input, see the reference if this causes an error
  video = new Capture(this, width, height, 30);

  //  AmericanTypewriter-48
  f = loadFont("AmericanTypewriter-48.vlw");
  textFont(f, 48);

  noStroke();
  smooth();
  background(255);
}

void draw() {
  //check if the video cammara is hooked up
  if (video.available()) {
    //grab a frame from the cammera
    video.read();
    if (keyPressed) {
      if (key == ' ') {
        background(255);
      }
      else {
        image(video, 0, 0, width, height); // Draw the webcam video onto the screen
      }
    }
    //this is an index into the pixel array (a long 1D array)
    int index = 0;

    //this is our nested loops to walk through the lines and rows
    for (int y = 0; y < video.height; y++) {
      for (int x = 0; x < video.width; x++) {

        // Get the color stored in the pixel
        float r = red(video.pixels[index]);
        float g = green(video.pixels[index]);
        float b = blue(video.pixels[index]);


        //update the pixel with only one of the colours
        if (!mousePressed) {
          if (r >80 && r < 110 && 
            g >130 && g< 160 && 
            b> 70 && b < 100) {

            video.pixels[index] = color(r, g, b);
            noStroke();
            fill(r, g, b, 40);
            ellipse(width-x+random(10), y+random(10), random(10), random(10));
            //  ellipse(x, y, 10, 10);
          }
          else {

            video.pixels[index] = color(0, 0, 0);
          }
        }
        //step through the pixel array
        index++;
      }
    }

    video.updatePixels();

    // image(video, 0, 0, width, height); // Draw the webcam video onto the screen


    loadPixels();
    index = 0;
    /*
    //this is our nested loops to walk through the lines and rows
     for (int y = 0; y < video.height; y++) {
     for (int x = 0; x < video.width; x++) {
     if (mouseX == x && mouseY == y) {
     
     fill(pixels[index]);
     rect(0, 0, width, 50);
     fill(0);
     text("["+red(pixels[index])+"]["+green(pixels[index])+"]["+blue(pixels[index])+"]", 50, 50);
     println("["+red(pixels[index])+"]["+green(pixels[index])+"]["+blue(pixels[index])+"]");
     }       
     index++;
     }
     }
     */
  }
}


