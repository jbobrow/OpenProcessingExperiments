
PImage myBackground;
PImage rose;
int roseX = -40;
int roseY = 0;
boolean roseShowing = false;
float roseTint = 255;
PImage petal1;
PImage petal2;
int petalOneX = 100;
int petalOneY = 100;
int petalTwoX = 80;
int petalTwoY = 80;
boolean petal1ReverseX = false;
boolean petal1ReverseY = false;
boolean petal2ReverseX = false;
boolean petal2ReverseY = false;
float fallingPetalOneX = 5;
float fallingPetalOneY = 4;
float fallingPetalTwoX = 10;
float fallingPetalTwoY = 4;
float frames = 0;

void setup() {
  size(451, 900);
  myBackground = loadImage("rose_background2.jpg");
  rose = loadImage("Rose.png");
  frameRate (30);
  petal1 = loadImage("rose_petal_one.png");
  petal2 = loadImage("rose_petal_two.png");
}

void draw() {
  imageMode(CORNER);
  image(myBackground, 0, 0, 451, 900);
  imageMode(CENTER);
  image(petal1, petalOneX, petalOneY, 100, 80);

  if (roseShowing) {
    tint(255, roseTint);
    image(rose, roseX, roseY, 120, 120);
    roseTint--;
  }

  if (!roseShowing) {
    roseTint = 0;
  }
  
  fallingPetalOneX *= -.9;
  petalOneX +=fallingPetalOneX;

  if (petalOneY < 475 || petalOneY > 25) {
    petalOneY+=1;
}
}

//interactive section
void mousePressed() {
  roseShowing = true;
  roseX = mouseX;
  roseY = mouseY;
  roseTint = 255;
  petalOneX = mouseX;
  petalOneY = mouseY;
  petalTwoX = mouseX;
  petalTwoY = mouseY;
  
}







