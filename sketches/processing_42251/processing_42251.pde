
PImage m1;

void setup () {
  size(334,450);
  m1 = loadImage ("diosa.jpg");
}

void draw () {
  background(0);
  image(m1,0,0,mouseX *8 ,mouseY *8);
}

