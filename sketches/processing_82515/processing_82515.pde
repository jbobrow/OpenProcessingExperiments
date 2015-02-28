
//special thanks to david woo 

import processing.video.*;
Movie movie; 
color[][] colorsFromMovie;

void setup() {
  size(400, 169);
  colorsFromMovie = new color [width][height];
  movie = new Movie(this, "CLIP.mp4"); 
  movie.loop();
}


void movieEvent(Movie movie) {
  movie.read();
  movie.loadPixels();

  for (int y = 0; y < height; y ++) { 
    for (int x = 0; x < width; x ++) {
      colorsFromMovie[x][y] = movie.get(x, y);
    }
  }
}





void draw () {
  for (int y = 0; y < height; y ++) {
    for (int x = 0; x < width; x ++) {

      float r = red (colorsFromMovie[x][y]);
      float g = green (colorsFromMovie[x][y]);
      float b = blue (colorsFromMovie[x][y]);

      float distance = dist (x, y, mouseX, mouseY);

      float adjBrightness = (70 - distance)/ 70;

      r *= adjBrightness;
      g *= adjBrightness;
      b *= adjBrightness;


      color c = color (r, g, b);
      stroke(c);
      point(x,y);
    }
  }

}

