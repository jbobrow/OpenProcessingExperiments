
float a = 0.0;
float inc = TWO_PI/95.0;
int i = 0;
PImage img;

  void setup(){
  noStroke();
  size(768,667);
  img = loadImage("chibi.jpg");
}

void draw(){
  image(img,0,0);
  ellipse (528+cos(a)*52,528+sin(a)*52.0,10,10);
  fill(203,0,0);
  i = i + 1;
  a = a + inc;
  }





