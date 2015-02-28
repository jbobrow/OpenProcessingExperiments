
      void setup() {
  size(200,200);
  noLoop();
}
void draw() {
  fill(0);
  for(int x=10; x<200; x=x+40) {
    for(int y=10; y<200; y=y+40) {
      ellipse(x,y,10,10);
      for(int a=30; a<200; a=a+40) {
        for(int b=30; b<200; b=b+40) {
          ellipse(a,b,10,10);
        }
      }
    }
  }
  fill(255);
  for(int x=30; x<200; x=x+40) {
    for(int y=10; y<200; y=y+40) {
      ellipse(x,y,10,10);
      for(int a=10; a<200; a=a+40) {
        for(int b=30; b<200; b=b+40) {
          ellipse(a,b,10,10);
        }
      }
    }
  }
}

