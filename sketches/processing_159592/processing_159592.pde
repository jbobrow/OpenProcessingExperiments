
PImage img;
PImage img2;
PImage img3;
PImage img4;
PImage img5;

void setup() {
  size(1200, 600);
  background(0);
  img = loadImage("Human Outline.jpg");
  img2 = loadImage("Lecture Hall.jpg");
  img3 = loadImage ("Friends Lovers.jpg");
  img4 = loadImage ("Parent Child.jpg");
  img5 = loadImage ("Earth.jpg");
  
}

void draw() {
  image(img, 500, 400, 200, 250);
  image(img2, 80, 320, 200, 180);
  image(img3, 910, 70, 240, 190);
  image (img4, 200, 70, 220, 170);
  image(img5, 850, 370, 200, 200);
  stroke(255);
  strokeWeight(1);
  line(400, 600, 580, 0);
  line(800, 600, 620, 0);
  
}


