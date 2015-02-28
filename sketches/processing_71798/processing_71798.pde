
PImage img;
Magnifier m;

void setup(){
  img = loadImage("skulpturview.jpg");
  //size(img.width, img.height);
  size(1024, 768);
  m = new Magnifier();
}

void draw(){
  image(img, 0, 0);
  m.display();
}

