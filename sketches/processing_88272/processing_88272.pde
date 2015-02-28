
PImage fish1; // 300 x 100
PImage fish2; //640 x 291
PImage fish3; // 640 x 393
PImage fish4; // 640, 494
PImage fish5; // 640, 278

void setup () {
  size (600, 600);
  imageMode (CENTER);
  fish1 = loadImage ("fish1.jpg");
  fish2 = loadImage ("fish2.jpg");
  fish3 = loadImage ("fish3.jpg");
  fish4 = loadImage ("fish4.jpg");
  fish5 = loadImage ("fish5.png");
  frameRate (1.5);
}

void draw () {
  background (255);

  float a = random (100, 500);
  float b = random (300, 400);
  float c = random (150, 600);
  float d = random (400, 600);
  float e = random (50, 250);
  float r = random (0 , 20);
  float r2= random (400, 450);


  image (fish4, e, d, 640/2, 494/2);
  image (fish2, a, b/3, 640/2, 291/2);
  image (fish1, c, (b/3)+100, 300, 100);
  image (fish3, d, b, 640/3, 393/3);  
  image (fish5, r2, r, 640/3, 278/3); // dead fish
}



