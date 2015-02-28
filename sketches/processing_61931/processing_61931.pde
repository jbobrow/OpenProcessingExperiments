
float diff = 100;
void setup() {
  size(500, 500);
  background(215, 225, 255);
  smooth();
}

void draw() {
  float followX = mouseX + diff;
  float followY = mouseY + diff;
  float r = 0.1;
  diff = diff - 1;

  if (followX < 0 || followX > 500) {
    diff = 100;
  }

  if (followY < 0 || followY > 500) {
    diff = 100;
  }

  if (mousePressed == true) {
    diff = 100;
    ring(followX, followY, 100, 100);
  }
  else if (mousePressed == false) {
    //translate(width/2, height/2);
    r = r + 0.1;
    rotate(r);
    ring(followX, followY, 100, 100);
    //translate(-width/8, -height/8);
  }
}

void ring(float x, float y, float wdth, float hght) {
  float diffX = 1;
  float diffY = 1;

  noStroke();
  fill(0, 30, 75, 25);
  ellipse(x, y, wdth, hght);
  fill(200, 225, 255, 200);
  ellipse(x+diffX, y+diffY, wdth/2, hght/2);
}

void mouseClicked() {
  save(frameCount+".jpg");
}


