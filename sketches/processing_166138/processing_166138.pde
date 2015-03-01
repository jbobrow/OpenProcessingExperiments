


int c=0, numFrames = 60;
float theta;
  
void setup() {
  size(500, 500);
  //rectMode(CENTER);
}
  
void draw() {
  background(131,222,207);
  stroke(0);
  for (int y=25; y<height+2; y+=25) {
    for (int x=0; x<width; x+=5) {
   
      float offSet = TWO_PI/width+x;
      float offSet2 = TWO_PI/height+y;
      int dir = c%2==0?-1:2;
      float h = map(sin(theta*dir+offSet+offSet2), -1, 1, 1, 20);
      rect(x, y, 1, h);
      c++;
    }
  }
  theta += TWO_PI/numFrames;
  
}



