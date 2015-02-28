
/*
* Demonstrates the use of the GifAnimation library.
 * the left animation is looping, the one in the middle 
 * plays once on mouse click and the one in the right
 * is a PImage array. 
 * the first two pause if you hit the spacebar.
 */

import gifAnimation.*;
PImage img;

Gif spider;
float t;
 

public void setup() {
  size(500, 500);
  frameRate(60);

  img = loadImage("wall.jpeg");
  image(img, 0, 0);
  // create the GifAnimation object for playback
  spider = new Gif(this, "spider.gif");
  spider.loop();
  
  
}

void draw() {


 
float xx = map(noise(t), 0., 1., 0, width);
  float yy = map(noise(t * 2.), 0., 1., 0, height);
   //image(gold, i, 100);
    image(spider, xx, yy);
   

  stroke(255, random(10) );
  for (int y=0; y<=height; y+=50) {

    line(0, y, xx + 100, yy + 60);
  }
  stroke(255, random(10) );
  for (int y=0; y<=height; y+=50) {

    line(width, y, xx + 100, yy + 60);
  }
  stroke(255, random(10) );
  for (int x=0; x<=width; x+=50) {

    line(x, 0, xx + 100, yy + 60);
  }
  stroke(255, random(10) );
  for (int x=0; x<=width; x+=50) {

    line(x, height, xx + 100, yy + 60);
  }

  t += 0.01;
}

void mousePressed() {
  image(img, 0, 0);
}


