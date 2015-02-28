
//sophia brueckner

int circleX = 0;
int circleY = 0;
int w = 500;
int h = 500;

void setup () {
  size(500, 500);
  noStroke();
}

void draw() {
  // erase background
  fill(0, 0, 0, 10);
  rect(0, 0, w, h);
  
  // draw lots random of random circles
  int i = 0;
  while (i < 100) {
      fill(random(255), random(255), random(255));
      ellipse(random(w), random(h), 10, 10);
      ellipse(random(w), random(h), 2, 10);
    i++;
  }
  
  // draw blue ellipse
  fill(93, 83, 216, 100);
  ellipse(mouseX, mouseY, 50, 100);
  
  // draw red animated circle
  fill(255, 0, 0);
  ellipse(circleX, circleY, 100, 100);  
  circleX = circleX + 2;
  circleY = circleY + 2;
  if (circleX > w) {
    circleX = 0;
  }
  if (circleY > h) {
    circleY = 0; 
  }
}


