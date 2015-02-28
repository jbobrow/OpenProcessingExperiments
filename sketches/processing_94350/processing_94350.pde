
int myWidth = 800;
int myHeight = 800;

int myBlock = 10;
float myNoise = 0;
float myStep = .1;

void setup() {

  size(myWidth, myHeight);
  smooth();
  background(0);
  stroke(200, 30, 0);
  frameRate(6);
}

void draw() {
  if (frameCount > 1) {
    fill(0, 200);
    rect(0, 0, width, height);

    for (int i=0; i<myWidth; i+=myBlock) {
      for (int j=0; j<myHeight; j+=myBlock) {
        myNoise += myStep;
        if (noise(myNoise)>0.5) {
          strokeWeight(noise(myNoise)*10);
          line(i, j, i+10, j+10);
        } 
        else {
          strokeWeight(noise(myNoise)*10);
          stroke(i-mouseY*2, j-mouseX/2, (mouseX));
          line(i+10, j, i, j+10);
        }
      }
    }
  }
}
