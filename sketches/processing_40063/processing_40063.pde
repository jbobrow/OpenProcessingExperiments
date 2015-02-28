
//Homework 6.2B_Arrays: Image Revisualization
//Created by Adrianne Blossom
//September 30, 2011

PImage pic;
PImage pic2;

int pColors; //Image colors as source for fill colors
int distance=12; //Integer that controls distance of square in width & height
//as well as, spacing

void setup() {
  size(300, 300);
  pic=loadImage("cPencils.jpg"); //Insert image to use
  pic2=loadImage("Sunset.jpg"); //Second image used in mousePressed

    noStroke();
  rectMode(CENTER); //Want squares to be drawn from center point in grid
}

void draw() {
  background(255, 255, 255); //white background

  for (int x=distance; x<=299-distance+1; x+=13) {
    for (int y=distance; y<=299-distance+1; y+=13) {



      fill(pColors=color(pic.pixels[x+(y*300)])); //Fill colors taken from image file
      float area=distance*(brightness(pic.pixels[x+(y*300)])/255);
      rect(x, y, area, area);

      if (mousePressed) {
        fill(pColors=color(pic2.pixels[x+(y*300)])); //Uses colors from image 2
        float area2=(distance/50)*(saturation(pic.pixels[x+(y*300)])/255);
        rect(x, y, area*1.25, area*1.25); //Second area coordinate extends squares along the height in a column
      }
    }
  }
}


