
//fernando Diaz , 
PImage rancho;
int x = 200;
int y = 200;
int radius = 100;

void setup() {
  size(800, 611);
  frameRate(30);
  smooth();
  rancho = loadImage("rancho.jpg");
}


void draw () {
  if (mouseX>x) {
    if (mousePressed) {
      float f = map(mouseX, 0, width, 0, 255);
      int dia = 80;
      for (int x = 60; x < width; x+=140) { //cicles
        for (int y = 60;  y<height; y+=140) {
          fill(240, f);
          noStroke();
          ellipse(x, y, dia, dia);
        }
      }
    } 
    else {
      image(rancho, 0, 0); 
      float r = random(0, 255);
      fill(222, r);
      rect(0, 0, width, height);   //rectangle
    }
    float p = random(0, 255);
    noStroke();
    fill(0, p);
    ellipse(200, 200, 200, 200);
  } 
  else {
    image(rancho, 0, 0);
    for (int i = 20; i < width; i +=20) {
      //fill(),random(255),random(255));
      stroke(10);
      line(i, 0, i+ i/2, 80);
      line(i + i/2, 80, i*1.2, height);
    }
  }
}


