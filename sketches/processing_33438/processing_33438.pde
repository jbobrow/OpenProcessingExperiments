
int xpos=20;
int ypos=20;

void setup() {
  size(400,400);
  background(0);
  noStroke();
}
void draw() {
  background(0);
  for(int j=0; j<10; j++ ) {
    for(int i = 0; i<5; i++) {
      ellipse(xpos+50*i,ypos+50*j,20,20);
    }
  }
  xpos++;
  ypos++;
}

