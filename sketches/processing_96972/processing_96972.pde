
PImage one;
PImage two;
PImage three;
PImage four;
PImage five;

void setup(){
  size(500, 400);
  one = loadImage("01.png");
  two = loadImage("02.jpg");
  three = loadImage("03.jpg");
  four = loadImage("04.jpg");
  five = loadImage("05.jpg");
}

void draw(){
  image(one, 0, 0, 300, 200);
  image(two, 250, 0, 300, 200);
  image(four, 260, 200, 300, 200);
  image(three, 0, 200, 300, 200);
  image(five, 150, 160, 200, 170);
}


