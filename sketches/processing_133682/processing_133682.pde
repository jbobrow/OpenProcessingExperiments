
float framecount = 0;

void setup() {
  size(512,512);
  smooth();
}

void draw() {
  framecount++;
  background(153,204,153);
  stroke(153,76,76);
  for (int x=0; x<width; x++) {
    line(x,0,x,noise(float(x)/width,framecount/width)*height);
  }
}
