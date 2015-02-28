
import processing.pdf.*;

/**
 * Wallpaper Assignment
 * by Ariel Liu
 */

void setup() {
  size(500, 500);
}

void draw() {
  color c1 = color(0xD2, 0xFC, 0xED);
  color c2 = color(0xc5, 0xeb, 0xb5);
  for(int i = 0; i < height; i++) {
    stroke(lerpColor(c1,c2,(float)i/height));
    line(0,i, width, i);
  }
  smooth();
  noStroke();
  bamboo();
}

void bamboo() {
  
    color c1 = color(0xA3, 0xEA, 0xB8, 50);
    color c2 = color(0xC6, 0xA8, 0x70, 50);
  for (int j = 0; j < 21; j++) {
    fill(lerpColor(c1,c2,(float)j/21));
    beginShape();
    vertex(-10, j*height/20);
    for (int i = 0; i < 21; i++) {
      bezierVertex(i*width/20, j*height/20, 
      i*width/20 + 30, j*height/10 + 60, 
      i*width/20, j*height/20);
    }
    endShape();
  }
}
                                
