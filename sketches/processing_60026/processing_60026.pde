
// 프레임레이트
void setup () {
  size(400,400);
  frameRate(1);
  smooth();
}
void draw() {
  float R = random(256);
  float G = random(256);
  float B = random(256);
  background(R,G,B);

  float randSize = random(30);
  stroke(255);
  strokeWeight(randSize);
  
  float randX = random(width);
  float randY = random(height);

  point(randX,randY);

  
}


