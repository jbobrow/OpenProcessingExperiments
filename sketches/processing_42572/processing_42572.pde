

PImage imageOne;
PImage imageTwo;

PFont font;
PFont font2;


void setup() {

  background(255);
  size (560, 393);
  imageOne = loadImage("concrete.jpg");
  imageTwo = loadImage("gadget.jpg");

  font = loadFont("CourierNewPSMT-80.vlw");
  font2 = loadFont("HelveticaNeueLTStd-ThExO-48.vlw"); 

  //scale image | start with 0 for proportional scaling


  image(imageTwo, 0, 0);

  imageOne.resize(0, 100);
  image(imageOne, mouseX, mouseY);
}

void draw () {

  //draw font with txt display and size + change color (fill)

  fill(0);

  textFont(font2);
  text("hello", 50, 200);
  textSize(15);

  textFont(font);
  text("world", 90, 230);
  textSize(15);
}


