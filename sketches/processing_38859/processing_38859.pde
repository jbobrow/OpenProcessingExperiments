
void setup() {
  background (0);
  size(400, 400);
  smooth();
}

void draw() {
  for (float a=0; a<width; a+=60) {    //grid setup
    for (float b=0; b<height; b+=60) {
      CIRCLES (a, b);
    }
  }
}


void CIRCLES (float x, float y) {

  pushMatrix(); 
  translate(x, y);

  // white and filled circles
  noStroke();
  fill(250);
  ellipse (60, 0, 5, 5);
  //gray unfilled circles
  stroke(100);
  noFill();
  strokeWeight(.5);
  ellipse (60, 0, 60, 60);
  //blue overlapping circles
  stroke(7, 118, 162);
  noFill();
  strokeWeight(1);
  ellipse (0, 0, 120, 120);
  //I like circles, but this is a line, INDEED ...
  stroke(150);
  line(30, 0, 30, height);
  popMatrix();
}




