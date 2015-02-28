
//I Chien Wu gradient
//xiao_j0711@yahoo.com.tw



void setup() {
//  frameRate(10);
  noLoop();
  size(256, 256);
}
void draw() {
  for(int i = 0; i < 256; i=i+1) {
    for(int j = 0; j < 256 ; j=j+1) {
    point(i,j);
  stroke(255,i,j);
    }
  }
}

