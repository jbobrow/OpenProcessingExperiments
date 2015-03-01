
/* @pjs preload= "nike.png"; */
void setup() {
  size (600, 600);
}

void draw() {
  float color1;
  float color2;
  float color3;

  color1 = (random(255, 0));
  color2 = (random(0, 255));
  color3 = (random(0, 255));

  fill (color1, color2, color3);

  int i =0;
  while ( i <= 600 ) {
    int j = 0;
    while (j<=600) {
      rect(j, i, 100, 100);
      rect(j, i, 100, 100);
      j = j + 10;
    }
    i = i + 10;
    PImage img;
    img = loadImage("nike.png");
    image(img, 0, 0, 600, 600);
  }
}



