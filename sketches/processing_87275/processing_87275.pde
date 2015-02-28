

float x =300;
float y =300;

void setup() {
  size(1200, 800);
  smooth();
  noStroke();
  background(250);
}

void draw() {

 
  
  fill(250, 30);
  rect(0, 0, width, height);

  x =noise(frameCount*0.002-2)*width;
  y =noise(frameCount*0.003-5)*height;

  fill(250, 30, 20, 250); 
  rect(x, y, 2, 2);
}



