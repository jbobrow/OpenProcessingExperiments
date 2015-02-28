
// crashCourse processing by Corneel Cannaerts 2014
// imagee & pixels
// loadImage(), image.get(), brightness(color)

/* @pjs preload="pony2.jpg"; */
PImage img;

int numX = 100;
int numY = 100;
float stepX;
float stepY;

void setup() {
  size(600, 600);
  //afbeelding laden
  img = loadImage("pony2.jpg");
  rectMode(CENTER);

  stepX = width / (numX-1);
  stepY = height / (numY-1);
  noLoop();
}


void draw() {
  background(255);
  //image(img, 0, 0);
  for (int i=0; i<numX; i++) {
    for (int j=0; j<numY; j++) {
      //optie 1
      /*
      color c = img.get(int(i*stepX), int(j*stepY));
       fill(c, 10);
       stroke(c,10);
       strokeWeight(8);
       //noStroke();
       // rect(i*stepX, j*stepY, stepX*random(-10,10), stepY*random(-1,1));
       fill(c, 15);
       //line(i*stepX + random(-100, 100), j*stepY + random(-10, 10), stepX*10, stepY*random(-5,5));
       line(i*stepX + random(-100, 100), j*stepY + random(-10, 10), i*stepX + random(-100, 100), j*stepY + random(-10, 10));
       
       // optie 2
       color c = img.get(int(i*stepX), int(j*stepY));
       fill(c,100);
       noStroke();
       float r = red(c);
       float g = green(c);
       rect(i*stepX, j*stepY, r, g);
       */


      // optie 3
      color c = img.get(int(i*stepX), int(j*stepY));
      fill(0);
      noStroke();
      float b = brightness(c);
      float r = red(c);
      rect(i*stepX, j*stepY, b/40, r/30);
    }
  }
}



