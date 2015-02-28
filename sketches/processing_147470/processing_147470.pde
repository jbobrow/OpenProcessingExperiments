
//Emma Grapek - Creative Computing - Section B

PImage mew;
PImage charmander;
PImage squirtle;

void setup() {

  size(400, 400);

  mew = loadImage("mew.png");
  charmander = loadImage("charmander.png");
  squirtle = loadImage("squirtle.png");
}


void draw() {

  float c = map(mouseX, 0, width, 0, 255);
  float c2 = map(mouseX, 0, width, 0, 217);
  background(c,147,c2);

  float mewX = map(mouseX, 0, width, 0, 350 );
  image(mew, mewX, 100);

  float charmanderX = map(mouseX, 0, width, 350, 0 );
  image(charmander, charmanderX, 200);

  float squirtleX = map(mouseX, 0, width, 150, 250 );
  image(squirtle, squirtleX, 300);
}



