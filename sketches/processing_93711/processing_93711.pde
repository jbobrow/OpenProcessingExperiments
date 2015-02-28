
PImage picture;

float w;
float h;

void setup(){
  size(600, 400);
  picture = loadImage("grumpy_cat.jpg");
}

void draw(){
  w = mouseX;
  h = mouseY;
  image(picture, 0, 0, w, h);
}


