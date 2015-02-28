
//Variable
PImage ima;
PImage tru;
PFont myFont;
PFont mySecondFont;
//Setup
void setup() {
  size (720, 480);
  //Load images
  ima = loadImage("grass.jpg");
  tru = loadImage("truck.png");
  //Load Fonts
  myFont = loadFont("Vibrocentric-Regular-48.vlw");
  mySecondFont = loadFont("WalkwayObliqueExpand-48.vlw");
}
//Draw
void draw() {
  //image 1
  image(ima, 0, 0, 720, 480);
  //image 2
  image(tru, mouseX-80, mouseY-100);
  //Font1
  fill(255, 255, 255);
  textFont(myFont);
  text("GRASS", 20, 60);
  textSize(200);
  //Font2
  fill(255, 255, 255);
  textFont(mySecondFont);
  text("CUTTER", 10, 96);
  textSize(200);
}


