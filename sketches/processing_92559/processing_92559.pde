
float r = 0;
float g = 0;
float b = 0;
float a = 0;

float wide = 50;
float x = 100;
float y = 100;

void setup(){
  size(200, 200);
  background(255);
  smooth();
}

void draw(){
}

void mousePressed(){
  stroke(0);
  r = random(0, 255);
  g = random(0, 255);
  b = random(0, 255);
  a = random(0, 255);
  x = random(0, 200);
  y = random(0, 200);
  wide = random(5, 80);
  fill(r, g, b, a);
  rectMode(CENTER);
  rect(mouseX, mouseY, wide, wide);
}



