
//Ben Norskov
//creative computing, April 2, 2013
//how to rotate a rectangle
float rotation = 0;
void setup() {
  size(350, 350);
}
void draw() {
  background(25, 200, 200);
  fill(255, 255, 255);
  pushMatrix();
  translate(200, 200);
  rotate(radians(rotation));
  //offset the rect to rotate from the center
  //you can also do this with rectMode(CENTER), but I didn't
  rect(-15, -15, 30, 30);
  rotation += 8;
  popMatrix();
  //this rect doesn't rotate because it's outside the Matrix
  fill(40, 140, 250);
  rect(195, 195, 10, 10);
}
