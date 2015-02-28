
void setup() {
  size(600, 600);
  background(255, 255, 255);
  smooth();
  frameRate(22);
}

void draw() {
  line(height/2, width/2, mouseX, mouseY);
  fill(random(255), random(255), random(255), 5);
  rect(0, 0, 600, 600);
  if (key == 's')
  {
    fill(random(255), random(255), random(255), 50);
    rect(0, 0, 600, 600);
  }
}
void mouseDragged() {
  ellipse(mouseX, mouseY, 50, 50);
  if (key == 'r')
  {
    fill(255, 0, 0);
  }
  if (key == 'w')
  {
    fill(255, 255, 255);
  }
  if (key == 'e')
  {
    fill(0, 0, 255);
  }
  if (key == 'q')
  {
    fill(0, 255, 0);
  }
  if (key == 't')
  {
    fill(#FEFF00);
  }
}
