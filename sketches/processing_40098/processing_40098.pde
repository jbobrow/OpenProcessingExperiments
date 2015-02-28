
//The image is of a glass art installation at the Milwaukee Public Art Museum
//I incorported various codes off of the Lab examples in my composition. (dot filter)
PImage img;

void setup() {
  size(300, 300);
  img = loadImage("Glass.jpg");

  noStroke();
  smooth();
  background(img);// sets the image as a flat background
  set(0, 0, img);
  frameRate(3);
}

int cell =7; 

void draw() {

  for (int y=0; y <= 299; y+=cell) {    //fills the screen with the image color 
    for (int x=0; x <= 299; x+=cell) {


      color myFill = color(img.pixels[x + (y *300)]);
      fill(myFill, 30);//derived from the image color pallette


      float length = cell * (brightness(img.pixels[x + (y * 300)]) / 50);
      rect(random(x), random(y), random(length), random(length));
      //fills frame with randomly sized/ positioned rectangles that overlap/ layer
    }
  }
}


