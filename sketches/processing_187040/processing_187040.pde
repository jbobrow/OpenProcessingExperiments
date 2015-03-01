
int boxSize = 40;
int linePos = 40;
float speed = 1.5;

void setup() {
  size(360, 222);
  strokeWeight(2);
  stroke(0);
}

void draw() {
  background(20, 100, 128);

  float x = -boxSize + (speed * frameCount * TWO_PI) % 400.0;
  fill(0, 70, 80);
  triangle(
  360 - x -boxSize/2, height-boxSize*2, 
  360 - x, height - boxSize, 
  360 - x -boxSize, height - boxSize);

  line(0, height - boxSize, width, height-boxSize); 

  float y = map(x, 360, -boxSize, 0, PI);
  float xTrans = width/2 - boxSize/2;
  float yTrans = height- boxSize-linePos -sin(y) * boxSize * 1.3;

  translate(xTrans, yTrans + boxSize/2);
  rotate(-y/2);
  fill(200, 100, 0);
  rect(-boxSize/2, -boxSize/2, boxSize, boxSize);
}

