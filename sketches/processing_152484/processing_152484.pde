

PFont myFont, AvenirFont; 
PImage img;

void setup() {
size (600, 600);
textSize(18);
myFont = loadFont("AGaramondPro-Regular-48.vlw");
AvenirFont = loadFont("AvenirNext-Medium-48.vlw");
img = loadImage("cat.png");
textLeading(20);
textAlign(CENTER, CENTER);
fill(0);

}

void draw() {
  background(255);
  // image(img, mouseX, mouseY, width/2, height/2);
  image(img, mouseX, mouseY, width/2, height/2);
  textFont(myFont);
  text("natthe", width/2, height/2);
textFont(AvenirFont);
text("processes", width/2, height/4);

  }
