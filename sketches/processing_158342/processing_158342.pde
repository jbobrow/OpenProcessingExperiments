
float px=0;
int r = 50;
void setup() {
  size (800, 600);
  
  background(30);
  noStroke();
  smooth();
}

void draw() {

  if (mousePressed) {
    px+=.01;
    //r++;

    fill(noise(px)*300, noise(px, px)*300, noise(px, px, px)*300);
    ellipse(mouseX, mouseY, r, r);
  }
  if (frameCount%5==0) {
    fill(0, 5);
    rect(0, 0, width, height);
  }
}

