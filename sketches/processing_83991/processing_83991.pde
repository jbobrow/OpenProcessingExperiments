
import processing.video.*;

Capture video;

PImage pFrame;

//loading camera and double capture

float threshold = 300;


void setup() {

  size (1280, 960, P3D);

  video = new Capture (this, width, height, 15);

  pFrame = createImage(video.width, video.height, RGB);
  
  background(0);
}

void keyPressed() {
  
  if(keyPressed) {
   
  if (key == 'A' || key == 'a') {
    threshold = 200;
   } else if (key == 'S' || key == 's') {
    threshold = 100;
    
  } 
 }
}

//changing threshold

void draw() {

  if (video.available()) {

    pFrame.copy(video,0,0,video.width,video.height,0,0,video.width,video.height);

    pFrame.updatePixels();

    video.read();

  }

  loadPixels();

  video.loadPixels();

  pFrame.loadPixels();

  for (int x=0; x < video.width; x++) {

    for (int y=0; y < video.height; y++) {

      int loc = x + y*video.width;

      color nowColor = video.pixels[loc];

      color pColor = pFrame.pixels[loc];

      float r1 = red(nowColor);

      float g1 = green(nowColor);

      float b1 = blue(nowColor);

      float r2 = red(pColor);

      float g2 = green(pColor);

      float b2 = blue(pColor);

      float d = dist(r1, g1, b1, r2, g2, b2);

//recognizing color

      if (d > threshold) { 
        pushMatrix();
        
        int ywhkvy, xwhkvy;
        //pixels[loc] = color(0);
        ywhkvy = loc/width;
        xwhkvy = loc%width;
        
        //translate color point into X & Y point
    
      
        noStroke();
        fill(255,255,255,100);
       translate(xwhkvy, ywhkvy);
        box(20,20,20);
        popMatrix();
        
        // create box on variable space

        
      } else {

        pixels[loc] = color(0);

      }

    }

  }

  updatePixels();

}



