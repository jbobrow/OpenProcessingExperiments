
float s = 7;
int area = 100;

void setup() {
  size(640, 640);
  stroke(255, 0, 0);
  fill(255, 255, 0);
}

void draw() {
  background(40);
  for (int x = area; x < width-area; x+=s*2) {
    for (int y = area; y < height-area; y+=s*2) {
      float diff = sin(radians(dist(x, y, sin(radians(x))*width, cos(radians(y))*height)-frameCount*4))*s;
      if(dist(x, y, width/2, height/2) < area*2){
        ellipse(x, y, s-diff, s-diff);
      }
    }
  }
}



