
void setup() {
  size(500, 500);
  background(2);
  smooth();
  noStroke();
}

void draw(){
  if (frameCount % 10 == 0) {
    fill(frameCount * 3 % 300, frameCount * 5 % 255,
      frameCount * 7 % 255);
    pushMatrix();
    translate(90, 100);
    rotate(radians(frameCount * 2  % 360));
    rect(0, 0, 80, 20);
    popMatrix();
  }
}
void setup()
{
  size(500, 500);
  background(2);
  smooth();
  line(0, 0, 200, 0); // draw axes
  line(0, 0, 0, 200);
  
  pushMatrix();
  fill(255, 0, 0); // red square
  rotate(radians(30));
  translate(70, 70);
  scale(2.0);
  rect(150, 0, 20, 20);
  popMatrix();

  pushMatrix();
  fill(255); // white square
  translate(70, 70);
  rotate(radians(30));
  scale(2.0);
  rect(150, 0, 20, 20);
  popMatrix();
  

}
