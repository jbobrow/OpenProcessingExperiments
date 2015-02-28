
import processing.video.*;
PImage flag;


Capture video;


color trackColor; 

void setup() {

  size(500, 500);
  video = new Capture(this, width, height, 10);

  trackColor = color(360, 0, 0);
  
  flag = loadImage("flag.gif");
  image(flag, 0, 0);
}

void draw() {

  if (video.available()) {
    video.read();
  }
  fill(0, 102, 153);
  video.loadPixels();
  image(video, 0, 0);

  float worldRecord = 300; 


  int closestX = 30;
  int closestY = 30;

  for (int x = 0; x < video.width; x ++ ) {
    for (int y = 0; y < video.height; y ++ ) {
      int loc = x + y*video.width;
      color currentColor = video.pixels[loc];
      float r1 = red(currentColor);
      float g1 = green(currentColor);
      float b1 = blue(currentColor);
      float r2 = red(trackColor);
      float g2 = green(trackColor);
      float b2 = blue(trackColor);


      float d = dist(r1, g1, b1, r2, g2, b2); 

      if (d < worldRecord) {
        worldRecord = d;
        closestX = x;
        closestY = y;
      }
    }
  }


  if (worldRecord < 1) { 

    fill(trackColor);
    noStroke();
    image(flag, closestX, closestY, 80, 80);
  }
}

void mousePressed() {

  int loc = mouseX + mouseY*video.width;
  trackColor = video.pixels[loc];
}


