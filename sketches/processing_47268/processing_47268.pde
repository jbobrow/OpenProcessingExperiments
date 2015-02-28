
/**
 * espejo interactivo
 * by mariana carranza.   
 */

import processing.video.*;

Movie myMovie;

color black = color(0);
color white = color(255);
int x, y;
PImage img1, img2, img3, img4;



void setup() {

  size(630, 480, P2D); 

  frameRate(25);
  myMovie = new Movie(this, "vestidoII.mp4");
  myMovie.loop();

  img1 = createImage(320, 240, RGB);
  img2 = createImage(320, 240, RGB);
  img3 = createImage(320, 240, RGB);
  img4 = createImage(320, 240, RGB);
  smooth();
}

void draw() { 
  myMovie.loadPixels();

  for (int i=0; i < myMovie.pixels.length; i++) {
    img1.pixels[i] = myMovie.pixels[i];
  }
  img1.updatePixels();

  for (int i = 0; i < myMovie.pixels.length;i++) {
    img2.pixels [i] = myMovie.pixels [myMovie.width + i - 2 * (i % myMovie.width)-1];
  }
  img2.updatePixels(); // muestra la captura en espejo  

  for (int i=0; i < myMovie.pixels.length; i++) {
    img3.pixels[i] =img1.pixels[myMovie.pixels.length-i-1];
  }
  img3.updatePixels();

  for (int i=0; i < myMovie.pixels.length; i++) {
    img4.pixels[i] =img2.pixels[myMovie.pixels.length-i-1];
  }
  img4.updatePixels();

  x = int(mouseX/4);
  y = int(mouseY/4);

  //image(img3, 0, 0);
  copy(img3, 0, 0, img3.width-x, img4.height-y, x, y, img3.width-x, img3.height-y);
  //image(img4, w, 0);
  copy(img4, x, 0, img4.width-x, img4.height-y, width/2, y, img4.width-x, img4.height-y);
  //image(img2, 0, h);
  copy(img2, 0, y, img2.width-x, img4.height-y, x, height/2, img2.width-x, img2.height-y);
  //image(img1, w, h);
  copy(img1, x, y, img1.width-x, img1.height-y, width/2, height/2, img1.width-x, img1.height-y);
}




