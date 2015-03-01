
void setup(){
  size (600, 450);
}
boolean t = true;
float x;
float y;
int flex=1;

void draw() {
  int w=0;
  background(#062e5b);
  for (int i=1; i<width/2; i+=50) {
    for (int j=1; j<height/3; j+=10) {
      w+=1;
      fill(174, 161, 22, 15);
      stroke(#867b06);
      if (t) {
        x=mouseX;
        y=mouseY;
      }
      if (w % 3==0) {
        ellipse(i*2+40, j*2+50, abs(flex*(x-100)), abs(flex*(y-100)));
      } else {
        ellipse(i*2+40, j*2+50, abs(flex*(y-100)), abs(flex*(x-100)));
      }
    }
  }
}

