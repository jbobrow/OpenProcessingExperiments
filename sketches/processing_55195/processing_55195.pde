
void setup(){
  background(75);
  size(300,300);
  ellipseMode(CENTER);
  noStroke();
}

int g=50;

void draw(){
  ellipse(mouseX, mouseY, g,g);
}

void mouseClicked() {
  background(75);
  float r = random(255);
  float g = random(255);
  float b = random(255);
  float a = random(255);
  fill(r,g,b,a);
}

