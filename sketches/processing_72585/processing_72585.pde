
boolean doidraw = false;
int diam = 200;

void setup() {
  size(600, 600);
  background (0);
  stroke(0);
}

void mousePressed() {
  diam = 200;
  doidraw = !doidraw;
}

void draw() {
  if(doidraw) {
      drawacircle(mouseX,mouseY,diam);
      drawacircle(mouseX,mouseY,diam/2);
      diam = diam - 10;
      if (diam < -200) {
        diam = 200;
      }
      }
}

void drawacircle(int centx, int centy, int circlesize) {
  fill(0,random(190),random(100,255),random(255));
  ellipse(mouseX,mouseY,diam,diam);
}



