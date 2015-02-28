
void setup() {
  size(400, 400);
  background(140);
}
void draw() {
  for (int x=0; x<=330; x++) {
    strokeWeight(1);
    stroke(random(300));
    //bottom left vertex
    line(x, 0, x/width, height);
    //upper left vertex towards bottom
    line(x, height, x/width, 0);
    //upper right vertex
    line(0, x, width, x/height);
    //upper left vertex towards right
    line(0, x/height, width, x);
  }

  for (int p=0; p<width;p+=25) {
    stroke(255,0,0);
    strokeWeight(p/3);//makes point weight gradually grow
    point (p, p);
  }
}


