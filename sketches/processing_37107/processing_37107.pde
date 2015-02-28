
int size = 12;
void setup() {
  size(500,500);
  background(0);
  noStroke();
}

void draw() {

  fill(random(0,256),random(0,256),random(0,256),80);
  ellipse(500-mouseX,mouseY, size,size);
  ellipse(mouseX,500-mouseY, size,size);
  ellipse(500-mouseX,500-mouseY, size,size);
  ellipse(mouseX,mouseY, size,size);
}


