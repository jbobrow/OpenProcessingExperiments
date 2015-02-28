

void setup() {
  size(600, 600);

  noFill();
  frameRate(15);
  background(255);
}
float a=0;

void draw() {

  fill(255, 255, 255, 5);
  rect(0, 0, width, height);
  noFill();
  translate(width/2, height/2);

  // for (int a=0;a<360;a++) {
  stroke(random(100)+100);

  if (keyPressed) {
    rotate(degrees(a-=0.1));
  }
  else { 
    rotate(degrees(random(360)));
  }
  beginShape();
  curveVertex(0, 0);
  int x=0;
  int y=0;
  for (int i=0;i<30;i++) {
    curveVertex(x+=random(10), y+=random(10));
  }
  endShape();
  //}
}


