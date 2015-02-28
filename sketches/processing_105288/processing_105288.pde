
PFont title;
PFont chinese;
boolean mouseOnTop;
boolean mouseOnLeft;
PImage blue;
PImage red;
PImage bluewall;
PImage redwall;


void setup() {
  size(800, 600);
  title = loadFont("Dialog-36.vlw"); 
  chinese = loadFont("ARFangSongB5-Bold-40.vlw");

  mouseOnTop = false;
  mouseOnLeft = false;
  blue = loadImage("blue-01.jpg");
  red = loadImage("red-01.jpg");
  bluewall = loadImage("bluewall-02.jpg");
  redwall = loadImage("redwall-02.jpg");
}

void draw() {
  background(0);
  image(bluewall, 0, 300, 400, 300);
  image(redwall, 400, 300, 400, 300);

  if (mouseX >= width/2) {
    mouseOnLeft = false;
  }
  else {
    mouseOnLeft = true;
  }
  if (mouseY >= height/2) {
    mouseOnTop = false;
  }
  else {
    mouseOnTop = true;
  }


  if (mouseOnTop == true) {
    fill(255);
    textFont(title);
    text("move to color!", mouseX, mouseY);
  }

  else {
    if (mouseOnLeft == true) {
      fill(27, 53, 224);
      image(blue, 50, 50, 100, 100);
      textFont(title);
      text("blue", 250, 100);
    }
    else {
      fill(224, 27, 27);
      image(red, 600, 180, 100, 100);
      textFont(title);
      text("red", 450, 230);
    }
  }
}
