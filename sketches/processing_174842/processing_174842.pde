
void setup() {
  size(500, 500);
  background(0);
};
void draw() {
  int i = 0;  
  int j = 0;
  int k = 0;
  int l = 0;
  int m = 0;
  
  while (i < 5) {
    PImage webImg;
    String url = "http://lorempixel.com/100/100/";
    webImg = loadImage(url, "jpg");
    image(webImg, (i * 100), 0); 
    i = i + 1;
  }
  while (j < 5) {
    PImage webImg;
    String url = "http://lorempixel.com/100/100/";
    webImg = loadImage(url, "jpg");
    image(webImg, (j * 100), 100); 
    j = j + 1;
  }
  while (k < 5) {
    PImage webImg;
    String url = "http://lorempixel.com/100/100/";
    webImg = loadImage(url, "jpg");
    image(webImg, (k * 100), 200); 
    k = k + 1;
  }
  while (l < 5) {
    PImage webImg;
    String url = "http://lorempixel.com/100/100/";
    webImg = loadImage(url, "jpg");
    image(webImg, (l * 100), 300); 
    l = l + 1;
  }
  while (m < 5) {
    PImage webImg;
    String url = "http://lorempixel.com/100/100/";
    webImg = loadImage(url, "jpg");
    image(webImg, (m * 100), 400); 
    m = m + 1;
  }
  noLoop();
}

void mousePressed() {
  redraw();
}
