
void setup () {
  size (400, 400);
  background (255);

}

void draw () {
  noFill();
  float t = frameCount / 90.0;
  stroke(255, 10, 50, 20);
  for (int i = 0; i<1; i ++) {
  bezier (
  0, width/2, //x1, y1 const
  noise(2,i,t)*width, noise(1,i,t)*height, //var
  noise(3,i,t)*200, noise(4,i,t)*height, //var
  width, height/2 //x2, y2 const
  );

  }
}
