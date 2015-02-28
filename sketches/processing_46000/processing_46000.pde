
int numFrames = 14;
PImage moon;

Dancer [] dancers = new Dancer[1];
PImage[] images = new PImage[numFrames];
float gravity = 0.4;

void setup() {
  size(900,675);
  moon = loadImage("earthrise.jpg");
  frameRate(20);
  // Initialize ball index 0
  for (int i=0; i<numFrames; i++) {
    String imageName = "derv" + nf(i+1,3) + ".gif";
    images[i] = loadImage(imageName);
  }
  dancers[0] = new Dancer(width/2,0,219,185);  
}

void draw() {
  background(moon);
  //update and display all balls
  for (int i=0; i<dancers.length; i++) {
    dancers[i].gravity();
    dancers[i].move();
    dancers[i].display();        
  }
}

void mousePressed() {
  //a new ball object
  Dancer d = new Dancer(mouseX,mouseY,219,185);
  
  //append to array
  dancers = (Dancer[]) append(dancers,d);
}

class Dancer {
  float x;
  float y;
  float speed;
  float w;
  float h;
  int frame = 0;
  
  Dancer(float tempX, float tempY, float tempW, float tempH) {
    x = tempX;
    y = tempY;
    w = tempW;
    h = tempH;
    speed = 0;
  }
  
  void gravity() {
    // add gravity and speed
    speed = speed + gravity;
  }
  
  void move() {
    //add speed to y location
    y = y + speed;
    //if square reaches the bottom
    //reverse speed
    if (y > height) {
      speed = speed * -0.9;
      y = height;
    }
  }
  
  void display() {
    //display the circle
    imageMode(CENTER);
    frame = (frame+1) % numFrames;
    image(images[frame],x,y,w,h);
  }
}

