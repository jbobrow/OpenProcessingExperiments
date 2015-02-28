
float r = 100;
float g = 200;
float b = 250;
float a = 275;

void setup() {
  size(500, 500);
  background(255);
  smooth();
  frameRate(13);
}

void draw() {
  ellipseMode(CENTER);
  
  float x1 = map(mouseX, 0, width, 165, 195);
  float y1 = map(mouseY, 0, height, 220, 260);
  float x2 = map(mouseX, 0, width, 305, 335);
  float y2 = map(mouseY, 0, height, 220, 260);
  
  //eyes
  fill(255);
  ellipse(180, 240, 80, 120);
  ellipse(320, 240, 80, 120);
  
  //pupils
  fill(0);
  ellipse(x1, y1, 40, 60);
  ellipse(x2, y2, 40, 60);

  //colours
  fill(r, g, b, a);
  r = random(0, 255);
  g = random(0, 255);
  b = random(0, 255);
  a = random(0, 255);
  
  if(mousePressed){
  ellipse(x1, y1, 40, 60);
  ellipse(x2, y2, 40, 60);
  }
}


