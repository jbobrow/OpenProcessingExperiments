
PImage img;
PImage img2;
PFont font;

void setup(){
  size(800, 400);
  img = loadImage("Background.jpg");
  img2 = loadImage("House.gif");
  font = loadFont("AngsanaNew-48.vlw");
  textFont(font);
}

void draw(){
  image(img, 0, 0);
  image(img2, 600, 200);
  image(img2, 700, 188);
  textSize(48);
  text("In a world", 100, 300);
  textSize(36);
  text("Where tablet drivers don't exist...", 60, 360);
  
}


