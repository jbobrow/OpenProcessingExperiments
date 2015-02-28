
PImage[] imgs;
String imgsPath = "";

void setup() {
  size(512, 512);
  
  imgs = new PImage[33];
  for (int i = 0; i < 33; i++) {
    imgs[i] = loadImage(imgsPath + "IM-0002-00" + nf(i+1, 2) + ".jpg");
  }
  
  noStroke();
  fill(51, 175, 240, 150);
}

void draw() {
  int index = floor(map(mouseY, 0, height, 0, imgs.length));
  image(imgs[index], 0, 0);
  
  float y = map(index, 0, 33, 0, height);
  rect(width-40, y, width, (height/33));
}

