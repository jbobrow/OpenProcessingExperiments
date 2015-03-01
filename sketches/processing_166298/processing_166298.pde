
float deltaX, deltaY, deltaTime;

void setup() {
  size(1000, 600);
  deltaX = width/10;
  deltaY = height/3;
  deltaTime = 0;
  noFill();
  strokeWeight(5);
}
void draw() {
  background(0);
  if (deltaTime>=deltaX) deltaTime=0;
  else deltaTime++;
  for (int j=0; j<=height; j+=deltaY) {
    beginShape();
    vertex(-deltaX, height-j -(deltaY/2));
    for (float i=-deltaX; i<=width+deltaX; i+=deltaX) {
      float colorFill = map(j, 0, width, 100, 255);

      stroke(0, colorFill, colorFill);
      curveVertex(i+deltaTime+random(0, 5), height -  j + 1 - random(0, 5)+-(deltaY/2));
      curveVertex(i+deltaTime+random(0, 5), height - (30 + j)+ 1 - random(0, 5)+-(deltaY/2));
    }
    endShape();
  }
}

