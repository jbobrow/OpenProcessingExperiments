
void setup() {
  size(600, 400);
  smooth();
  colorMode(HSB,360,100,100);
}

float steps = 20;

void draw() {
  //  background(0);
  fill(0, 10);
  rect(0, 0, width, height);
  steps = mouseX+2;

//  stroke(360);
  strokeWeight(map(mouseY, 0, height, 0.5, 40));
  //noFill();
  beginShape(TRIANGLE_FAN);
  vertex(0, 0);
  for (float i = 0; i<=width; i+=steps) {
stroke(map(i,0,width,0,360),100,100);
    vertex(i, height);
  }

  endShape();

  beginShape(TRIANGLE_FAN);
  vertex(width, 0);

  for (float i = 0; i<=width; i+=steps) {
    stroke(map(i,0,width,0,360),100,100);
    vertex(i, height);
  }

  endShape();





  beginShape(TRIANGLE_FAN);
  vertex(0, height);

  for (float i = 0; i<=width; i+=steps) {
    stroke(map(i,0,width,0,360),100,100);
    vertex(i, 0);
  }

  endShape();

  beginShape(TRIANGLE_FAN);
  vertex(width, height);

  for (float i = 0; i<=width; i+=steps) {
    stroke(map(i,0,width,0,360),100,100);
    vertex(i, 0);
  }

  endShape();



//
//  beginShape(TRIANGLE_FAN);
//  vertex(0, 0);
//
//  for (float i = 0; i<=height; i+=steps) {
//    stroke(map(i,0,height,0,360),100,100);
//    vertex(width, i);
//  }
//
//  endShape();
//
//  beginShape(TRIANGLE_FAN);
//  vertex(width, 0);
//
//  for (float i = 0; i<=height; i+=steps) {
//    stroke(map(i,0,height,0,360),100,100);
//    vertex(0, i);
//  }
//
//  endShape();
//
//
//
//  beginShape(TRIANGLE_FAN);
//  vertex(0, height);
//
//  for (float i = 0; i<=height; i+=steps) {
//    stroke(map(i,0,height,0,360),100,100);
//    vertex(width, i);
//  }
//
//  endShape();
//
//  beginShape(TRIANGLE_FAN);
//  vertex(width, height);
//
//  for (float i = 0; i<=height; i+=steps) {
//    stroke(map(i,0,height,0,360),100,100);
//    vertex(0, i);
//  }
//
//  endShape();
}



