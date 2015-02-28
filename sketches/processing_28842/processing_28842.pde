
void setup () {
  size(500,500);
  smooth();
  noStroke();
}

void draw () {
  background(147,247,216);
  fill(50, 50);
  for (int x=0; x<width; x+=20) {
    for (int y=0; y<height; y+=20) {
      rect(x,y,mouseX/10, mouseY/10);
    }
  } 

  if (mousePressed) {
    if (mouseButton == LEFT) {
      fill(0);
    }
    else if (mouseButton == RIGHT) {
      fill(255);
    }
    ellipse(250,250,mouseX/10,mouseY/10);
  }
}


