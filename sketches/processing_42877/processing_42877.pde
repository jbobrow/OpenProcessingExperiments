
void setup() {
  size(500, 500,P3D);
  background(255);
  //strokeWeight(2);
  noStroke();
  smooth();
  frameRate(24);
}

float angle = 0;
float speed = 0;

void draw() {
  //background(255);

  angle = angle + 0.05;
  speed = speed + 1.0;

  translate(width/2, height/2);

  rotate(angle);

  for (int x = 30; x < 200; x = x + 10) {

    rotateX(angle);
    
    fill(0,30);

    ellipse(x, x,10,10);
  }
}


