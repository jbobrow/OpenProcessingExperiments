
float t = 0;

float HALF_WIDTH;
float HALF_HEIGHT;

float XDIV = 1000.0;
float YDIV = 1000.0;

void setup(){
  size(800, 800);
  
  HALF_WIDTH = width / 2;
  HALF_HEIGHT = height / 2;
  
  noStroke();
  
  background(0);
  
  colorMode(HSB);
}

void draw(){
  fill(0, 8);
  rect(0, 0, width, height);  
  for(int i = 0; i < 1000; i ++){
    subDraw();
  }
}

void subDraw(){
  pushMatrix();
  
  translate(HALF_WIDTH, HALF_HEIGHT);
  rotate(-radians(t * (mouseY / (float)height)));

  t += 1;
  
  float x = sin(radians(t * (mouseX * 2) / XDIV)) * HALF_WIDTH / 2+50;
  float y = sin(radians(t * (mouseX * 2) / YDIV)) * HALF_HEIGHT / 2+50;
  
  fill(abs(sin(radians(9 * t / 1000.0))) * 255, 255, 255);

  ellipse(x, y, 2, 0.4);
  popMatrix();
}
