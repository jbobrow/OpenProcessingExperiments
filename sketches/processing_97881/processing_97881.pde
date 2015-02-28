
Bird[] birds = new Bird[100];
Bird myBird1;
void setup() {
  size(1200, 1000);
  smooth();
    for (int i = 0; i<birds.length; i++) {
    float x = random(-500,400);
    float k = 600 + random(100,300);
    float y = random(height);
    birds[i] = new Bird("Bird2", 1, k, 40,x, y, 60, 0.1, 0.0, 60, 0.05,random(2,9));
  }
}
void draw() {
  background(0);
imageMode(CORNER);
 
  for (int i = 0; i < birds.length; i++) {
    birds[i].bounce();
    birds[i].move();
  }
}
 
 
class Bird {
  PImage[] images;
  int imageCount;
  int frame;
  int xpos;
  int ypos;
  float startPostionX;
  float startPositionY;
  float angle;
  float num;
  float offset;
  float scalar;
  float speed;
  int XSpeed;
  int direction;
  PImage img;
  Bird(String imagePrefix, int count, int tempXpos, int tempYpos, float tempStartPositionX, float tempStartPostionY, float tempOffset, float tempAngle, float tempNum, float tempScalar, float tempSpeed, int tempXspeed) {
    xpos = tempXpos;
    ypos = tempYpos;
    startPostionX = tempStartPositionX;
    startPositionY = tempStartPostionY;
    offset = tempOffset;
    angle = tempAngle;
    num = tempNum;
    scalar = tempScalar;   
    speed = tempSpeed;
    XSpeed = tempXspeed;
    imageCount = count;
    images = new PImage[imageCount];
    for (int i = 0; i < imageCount; i++) {
      String filename = imagePrefix + nf(i, 4) + ".png";
      images[i] = loadImage(filename);
    }
  }
  void move() {
    xpos = xpos - XSpeed;
}
  void bounce() {
        imageMode(CORNER);
    frame = (frame+1) % imageCount;
    float y1 = offset + sin(angle + num)*scalar;
    image(images[frame], startPostionX + xpos, startPositionY + y1);
    angle += speed;
  }
}




