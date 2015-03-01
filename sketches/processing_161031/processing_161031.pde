
int fps = 30;
int numFrames = 60;
boolean recording = false;

void setup() {
  size(500, 500);
  frameRate(fps);
}

int circles = 20;

void draw() {
  float t = map(frameCount-1, 0, numFrames, 0, 1) % 1;

  translate(width/2, height/2);  
  background(255);

  pushMatrix();

  float theta = t*TWO_PI/circles; // rotate to next circle
  rotate(theta); 
  for (int i=0; i<circles; i++) {
    pushMatrix();
    float offSet = i*TWO_PI/circles; 
    rotate(offSet);
    // theta corrects for next circle rotation, t*TWO_PI actually rotates sz
    float sz = map(sin(offSet+theta + t*TWO_PI), -1, 1, 5, 40);
    strokeWeight(2);
    ellipse(150, 0, sz, sz);
    popMatrix();
  }
  popMatrix();
  
  //theta += (TWO_PI/steps); // never add up like this. a lot of small errors => big error

  if (recording) {
    saveFrame("frames/image-###.png"); // save PNG for quality if you use a lot of colors.
    if (frameCount==numFrames) exit();
  }
}
