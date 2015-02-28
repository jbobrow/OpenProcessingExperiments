
PImage one;
PImage two;
PImage three;
PImage four;
PImage five;
PImage six;
 
void setup(){
  size(500, 500);
  one = loadImage("img1.jpg");
  two = loadImage("img2.jpg");
  three = loadImage("img3.jpg");
  four = loadImage("img4.jpg");
  five = loadImage("img5.jpg");
  six = loadImage("img6.jpg");
}
 
void draw(){
  image(two, 0, 0, 500, 500);
  image(one, 0, 0, 212, 133);
  image(three, 0, 349, 203, 151);
  image(four, 248, 332, 252, 168);
  image(five, 290, 0, 210, 156);
  image(six, 0,170,200,150);
}


