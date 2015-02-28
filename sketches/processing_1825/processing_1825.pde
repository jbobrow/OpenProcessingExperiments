
// gardiendless v2-2


void setup() {
  size(420, 599);
  frameRate(24);
  smooth();
  background(0);

}

int numberOfLinesPerFrame = 2;
void draw() {
  //background(0, 1);

  translate(width/2, height/2);
  scale(0.5);

pushMatrix();
  rotate(radians(frameCount % 360));
  int i = 0;
  while(i < numberOfLinesPerFrame) {
   int x = frameCount % width;
   int y = frameCount % height;

    rotate(radians(+0.5));
   stroke(frameCount % 255, map(x, 0, width, 0, 255), map(y, 0, height, 0, 255));
   if (x > y) {
    line(x, 0 - height, x, height * 2);
   } else {
    line(0 - width, y, width * 2, y);
   }
  i++;
 }
popMatrix();
i=0;
  rotate(radians(-frameCount % 360));
  while(i < numberOfLinesPerFrame) {
   int x = width - frameCount % width;
   int y = height - frameCount % height;

    rotate(radians(-0.5));
   stroke(255 - frameCount % 255, map(x, 0, width, 0, 255), map(y, 0, height, 0, 255));
   if (x > y) {
    line(x, 0 - height, x, height * 2);
   } else {
    line(0 - width, y, width * 2, y);
   }
  i++;
 }
}

