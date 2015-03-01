
int c=0, numFrames = 60;
float theta;
 
void setup() {
  size(500, 500);
  //rectMode(CENTER);
}
 
void draw() {
  background(41,132,177);
  stroke(0);
  for (int y=15; y<height+2; y+=15) {
    for (int x=0; x<width; x+=4) {
  
      float offSet = TWO_PI/width+x;
      float offSet2 = TWO_PI/height+y;
      int dir = c%2==0?-1:2;
      float h = map(sin(theta*dir+offSet+offSet2), -1, 1, 1, 20);
      ellipse(x, y, 1, h);
      c++;
    }
  }
  theta += TWO_PI/numFrames;
 
}



