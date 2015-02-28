
void setup() {
  size(1000, 1000);
  background(255, 244, 219);
  noFill();
}
void draw() {
  int m=0;
  while (m<2000) {
    for (int h=255;h>0;h=h-10){
     
     
      stroke(0, h-5, h-20);
      ellipse(width/2, height/2, 10+m, 10+m);
      m=m+6;
      }
  }
  int i=0;
  while (i<2000) {
    for (int j=0;j<255;j=j+10){
     
     
      stroke(0, 20+j, 5+j);
      ellipse(width/2, height/2, 5+i, 5+i);
      i=i+10;
      }
  }
}
