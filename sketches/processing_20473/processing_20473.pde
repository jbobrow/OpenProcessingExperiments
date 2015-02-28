
PImage FM2;

void setup () {
  size (300, 300);
  FM2 = loadImage("Camera.png");
  noStroke();
  smooth();
  background(255);
  frameRate (1000);
}

float Red,Green,Blue = 0;
int counter = 0;
float x = 0;


void draw() {
    Red = int(red(FM2.pixels[counter]));
  Green = int(green(FM2.pixels[counter]));
  Blue = int(blue(FM2.pixels[counter]));

    fill (Red, Green, Blue);
    rectMode (CENTER);
    ellipse (x, width/2, Red/2, Red/2);


    counter++;
    x++;

    if (x> width) {
      x = 0;
    }
  println("counter = " + counter);
}



