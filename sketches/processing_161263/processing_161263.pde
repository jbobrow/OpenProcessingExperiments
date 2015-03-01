
PImage car;
PImage braveheart;
int xSize = 650;
int ySize = 450;

void setup() {
  size(xSize, ySize);
  car = loadImage("http://31.media.tumblr.com/04331487d02bb726dbb37ed3dbd61345/tumblr_nblavayEwA1tlzulpo1_1280.jpg");
  braveheart = loadImage ("https://33.media.tumblr.com/5170554d1ff06bb68c089255430f8cb5/tumblr_nc1xxeZ57u1tlzulpo1_1280.jpg");
}

void draw() {
  image(car, 0, 0,xSize,ySize);
  
  if ((mouseX>300)&&(mouseY>200)&&(mouseX<350)&&(mouseY<250))
   
   image(braveheart, 0, 0,xSize,ySize);
}

