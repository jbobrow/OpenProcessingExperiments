


void setup() {
  size(1920, 1080);
  background(0);
}

void draw() {

  for (int i=0;i<width;i++) {

    stroke(255);
    point(i,random(0,height));
    //point(i,i);
  }
  //noLoop();
}

