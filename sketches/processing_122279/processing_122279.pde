
int cs = 20;

void setup() {
  size(640, 480);
  smooth();
}
void draw() {
  background(0);

  fill(0);
  for (int j = 0; j<=height/cs;j++) {
    for (int i = 0; i<=width/cs;i=i+1) {

      if (i>5)fill(mouseY/2, mouseX/2, random(0-255));
      if (j<10)fill(mouseX, mouseY, mouseY-mouseX);

      rect(i*cs, j*cs, random(10-90), random(mouseY-mouseX));
    }

  }
}



