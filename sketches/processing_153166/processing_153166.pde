
void setup(){
size(400,400);
background(0,0,0);
noStroke();
}

void draw(){
  float r;
  float g;
  float b;
  r = map(mouseX, 0, width, 0, 255);
  g = map(mouseY, 0, height, 0, 255);
  b = map(mouseX, mouseY, height, 0, 255); //don't know exactly what this makes
  fill(r, g, b);
  rect(0,0,width,height);
  noStroke();
}

