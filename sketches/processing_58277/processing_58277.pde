
//Katrina Persson-Thomas
//Problem Set 3 Question 5

//rectangles
float x=0;
float y=0;
int w = 20;
int number=600;

void setup() {
  size(400, 400);
  smooth();
  frameRate(5);
}

void draw() {
  background(255);
  
  for (int i = 0; i < number; i += w) {
    for (int k = 0; k < number; k += w) {
      float r = random(0, 255);
      float g = random(0, 255);
      float b = random(0, 255);
      fill(r, g, b);
      float _x = (x+i)-mouseX/random(2, 4);
      float _y = (y+k)-mouseX/random(2, 4);
      rect(_x, _y, w, w);
    }
  }
}

