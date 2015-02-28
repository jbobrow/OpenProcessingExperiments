
PImage img; //fatghost variable
PImage img2; //birdghost variable
PImage img3; //girl variable
PImage img4; //background

int startX = 20; //fatghost start
int stopX = 500; //fatghost stop
int startY = 30; //fatghost start
int stopY = 80; //fatghost stop
float x = startX;  //fatghost var
float y = startY; //fatghost var
float step = 0.005; //fatghost speed
float pct = 0.0; //fatghost idk

float speed = 2.5;  //birdghost speed
int diameter = 50;  //birdghost size
float d; //birdghost variable1
float f; //birdghost variable2

float angle = 0.0; //birdspiral
float offset = 200; //birdspiral
float scalar = 2; //birdspiral
float speed2 = 0.05; //birdspiral speed


int j = 250;
int k = 500;

void setup() {
  size (600, 600);
  smooth();
  d = width/2;  //birdghost sizeadjust
  f = height/2; //birdghost sizeadjust
  img4 = loadImage("Background.png");
  img3 = loadImage("GirlFront.png");
  img2 = loadImage("GhostBird.png");
  img = loadImage("GhostFat.png");
}

void draw() { 
  background(0);
  image (img4, 0, 0); //background image
  
        image(img3, j, k); //girl upload
  if (keyPressed && (key == CODED)) {  //arrowkeys for character
    if (keyCode == LEFT) {
      j--;
    } else if (keyCode == RIGHT) {
      j++;
    }
    if (keyPressed && (key == CODED)) {
    if (keyCode == UP) {
      k--;
    } else if (keyCode == DOWN) {
      k++;
    }
  }
  }
  
 
  
  float g = offset + cos(angle) * scalar; //birdspiral
  float h = offset + sin(angle) * scalar; //birdspiral
  image(img2, g, h); //birdspiral upload
  angle += speed2; //birdspiral
  scalar += speed2; //birdspiral
  
  
  d += random(-speed, speed); //birdghost movement 1
  f += random(-speed, speed); //birdghost movement 2
  image(img2, d, f, diameter, diameter); //birdghost upload
  
  
  if (pct < 1.0) {
    x = startX + ((stopX-startX) * pct);  //fat movement
    y = startY + ((stopY-startY) * pct); //fat movement
    pct += step;
  }
  image(img, x, y); //fatghost image upload
 
}


