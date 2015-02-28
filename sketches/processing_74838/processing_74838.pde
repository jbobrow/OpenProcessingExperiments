
int b= 10;
int h= 30;
void setup() {

  size(400, 300);
  smooth();
  noStroke();
  background(255);
}

void draw() {
  background(255);

  for (int y=45; y < height-40; y = y +40) {
    for (int x =40; x< width-35; x= x +40) {
      if (mousePressed) {
        fill(0, 0, 255);
        ellipse (x, y, b, h);
        if (b <=30) {
          b++;
        }
       
        if (h>=10) {
          h--;
        }
      }
      else {
        fill(255, 0, 0);
        ellipse(x, y, 10, 30);
      }
    }
  }
}
