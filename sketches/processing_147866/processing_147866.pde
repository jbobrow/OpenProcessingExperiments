
void setup() {
  size(500, 500);
  background(255);
}

float x;
float y;
float count;

void draw() {
  noStroke();
  fill(255, 5);
  rect(0, 0, width, height);
  count = count +1;
  for (int j=0; j<1000; j++) {
    x = random(count, width - count);
    y = random(count, height - count);
    if (count > width/2) {
      count = 0;
    }
    if (mousePressed) {
      count = 0;
      x = random(mouseX, width - mouseX);
      y = random(mouseY, height - mouseY);
      if (mouseX > 250) {
        x = random(width-mouseX, mouseX);
      }
      if (mouseY > 250) {
        y = random(height-mouseY, mouseY);
      }
    } 
    fill(random(150, 255), 0, 0);
    /*fill(random(150, 255));
    if (key == 'r' || key == 'R') {
      fill(random(150, 255), 0, 0);
    }
    if (key == 'g' || key == 'G') {
      fill(0, random(150, 255), 0);
    }
    if (key == 'b' || key == 'B') {
      fill(0, 0, random(150, 255));
    }*/
    ellipse(x, y, 10, 10);
  }
  if (key == 'e' || key == 'E') {
    filter(ERODE);
  }
}

