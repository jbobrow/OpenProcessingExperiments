
float a = 0;
float x = 0;
float randomizerX = random(0.1, 0.9);
float randomizerY = random(0.1, 0.9);

void setup() {
  size(700, 700);
  background(40);
  stroke(150);
}

void draw() {
  //fill(10, 5);
  //rect(0, 0, width, height);
  
  float x = map(sin(a)*sin(a*randomizerX), -1, 1, 50, width-50);
  float y = map(sin(a*1.3)*sin(a*randomizerY), -1, 1, 50, height-50);
  float ellipseSize = map(sin(a), -1, 1, 20, 60);

  ellipse(x, y, ellipseSize, ellipseSize);
  
  a = a + 0.06;
}

void keyPressed() {
  if(key == 'd') {
    background(40);
    randomizerY = random(0.1, 0.9);
    randomizerX = random(0.1, 0.9);
  }
}


