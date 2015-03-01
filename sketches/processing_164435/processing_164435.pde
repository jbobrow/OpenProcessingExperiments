
void setup() {
  size(400, 400);
  //size(displayWidth, displayHeight);
}

void draw() {
  //fill(random(0, 255), random(0, 255), random(0, 255));
  //float size = random(0, 200);
  //ellipse(random(0, width), random(0, height), size, size);
}

void mousePressed() {
  fill(random(0, 255), random(0, 255), random(0, 255));
  float size = random(0, 200);
  

  //original
  //println(mouseX);
  //ellipse(mouseX, mouseY, 50, 50);

  //extension 1  
  ellipse(mouseX, mouseY, size, size);

  //extension 2
  //ellipse(random(0, width), random(0, height), size, size);
}

