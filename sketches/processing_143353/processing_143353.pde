
int SIZE = 8;
 
int hue = 0;
 
 
void setup() {
  size(400, 400);
  colorMode(HSB, 360, 100, 100);
  background(360);
  noStroke();
}
 
void draw() {
  //background(360);//not need
  //noStroke();//not need

  fill(hue, 50, 100);
 
  for (int i = 0; i < width/SIZE*4;i++) {
    for (int j = 0; j < height/SIZE*4;j++) {
      hounds_tooth(i*SIZE*4-SIZE, SIZE*4*j+SIZE*2);
    }
  }
 
  hue += 4;
  hue %= 360;
}
 
void hounds_tooth(int x, int y) {
  pushMatrix();
  translate(x, y);
 
  beginShape();
  vertex(0, 0);
  vertex(SIZE*2, -SIZE*2);
  vertex(SIZE*3, -SIZE*2);
  vertex(SIZE*4, -SIZE*3);
  vertex(SIZE*4, -SIZE*2);
  vertex(SIZE*5, -SIZE*2);
  vertex(SIZE*4, -SIZE);
  vertex(SIZE*4, 0);
  vertex(SIZE*2, SIZE*2);
  vertex(SIZE*2, SIZE);
  vertex(SIZE*3, 0);
  vertex(SIZE*2, 0);
  vertex(SIZE*2, -SIZE);
  vertex(SIZE, 0);
  endShape();
 
  popMatrix();
}

