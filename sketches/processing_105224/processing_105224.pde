
PImage bunny;
PFont codeLight60;

void setup() {
  size(800, 600);
  bunny = loadImage("cage.jpg");
  codeLight60 = loadFont("Code-Light-60.vlw");
}

void draw() {
  image(bunny, 0, 0, 100, 100);
  //  image(bunny, 0, 0, mouseX, mouseY);
  
  textFont(codeLight60);
  fill(0); // change text color to black
  text("I LOVE CODE", 100, 300);
}



