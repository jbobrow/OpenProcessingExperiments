
PImage[] imgs;
String imgsPath = "";

void setup() {
  size(675, 450);
  
  imgs = new PImage[14];
   for (int i = 0; i < 14; i++) {
    imgs[i] = loadImage(imgsPath + "IM-0002-00" + nf(i+1, 2) + ".jpg");
   }
   
}

void draw() {

  int columns = 7;
  int rows = 2;

  int indexX = floor(map(mouseX, width, 0, columns, 0));
  int indexY = floor(map(mouseY, width, 0, rows + 1, 0)); 
  
  int index = (indexY * columns) + indexX;

  println(index);
  image(imgs[index], 0, 0);
  
  }


