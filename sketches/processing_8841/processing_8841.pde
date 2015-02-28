
void setup(){
  size(400, 400);
  PImage img;
  String imgName = selectInput();
  img = loadImage(imgName);
  image(img, 0, 0,400,400);
}

