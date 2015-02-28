
//--------------------------------------
// computer art 2012
// by antonio at 0280.org/processing
//---------------------------------------
// Rendering and Printing 
//---------------------------------------

PImage video;

void setup() {
  size(500,500);
  background(255);
  video = loadImage("turing.jpg");
  noLoop();
  noFill();
}
int index=0;
int res=28;
int i = 0;

void draw() { 
  //image(video, 0, 0);
    for (int y = 0; y < video.height; y++) {

    for (int x = 0; x < video.width; x++) {
      int pixelColor = video.pixels[index];
      // Move to the next pixel
      index++;
      // Jump pixel
      if (i < res) {
          i++;
          } else {
          strokeWeight(1);
          stroke(pixelColor);
          ellipse(x,y,random(res),random(res));
          i=0;
      }
    }
  }
}

