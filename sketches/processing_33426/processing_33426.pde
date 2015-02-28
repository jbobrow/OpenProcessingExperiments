

float speedx=5.0;
float speedy=5.0;
float ballsize=5;
float ballX=ballsize/2;
float ballY=ballsize/2;

void setup() {
  size(400,400);
  background(255);
  noStroke();
  smooth();
  frameRate(30);
  //no variable
}
void draw() {
  //background(204);


  //blinking ball
  noStroke();
  for (int i = 20; i < width-10; i +=ballsize*2) {
    for (int j =20; j < height-10; j+= ballsize*2) {
      // point(i, j);
      fill(random(0,255),random(0,255),random(0,255),random(0,255));
      ellipse(i,j,ballsize,ballsize);
    }
  }
  // ellipse (ballX,ballY,ballsize,ballsize);
}


