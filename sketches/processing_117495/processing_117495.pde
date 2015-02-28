
//Code by: Christopher Feth
//Reference code: Framingham by Ben Fry

import processing.video.*;

Capture video;
int column;
int columnCount;
int lastRow;
int[] scoot;


void setup() {
  size(1920, 960);
  frameRate(.5);

  video = new Capture(this, 320, 240);
  video.start(); 
  
  column = 0;
  columnCount = width / video.width;
  int rowCount = height / video.height;
  lastRow = rowCount - 1;
  
  scoot = new int[lastRow*video.height * width];
  background(0);
}


void draw() {
  tint(random(0,255), random(0,255), random(0,255));
  if (video.available()) {
    video.read();
    video.filter(THRESHOLD);
    video.loadPixels();
    image(video, video.width*column, video.height*lastRow);
  
    column++;
    if (column == columnCount) {
      loadPixels();
        
      arrayCopy(pixels, video.height*width, scoot, 0, scoot.length);
      arrayCopy(scoot, 0, pixels, 0, scoot.length);
      
      for (int i = scoot.length; i < width*height; i++) {
        pixels[i] = #000000;
      }
      column = 0;
      updatePixels();
    }
  }
}

void mouseClicked() {
 saveFrame("mypic-####.jpeg");
   }
