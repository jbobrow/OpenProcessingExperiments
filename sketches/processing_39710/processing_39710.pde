
int numObjects = 10;
int centerX;
int centerY;
int distance = 50;
PImage bkg;

PImage[] icons;

void setup() {
  size(700, 700);
  //noLoop();
  noStroke();
  smooth();
  background(0);
  ellipseMode(CENTER);
  imageMode(CENTER);
  centerX = width/2;
  centerY = height/2;
  icons = new PImage[10];
  icons[0] = loadImage("gem.png");
  icons[1] = loadImage("baby.png");
  icons[2] = loadImage("produce.png");
  icons[3] = loadImage("slave.png");
  icons[4] = loadImage("fish1.png");
  icons[5] = loadImage("mcsmall.png");
  icons[6] = loadImage("civilwar.png");
  icons[7] = loadImage("fish2.png");
  icons[8] = loadImage("llamacolor.png");
  icons[9] = loadImage("monster.png"); 
  bkg = loadImage("caveNebula.jpg");
  frameRate(12);
}
void draw() {
  background(0);
  image(bkg, width/2, height/2);
  fill(0,0,0,100);
  rect(0,0,width,height);
  //divide the circle 360 degrees = 2 * PI = TWO_PI
  //according to the number of objects
  float angleObject = TWO_PI/numObjects;
  float loopDistance = distance;
  for (int ringIndex = 0; ringIndex < numObjects; ringIndex++)
  {
    for (int i=0;i<numObjects;i++)
    {
      
      float posX=centerX + loopDistance *sin(angleObject*i+frameCount/4);
      float posY=centerY + loopDistance *cos(angleObject*i+frameCount/4);
      image(icons[ringIndex], posX, posY);
      
    }
    loopDistance+=25;
  }
}

