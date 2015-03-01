
 
import processing.video.*;

// taille des cellules dans la grille
int cellSize = 40;
// définir colones et lignes
int cols, rows;
// Variable video
Capture video;


void setup() {
  size(640, 480);
  // nombre colones et lignes
  cols = width / cellSize;
  rows = height / cellSize;
  colorMode(RGB, 255, 255, 255, 255);
  rectMode(CENTER);

  // webcam
  video = new Capture(this, width, height);
  
  //commencer capter images
  video.start();  

  background(0);
}


void draw() { 
  if (video.available()) {
    video.read();
    video.loadPixels();
    
    background(0);

    // mouvements colonnes
    for (int i = 0; i < cols;i++) {
      // mouvement lignes
      for (int j = 0; j < rows;j++) {

        // pixels
        int x = i * cellSize;
        int y = j * cellSize;
        int loc = (video.width - x - 1) + y*video.width;

        // 
        color c = video.pixels[loc];
        float sz = (brightness(c) / 100) * cellSize;
        fill(0);
      stroke(100);
     ellipse(x + cellSize/3, y + cellSize/3, sz, sz);
      fill(0);
      stroke(100);
      ellipse(x + cellSize/2, y + cellSize/2, sz, sz);
      
      }
    }
  }
}


