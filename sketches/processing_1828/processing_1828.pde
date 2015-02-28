
// gardiendless v2.2
// Michael Schieben 2009
// http://www.rockitbaby.de

// create something beautiful
// create something meaningful

void setup() {
  size(800, 599);
  frameRate(24);
  smooth();
  background(0);

}

int rX = 0;
int numberOfLinesPerFrame = 20;
void draw() {
  if((frameCount % 5) == 0) {
    fill(0, 1);
    rect(0, 0, width, height);
  }

  translate(width/2, height/2);
  scale(0.5);

  rotate(radians(frameCount % 360) * abs(10 - map(frameCount % 360, 0, 360, 0, 20)));
  int i = 0;
  while(i < numberOfLinesPerFrame) {
    int x = relVal(width);
    int y = relVal(height);

    rotate(radians(i * (abs(10 - map(frameCount % 360, 0, 360, 0, 20)) + 1) / 10));
    stroke(relVal(255), map(x, 0, width, 0, 255), map(y, 0, height, 0, 255));
    line(x, 0 - height * 2, x, height * 4);
    i++;
  }
}

int relVal(int max) {
  return abs(max - (frameCount % max) * 2);
}


