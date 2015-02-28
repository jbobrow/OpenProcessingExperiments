


//Reference code used from "Learning Processing" by Daniel Shiffman 


import processing.video.*;

PImage testBg;

// Variable for capture device
Capture video;

// Saved background
PImage backgroundImage;

// How different must a pixel be to be a foreground pixel
float threshold = 20;

float randomInt= random(0, 2);
float time = millis();

void setup() {
  size(1280,960);
  video = new Capture(this, width, height, 30);
  video.start();
  // Create an empty image the same size as the video
  backgroundImage = createImage(video.width,video.height,RGB);
  testBg= loadImage("awwyeah.png");
  reset();
}

void draw() {
  reset();
  // Capture video
  if (video.available()) {
    video.read();
  }
  

  
  loadPixels();
  video.loadPixels(); 
  backgroundImage.loadPixels();


  
  
  // Begin loop to walk through every pixel
  for (int x = 0; x < video.width; x ++ ) {
    for (int y = 0; y < video.height; y ++ ) {
      int loc = x + y*video.width; // Step 1, what is the 1D pixel location
      color fgColor = video.pixels[loc]; // Step 2, what is the foreground color
      
  
      color bgColor = backgroundImage.pixels[loc];
      
    
      float r1 = red(fgColor);
      float g1 = green(fgColor);
      float b1 = blue(fgColor);
      float r2 = red(bgColor);
      float g2 = green(bgColor);
      float b2 = blue(bgColor);
      float diff = dist(r1,g1,b1,r2,g2,b2);
      
      
      if (diff > threshold) {
        pixels[loc] = testBg.pixels[loc];
        
      } else {
        pixels[loc] = fgColor;
       
      }
    }
  }
    //refreshes the background
  if (time == randomInt){
    println("SHONUFF");
    
  }
  
  updatePixels();
  
}

void reset() {

  backgroundImage.copy(video,0,0,video.width,video.height,0,0,video.width,video.height);
  backgroundImage.updatePixels();
}


void mouseClicked() {

  backgroundImage.copy(video,0,0,video.width,video.height,0,0,video.width,video.height);
  backgroundImage.updatePixels();
}


