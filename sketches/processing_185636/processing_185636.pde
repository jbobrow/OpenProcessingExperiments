
int state=0;

void start() {
  size(400, 400);
}

void draw() {
  if (state==1) {
    for (int x= (mouseX-25); x<=(mouseX+25); x=x+10) {
      ellipseMode(CENTER);
      ellipse(x, mouseY, 10, 10);
      state=0;
    }
  }
}
void mousePressed() {
  state=1;
}



