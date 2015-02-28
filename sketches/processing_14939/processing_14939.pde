
PImage pic;
PImage pic2;
PImage pic3;
PImage pic4;
PImage pic5;
PImage pic6;

void setup() {
  size(900,400);
  
  pic = loadImage("Microscope 2.jpg");
  pic2 = loadImage("Microscope 6.jpg");
  pic3 = loadImage("Microscope 3.jpg");
  pic4 = loadImage("Microscope 4.jpg");
  pic5 = loadImage("Microscope 5.jpg");
  pic6 = loadImage("Microscope 1.jpg");
}

void draw() {
  background(255,200,200);
  image(pic4,0,0);
  image(pic5,300,0);
  image(pic6,600,0);
  tint(200,150,190,110);
  image(pic,0,0);
  tint(100,200,190,170);
  image(pic2,300,0);
  tint(225,190,100,100);
  image(pic3,600,0);
  
}

