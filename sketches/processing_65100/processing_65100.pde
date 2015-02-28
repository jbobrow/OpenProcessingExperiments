
float v;

void setup() {
  
  size(500, 500);
  smooth();
  rectMode(CENTER);
  
}

void draw() {
  //make sure to redraw the background each frame
  background(0);
  
  v = mouseX;
  
  float headSize = map(v, 0, 500, 200, 500);
  float eyeHeight = map(v, 0, 500, 240, 200);
  float eyeSize = map(v, 0, 500, 20, 60);
  float mouthWidth = map(v, 0, 500, 30, 400);
  
  ellipse(width/2, height/2, headSize, headSize);
  ellipse(200, eyeHeight, eyeSize, eyeSize);
  ellipse(300, eyeHeight, eyeSize, eyeSize);
  rect(width/2, 270, mouthWidth, 10);
  
}

