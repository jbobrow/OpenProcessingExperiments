
float angle = 0;

void setup() {
  size(1000, 500);
  background(255);
  fill(0);
  frameRate(2000);
}

void draw() {
  background(255);
  for (int i =-100; i < width+100; i+=17) {
    for (int j =-100; j < height+100; j+=17) {
  pushMatrix();
  translate(i, j);
  rotate(angle+(TWO_PI*angle*i*j/(width*height)));
  //ellipse(-50,0,4,4);
  //ellipse(50,0,4,4);
  line(-50,0,50,0);
  popMatrix();
  }
  }
  angle+=0.01;
}


