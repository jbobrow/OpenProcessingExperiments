
float smallCircle = 10;
float frames = 0;
int beeX = 0;
int beeY = 100;
float beeVelX = 3;
float beeVelY = 3;
boolean reverseX = false;
boolean reverseY = false;


void setup() {
  size (500,500);
  frameRate (30);
  img = loadImage("bee.jpg");
}

void draw() {
  background (0);
  noStroke ();
  
  smallCircle = sin(frames)*5+10;
  frames += .1;
  
  for(int i = 0; i < 50; i++){
    for(int j= 0; j < 50; j++){
      fill (random (237,255), 255, random (0,255));
      ellipse (i*10+5, j*10+5, smallCircle,smallCircle);
    }
  }
  noStroke ();
  fill (0);
  image (img, beeVelX, beeVelY, 25,25);
