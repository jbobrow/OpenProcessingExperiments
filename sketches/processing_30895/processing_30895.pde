
/**
 * LitePen Drawing
 *  by miminashi
 * 
 * how to use
 *  cariblation
 *    at first drag red slider until the screen completely black.
 *    light on, and drag blue slider to adjust the size of the light spot on the screen.
 *  use
 *    by clicking any place on the scrren, quit cariblation mode and enter edit mode.
 *    to re-cariblate, click ageain.
 */


import processing.video.*;

Capture video;
PImage img;
float blueThreashold;
float redThreashold;

Slider[] sliders = new Slider[2];

boolean cariblation;

void setup() {
  size(640, 480); // Change size to 320 x 240 if too slow at 640 x 480
  // Uses the default video input, see the reference if this causes an error
  video = new Capture(this, width, height, 30);
  img = createImage(video.width, video.height, RGB);
  //blueThreashold = 220;
  //redThreashold = 70;
  sliders[0] = new Slider(15, 0, 255, color(0, 0, 255));
  sliders[1] = new Slider(35, 0, 255, color(255, 0, 0));
  cariblation = true;
  noStroke();
  smooth();
}

void draw() {
  if (video.available()) {
    video.read();
    
    if(cariblation) {
      for(int i=0; i < img.width * img.height; i++) {
        img.pixels[i] = color(0,0,0);
      }
    }

    int blueX = 0;
    int blueY = 0;
    
    //float brightestValue = 0; // Brightness of the brightest video pixel
    float redValue = 0;
    float greenValue = 0;
    float blueValue = 0;
    // Search for the brightest pixel: For each row of pixels in the video image and
    // for each pixel in the yth row, compute each pixel's index in the video
    video.loadPixels();
    int index = 0;
    
    blueThreashold = sliders[0].value();
    redThreashold = sliders[1].value();
    
    img.loadPixels();
    for (int y = 0; y < video.height; y++) {
      for (int x = 0; x < video.width; x++) {
        // Get the color stored in the pixel
        int pixelValue = video.pixels[index];
        // Determine the brightness of the pixel
        //float pixelBrightness = brightness(pixelValue);
        float pixelBlue = blue(pixelValue);
        float pixelRed = red(pixelValue);
        // If that value is brighter than any previous, then store the
        // brightness of that pixel, as well as its (x,y) location
        
        if (pixelBlue > blueThreashold) {
          if(pixelRed < redThreashold) {
            img.pixels[index] = color(255, 255, 255);
          }
        }

        index++;
      }
    }
    img.updatePixels();
    
    image(img, 0, 0, width, height);
    
  }
  
  for(int i=0; i < sliders.length; i++) {
    sliders[i].draw();
  }
}

void mousePressed() {
  for(int i=0; i < sliders.length; i++) {
    sliders[i].onMousePressed();
  }
}

void mouseReleased() {
  for(int i=0; i < sliders.length; i++) {
    sliders[i].onMouseReleased();
  }
}

void mouseDragged() {
  println(mouseY);
  for(int i=0; i < sliders.length; i++) {
    sliders[i].move();
  }
}

void mouseClicked() {
  if(cariblation) {
    cariblation = false;
  }
  else {
    cariblation = true;
  }
}

class Slider {
  int x, y, top, bottom, radius, offsetY;
  float max, min;
  color handleColor;
  boolean moving;
  
  Slider(int _x, float max, float min, color c) {
    top = 10;
    bottom = height - 10;
    radius = 5;
    x = _x;
    y = height/2;
    handleColor = c;
    moving = false;
  }

  // call from draw()
  void draw() {
    stroke(255,255,255);
    line(x, top, x, bottom);
    fill(handleColor);
    ellipse(x, y, radius*2, radius*2);
  }
  
  // call from mouseMove()
  void move() {
    if(moving && (mouseY + offsetY) >= top && (mouseY + offsetY) <= bottom) {
      y = mouseY + offsetY;
    }
  }
  
  boolean isTouched() {
    boolean ret;
    if(dist(x, y, mouseX, mouseY) < radius) {
      ret = true;
    }
    else {
      ret = false;
    }
    return(ret);
  }
  
  // call from mouseDown()
  void onMousePressed() {
    if(isTouched()) {
      moving = true;
      offsetY = y - mouseY;
    }
  }
  
  void onMouseReleased() {
    moving = false;
  }
  
  float value() {
    return(map(float(y), top, bottom, 0, 255));
  }
}

