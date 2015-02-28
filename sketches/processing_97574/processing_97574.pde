
PImage one;
PImage two;
PImage three;
PImage four;
PImage five;
 
void setup(){
  size(400, 400);
  one = loadImage("happy_land.jpg");
  two = loadImage("land.jpg");
  three = loadImage("buttons.jpg");
  four = loadImage("rose.jpg");
  five = loadImage("callouts.jpg");
}
 
void draw(){
  image(one, 0, 0, 200, 200);
  image(two, 200, 0, 200, 200);
  image(four, 250, 200, 300, 200);
  image(three, -10, 200, 200, 200);
  image(five, 90, 200, 160, 200);
}



