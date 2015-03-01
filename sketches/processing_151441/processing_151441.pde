
void setup()
{
  size(750, 750);
 background(0);
  smooth();
  noStroke();
}

void draw(){
  if (frameCount % 5 == 0) {
    fill(frameCount * 1 % 355, frameCount * 5 % 255,
      frameCount * 1 % 255);
    pushMatrix();
    translate(100, 100);
    rotate(radians(frameCount * 5  % 360));
    rect(0, 0, 80, 29);
    popMatrix();
  }
   if (frameCount % 5 == 0) {
    fill(frameCount * 1 % 255, frameCount * 5 % 255,
      frameCount * 1 % 255);
    pushMatrix();
    translate(100, 100);
    rotate(radians(frameCount * 5  % 360));
    rect(0, 0, 40, 30);
    popMatrix();
  }

  if (frameCount % 8 == 0) { //small ellipse inner
    fill(frameCount * 2 % 300, frameCount * 5 % 255,
      frameCount * 7 % 255);
    pushMatrix();
    translate(90, 90);
    rotate(radians(frameCount * 1  % 360));
    ellipse(245, 243, 8, 8);
    popMatrix();
 
  }
   if (frameCount % 8 == 0) { //small ellipse outer
    fill(frameCount * 2 % 105, frameCount * 5 % 255,
      frameCount * 7 % 255);
    pushMatrix();
    translate(90, 90);
    rotate(radians(frameCount * 1  % 360));
    ellipse(245, 245, 8, 8);
    popMatrix();
 
  }
  if (frameCount % 2 == 0) { // large ellipse inner
    fill(frameCount * 1 % 300, frameCount * 5 % 255,
      frameCount * 1 % 255);
    pushMatrix();
    translate(100, 100);
    rotate(radians(frameCount * 2  % 360));
    ellipse(200, 500, 100, 100);
    popMatrix();
  }
   if (frameCount % 2 == 0) { //large ellipse
    fill(frameCount * 1 % 200, frameCount * 5 % 200,
      frameCount * 1 % 200);
    pushMatrix();
    translate(100, 100);
    rotate(radians(frameCount * 2  % 360));
    ellipse(200, 510, 100, 100);
    popMatrix();
  }
  
}






