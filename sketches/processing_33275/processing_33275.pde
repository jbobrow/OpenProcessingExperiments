
/*
  nate rudolph
 aug 8
 bootcamp
 for loops
 "cowboys and aliens"
 */
PImage cowboy;
PImage bg;
PImage alien;


float xPos;
float yPos;
float xCowboyPos;
float yCowboyPos;
int numCowboys;
int numAliens;

void setup() {
  size(900, 500);
  background(#FFFFFF);
  bg = loadImage("bg.jpg");
  cowboy = loadImage("cowboy.png");
  alien = loadImage("alien.png");
  xPos = 1000;
  xCowboyPos = -3000;

  numCowboys = 30;
  numAliens = 15;
}


void draw() {
  yCowboyPos = random(405, 410);
  yPos = random(405, 410);
  smooth();
  imageMode(CENTER);
  image(bg, width/2, height/2);

  for (int i = 0; i < numAliens; i++) {
    image(alien, xPos + 900*i, yPos);
  }

  for (int i = 0; i < numCowboys; i++) {
    image(cowboy, xCowboyPos + 350*i, yCowboyPos);
  }

  xPos -=4;
  xCowboyPos += 4;
}


