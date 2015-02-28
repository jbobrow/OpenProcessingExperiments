
int sliceNum = 15;
PImage[] imgs = new PImage[sliceNum];
Boolean[] flags = new Boolean[sliceNum];
Boolean checkMouse = false;

void setup() {
  size(910, 951);
  imgs[0] = loadImage("picasso.jpg");
  for (int i = 1; i<sliceNum; i++) {
    imgs[i] = loadImage("pic" + i +".png");
    flags[i] = false;
  }
}

void draw() {
  image(imgs[0], 0, 0);//background image
  drawImg(1, 619, 839);
  drawImg(2, 590, 0);
  drawImg(3, 622, 642);
  drawImg(4, 174, 0);
  drawImg(5, 0, 641);
  drawImg(6, 174, 147);
  drawImg(7, 589, 134);
  drawImg(8, 172, 467);
  //  drawImg(9, 590, 0);
  drawImg(10, 368, 642);
  drawImg(11, 402, 299);
  drawImg(12, 402, 467);
  drawImg(13, 0, 214);
  drawImg(14, width-231, 299);
}

void drawImg(int index, int _x, int _y) {
  int img_w = imgs[index].width;
  int img_h = imgs[index].height;
  if (checkMouse) {
    if ( (pmouseX > _x) && (pmouseX < _x+img_w) && (pmouseY > _y) && (pmouseY < _y+img_h)) {
      flags[index] = !flags[index];
      checkMouse = false;
    }
  }
  if (flags[index]) image(imgs[index], _x, _y);
  if ((index == 14) && (checkMouse)) checkMouse = false;
}
void mouseClicked() {
  checkMouse = true;
}



