
PImage galaxy;
PImage guy;
PImage spaceman;
PImage bluedot;

void setup() {
  size(600, 300);
  galaxy = loadImage("bg.png");
  guy = loadImage("guy1.png");
  spaceman = loadImage("spaceman.png");
  bluedot = loadImage("blue.png");



  frameRate(2);
  imageMode(CENTER);
}

void draw() {
  background(0);
  float x = random(width);
  float y = random(height);
  float d = random(100, 300);
  float blueX = random(100, 300);
  float g = random(-10,10);
  image(galaxy, width/2-g, height/2+g, width+15, height+15);
  image(bluedot, blueX, y, d*2, d*2);
  image(guy, x, y, d, d);
  image(spaceman, width-x, height-y, d, d);
}


