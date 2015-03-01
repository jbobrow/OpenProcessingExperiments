
PImage img;

void setup() {
  size(640,400);
  //The standard colour of the BSOD
  background(0,0,170);
  //The white text is a .png
  img = loadImage ("BSOD_Text.png");
}

void draw() {
  image(img,0,0);
  //Colour randomizer
  if (keyPressed == true) {
    float r = random(256);
    float g = random(256);
    float b = random(256);
    background(r,g,b);
  }
}



