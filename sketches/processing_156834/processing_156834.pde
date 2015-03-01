
void setup(){
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
  for (int i=1; i<width/2; i+=30) {
    for (int j=1; j<height/3; j+=10) {
      w+=1;
      v+=1;
      fill(235,212,60, 15);
      stroke(#867b06);
      if (t) {
        x=mouseX;
        y=mouseY;
      }
      rectMode(CENTER);
      if (w % 5==0 && v % 2==0) {
       rect(i*2+40, j*2+50, abs(flex*(x-100)), abs(flex*(y-100)));
      } else {
        rect(i*2+40, j*2+50, abs(flex*(y-100)), abs(flex*(x-100)));
      }
    }
  }
}
