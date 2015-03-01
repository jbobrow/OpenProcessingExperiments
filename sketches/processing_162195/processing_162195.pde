
float nPos = 0;
float inc = 0.009;
float size = 80;

void setup() {
  size(400,400);
  ellipseMode(CENTER);
  noStroke();
  fill(#CCFF33);
}

void draw() {
  background(#CCFFFF);
  float x = noise(nPos)*width;
  float y = noise(nPos+1)*height;
  ellipse(x,y,size,size);
  nPos = nPos + inc;
}
  void mousePressed(){
  background(#000000);
  }


