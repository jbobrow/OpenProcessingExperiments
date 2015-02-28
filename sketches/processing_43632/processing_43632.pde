
//Stephanie Callaghan
//Project 2
//This system is an adaptation of the "Image Walker" lab demonstration.
//Uses an Image's pixel information to create a system of objects that "paint".


PImage img;
int num = 100; //number of painters
Painter [] Painters = new Painter[num];

void setup() {
  size(300, 300);
  img = loadImage("AbstractArt.jpg");
  background(255);
  img.loadPixels();

  for (int i=0;i<num;i++) {
    float x = random(width);
    float y = random(height);
    if (img.get(int(x), int(y)) == color(0)) { //extracting pixel data from image
      i--;
    }
    else {
      Painters[i] = new Painter(x, y);
    }
  }
}

void draw() {
  for (int i=0; i<num; i++) {
    Painters[i].paint();
    Painters[i].trail();
  }
}

class Painter {
  float x;
  float y;
  float xv = random(1);
  float yv = random(1);

  Painter(float x_, float y_) {
    x=x_;
    y=y_;
  }

  void paint() { // determines the way that the objects "paint" within the sketch
    x+=xv;
    y+=yv;

    if (x>width) x = 0;
    if (x<0) x = width;
    if (y>height) y = 0;
    if (y<0) y = height;

    if (img.get(int(x), int(y)) != color(255)) {// extracting pixel data from image
      if (random(2)>1) {      
        yv = -yv; // setting the way the objects will move on y axis
      }
      else {
        xv = -xv; // setting the way the objects will move on the x axis
      }
    }
  }

  void trail() { // creates a trail after each object
    stroke(random(0,width),random(0,width),random(0,width)); // random stroke color
    ellipse(x, y, 5, 5); // location and size of objects drawn
  }
}


