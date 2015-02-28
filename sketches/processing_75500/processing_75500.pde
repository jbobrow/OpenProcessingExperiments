
void setup() {
  smooth();
  size(640,480);
  noStroke();
}

void draw() {
  background(255);
  for (int x=50; x<width;x=x+100) {
    for (int y=50; y<height; y=y+100) {
      for (int c=255; c>0; c=c-50) {
        fill(0);
        ellipse(x, y, c-100, c-300);
      }
    }
  }

for (int x=50; x<width; x=x+100){
  for(int y=50; y<height; y=y+100){
    stroke(25,150,50);
    line(x,y,mouseX,mouseY);
  }
}
}
