
void setup () {
  size (400, 400);
  noFill();
  smooth();
}


void draw() {
  background(0);

  //Blue rectangles.
  pushMatrix();
  rectMode(CENTER);
  stroke(0, 0, 255);
  translate(width/2, height/2);
  for (int x=height/2; x>=0; x-=10) {
    rect(0, 0, x, x);
  }

  //Bottom blue vertical stripes.
  for (int x=0; x<=height/4;x+=5) {
    line(x, 0, x, height/2);
  }
  popMatrix();

  //Top blue vertical stripes.
  pushMatrix();
  translate(width/2, 0);
  stroke(0, 0, 255);
  for (int x=0; x<=width/4; x+=5) {
    line(x, 0, x, height/4);
  }
  popMatrix();

  //Red horizontal stripes.
  pushMatrix();
  stroke(255, 0, 0);
  translate(0, width*.25);
  for (int x=0; x<=width/4; x+=5) {
    line(0, x, width, x);
  }
  popMatrix();


  pushMatrix();
  translate(0, height*.75);
  for (int x=0; x<=width/4; x+=5) {
    line(0, x, width, x);
  }
  popMatrix();
}



