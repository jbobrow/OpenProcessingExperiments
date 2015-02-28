
 // leyli guliyeva
// project 1

// press up for the circles to increase in size
// press down to decrease in size
// press space bar for the circles to start spinning

import processing.video.*;
int VideoScale = 14;
int cols, rows;
Capture video;
String chars = "O";
PFont font;
int fsize;
int b;
float theta;

void setup () {
  size (600, 400);
  cols = width/VideoScale+2;
  rows = height/VideoScale+2;
  video = new Capture (this, cols, rows, 15);
  font = loadFont("NeutraText-Bold-48.vlw");
  fsize = 13;
  
 
}

void draw () {
  background (0);
  if (video.available()) {
    video.read();
  }
  video.loadPixels();
  
  int charcount = 0;
  
  for (int j = 0; j < rows; j++) {
    for (int i = 0; i < cols; i++) {
      int x = i*VideoScale;
      int y = j*VideoScale;
      
      color c = video.pixels[i+j*video.width];
      
      textFont (font, fsize);
      fill (c) ;
      textAlign(CENTER);
      text (chars.charAt (charcount), x, y);
      charcount = (charcount + 1) % chars.length();
      
      if (key == ' '){
      textFont(font);
      translate (chars.charAt (charcount), chars.charAt (charcount));
      rotate(theta);
      theta +=0.0001;
 } 
    }
  }
}

void keyPressed () {
  if (keyCode == UP) {
    fsize = fsize+3;
    if (fsize > 45) {
      fsize = 45;
    }
  }
  if (keyCode == DOWN) {
    fsize = fsize-3;
    if (fsize < 7) {
      fsize = 7;
    }
  }
 
}
 


