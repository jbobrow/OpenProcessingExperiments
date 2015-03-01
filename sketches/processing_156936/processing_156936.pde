
float posX;
float posY;
float cRate;
float cR;
float cB;

void setup() {
  size(500, 500);
  background(0);
}

void draw() {
  noStroke();
  background(0);  

  for (int i =0; i<width; i+=10) {
    for (int j=0; j<height; j+=20) {
      cR = dist(i, j, mouseX, mouseY);
      int randomTest = int(random(2));
      if (frameCount % 2 == 0) {
        if ( randomTest == 0) {
          fill(random(255), random(255), random(255));
        } else {
          fill(1, cR, 50);
        }
      } else {
        fill(mouseY, cR, 30);
      }
      cRate = cos(frameCount*0.02 +i)*6+mouseX* 0.02;
      //fill(random(mouseX, mouseY),random(0, 255),random(0, 255));
      rect(i, j, cRate, cRate);
    }
  }
}



