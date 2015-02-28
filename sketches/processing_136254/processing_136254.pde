
/*@pjs preload= "doggy1.gif"; */
/*@pjs preload= "pokemon-clouds_00384079.png"; */
/*@pjs preload= "grassy1.png"; */
PImage dog;
PImage sky;
PImage grass;

void setup() {
  size(795, 664);
  dog = loadImage("doggy1.gif");
  sky = loadImage("pokemon-clouds_00384079.png");
  grass = loadImage("grassy1.gif");
}


void draw() {
  background(255);
  int r = round( map(mouseX, 0, width, 0, 255) );
  fill(r, 0, 0);
  float backgroundX=map(mouseX, 0, 1000, 0, 1000);
  float yay=map(mouseX, -100, 1000, 100, -1000);
  image(sky, yay/8, 0);
  sky.resize(1000, 800);
  image(grass, yay/2, 600);
  image(dog, backgroundX, 550);
  dog.resize(100, 100);
}



