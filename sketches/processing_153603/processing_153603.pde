
PVector A, B, C;

float sizeA = 5;
float sizeB = 25;

int i = 0;

float gridValue = 50;

Cube[] myCubes = new Cube[100];


void setup() {
  size(500, 500);
  for (int x = 0; x < width; x += 50) {
    for (int y = 0; y < height; y += 50) {
      if (i < 100) {
        myCubes[i] = new Cube(x + 25, y + 25, 50);
        i++;
      }
    }
  }
}


void draw() {
  background(0);
  noStroke();
  for (Cube c : myCubes) {
    c.run();
  }
//  saveFrame();
//  if(frameCount == 100){
//    stop();
//  }
}

class Cube {
  float xPos, yPos;
  float size;
  float growthRate = 1;

  Cube(float _xPos, float _yPos, float _size) {
    xPos = _xPos;
    yPos = _yPos;
    size = random(_size);
  }
  
  void run(){
    display();
    grow();
  }

  void display() {
    rectMode(CENTER);
    fill(89, 200, 167, 100);
    rect(xPos, yPos, size, size, 0);
  }
  
  void grow(){
    size += growthRate;
    if(size > gridValue || size <= 0){
      growthRate *= -1;
    }
  }
}



