
//variables
PImage bgimage;
PImage menu1;
PImage circle;
PImage clicker;
PImage click_me;

PImage minus;
PImage plus;
PImage spnge;
PImage switch1;
PImage menu2;


void setup() {
  size(1000, 667);
  bgimage = loadImage("background.jpg");
  menu1 = loadImage("menu1.png");
  circle = loadImage("circle.png");
  minus = loadImage("minus.png");
  plus = loadImage("plus.png");
  spnge = loadImage("spnge.png");
  switch1 = loadImage("switch1.png");
  menu2 = loadImage("menu2.png");
  clicker = loadImage("clicker.png");
  click_me = loadImage("click-me.png");
  
}

void draw() {
  background(255);
  image(bgimage, 0, 0, 1000, 667);
  image(menu1, 44, 110, 339, 468);
  image(circle, 667, 294, 42, 42);
  image(clicker, 126, 383, 192, 22);
  image(click_me, 132, 436, 197, 46);
  image(minus, 664, 236, 42, 42);
  image(plus, 605, 237, 42, 42);
  image(spnge, 401, 232, 180, 151);
  image(switch1, 605, 292, 43, 43);
  image(menu2, 401, 126, 474, 66);
  
}



