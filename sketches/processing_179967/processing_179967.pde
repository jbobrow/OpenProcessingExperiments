
int step, cols=75, edge = 50;
int frames = 60;
float theta, sz;

void setup() {
  size(500, 500);
  step = int((width-2*edge)/cols);
  noStroke();
  rectMode(CENTER);
}

void draw() {
  background(20);
  int i=0;
  for (int x=edge; x<=width-edge; x+=step) {
    for (int y=edge; y<=height-edge; y+=step) {
      fill(100);  
      sz = step*.4;
      rect(x, height-y, sz, sz);
      float offSet = TWO_PI/cols*i;
      float endy = map(sin(theta+offSet), -1, 1, edge, height-edge+step);
      fill(100);
      if (x>150 && x<350) {  
        if (y<=endy) {
          sz = step*.8; 
          fill(255);
          ellipse(x, height-y, sz, sz);
        }
      }
    }
    i++;
  }
  theta += TWO_PI/frames;
  //if (frameCount<=frames) saveFrame("image-###.gif");
}

