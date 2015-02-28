
//All images are my own.  11 images each one produced with a series of small ellipses

int num = 500;
PImage pic1;
PImage pic2;
PImage pic3;
PImage pic4;
PImage pic5;
PImage pic6;
PImage pic7;
PImage pic8;
PImage pic9;
PImage pic10;
PImage pic11;

Path[] myPath = new Path [num];


void setup() {

  //the eleven pictures by name
  pic1 = loadImage("Firenze.JPG");
  pic2 = loadImage("Fontana.JPG");
  pic3 = loadImage("Fresco.JPG");
  pic4 = loadImage("Kriz.JPG");
  pic5 = loadImage("Mantova.JPG");
  pic6 = loadImage("Maria.JPG");
  pic7 = loadImage("Merkur.JPG");
  pic8 = loadImage("Milan.JPG");
  pic9 = loadImage("Palladio.JPG");
  pic10 = loadImage("Plecnik.JPG");
  pic11 = loadImage("Vecchio.JPG");

  size(600, 800);
  background(255);
  smooth();

  for (int i=0; i<myPath.length; i++) {
    myPath[i] = new Path();
  }
}

void draw() {
  for (int i=0; i < myPath.length; i++) {
    myPath[i].update();
    myPath[i].display();
  }
}

class Path {
  int x = int(random(width));
  int y = int(random (height));
  void update() {
    x = x + int(random (-10, 10));
    y = y + int(random (-10, 10));
  }


  void display() {

    //this series of if statements triggers each seperate image generation
    //

    if (keyPressed) {
      if (key == '1') {        
        color c = pic1.get(x, y); //color form the location of the image
        stroke(c); //this color then becomes the color of the new ellipse
        fill(c);
        ellipse (x, y, 5, 5);
      }
    }
    if (keyPressed) {
      if (key == '2') {
        color c = pic2.get(x, y);
        stroke(c);
        fill(c);
        ellipse (x, y, 5, 5);
      }
    }
    if (keyPressed) {
      if (key == '3') {        
        color c = pic3.get(x, y);
        stroke(c);
        fill(c);
        ellipse (x, y, 5, 5);
      }
    }
    if (keyPressed) {
      if (key == '4') {        
        color c = pic4.get(x, y);
        stroke(c);
        fill(c);
        ellipse (x, y, 5, 5);
      }
    }
    if (keyPressed) {
      if (key == '5') {        
        color c = pic5.get(x, y);
        stroke(c);
        fill(c);
        ellipse (x, y, 5, 5);
      }
    }
    if (keyPressed) {
      if (key == '6') {        
        color c = pic6.get(x, y);
        stroke(c);
        fill(c);
        ellipse (x, y, 5, 5);
      }
    }
    if (keyPressed) {
      if (key == '7') {        
        color c = pic7.get(x, y);
        stroke(c);
        fill(c);
        ellipse (x, y, 5, 5);
      }
    }
    if (keyPressed) {
      if (key == '8') {        
        color c = pic8.get(x, y);
        stroke(c);
        fill(c);
        ellipse (x, y, 5, 5);
      }
    }
    if (keyPressed) {
      if (key == '9') {        
        color c = pic9.get(x, y);
        stroke(c);
        fill(c);
        ellipse (x, y, 5, 5);
      }
    }
    if (keyPressed) {
      if (key == '0') {        
        color c = pic10.get(x, y);
        stroke(c);
        fill(c);
        ellipse (x, y, 5, 5);
      }
    }
    if (keyPressed) {
      if (key == 'a') {        
        color c = pic11.get(x, y);
        stroke(c);
        fill(c);
        ellipse (x, y, 5, 5);
      }
    }
  }
}


