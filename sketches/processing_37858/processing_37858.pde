
void setup() {
  size(600, 300);
}


void draw() {
  noFill();

//controls the background color
  for (int y=0; y<height;y++) {
    for (int x=0;x<width;x++) {
      stroke(x, width, y, height);
      point(x, y);
    }
  }
  
  //draws the circles across the sketch
  smooth();
  stroke(0);
  for (int countX=0;countX<width;countX++) {
    for (int circleSize=height;circleSize>=50;circleSize-=20) {
      ellipse(25+(countX*50), height/2, circleSize, circleSize);
    }
  }
}


