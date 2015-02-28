
//Vanessa Faienza
//Problem Set 3 - Question 5

float x=0;
float y=0;
int a = 20;
int amount=700;

void setup() {
  size(600, 200);
  smooth();
  frameRate(7);
}

void draw() {
  background(255);
  
  for (int i = 0; i < amount; i += a) {
    for (int k = 0; k < amount; k += a) {
      float r = random(200, 255);
      float g = random(200, 255);
      float b = random(200, 255);
      fill(r, g, b);
      float _x = (x+i)-mouseX/random(2, 4);
      float _y = (y+k)-mouseX/random(2, 4);
      ellipse(_x, _y, a, a);
    }
  }
}
