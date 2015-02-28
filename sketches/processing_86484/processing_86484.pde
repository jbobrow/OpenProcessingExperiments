

void setup() {
  size(1920, 1280);
  background(0);
  smooth();
  noStroke();
}

void draw(){
  if (frameCount % 1 == 0) {
    fill(frameCount * 25 % 255, frameCount * 50 % 255,
      frameCount * 100 % 255, 50);
    pushMatrix();
    translate(960, 640);
  }{
     fill(frameCount * 73 % 255, frameCount * 23 % 255,
      frameCount * 190 % 255, 3);
      rotate(radians(frameCount * 2  % 360));
      ellipse(70, 70, 5, 5000);
     if(mousePressed) {
       rotate(radians(frameCount * 100  % 360));
      ellipse(70, 70, 50, 5000);
       } else {
      fill(frameCount * 170 % 255, frameCount * 123 % 255,
      frameCount * 90 % 255, 1.5);
       rotate(radians(frameCount * 2  % 360));
        ellipse(70, 70, 5, 5000);
        translate(140, 720);
    }
    
  }
    popMatrix();
}



