
void setup() {
  size (600, 450);
}
boolean t = true;
float x;
float y;
int flex=1;

void draw() {
  int w=0;
  int v=0;
  background(#ece9d1);

  if (mouseX >= width/2 &&
    mouseY >= height/2) { 
    background(#c8bce4);
  }

  if (mouseX <= width/2 &&
    mouseY <= height/2) { 
    background(#47aaf7);
  }

  if (mouseX <= width/2 &&
    mouseY >= height/2) { 
    background(#f78989);
  }

  for (int i=1; i<width/2; i+=15) {
    for (int j=1; j<height/2; j+=15) {
      w+=1;
      v+=1;

      fill(235, 212, 60, 15);
      stroke(0, 150);
      if (t) {
        x=mouseX;
        y=mouseY;
      }
      if (w % 3==0||v% 4==0) {
        line(i*2+10, j*2+10, abs(flex*(x-100)), abs(flex*(y-100)));
      } else {
        line(i*2+10, j*2+10, abs(flex*(y-100)), abs(flex*(x-100)));
      }
    }
  }
}

