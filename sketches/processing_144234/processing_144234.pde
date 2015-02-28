
PImage img;


void setup() {

  background(255);
  img = loadImage("ddd-01.jpg");
  size(800, 308, P2D);
}

void draw() {
  background(255);
  float mouseXFactor = map(mouseX, 0, width, 0.05, 1);
  float mouseYFactor = map(mouseY, 0, height, 0.05, 1);
  for (int gridY = 0; gridY < img.height; gridY++) {
    for (int gridX = 0; gridX < img.width-1; gridX++) {
      float elementWidth = width/(float)img.width;
      float elementHeight = height/(float)img.height;


      color c = img.pixels[gridY*img.width+gridX];//某一格的色彩
      int greyscale = round(red(c)*0.2+green(c)*0.7+blue(c)*0.07);//解析为灰度

      color c2 = img.pixels[gridY*img.width+gridX+1];//下一格的色彩
      int greyscale2 = round(red(c2)*0.2+green(c2)*0.7+blue(c2)*0.07);//下一格解析为灰度

      float h = map(greyscale, 0, 255, 12, 0.01);//变为Y上的高度差
      float h2 = map(greyscale2, 0, 255, 12, 0.01);//变为Y上的高度差  

      float posX = gridX*elementWidth;
      float posY = gridY*elementHeight+h*mouseYFactor;

      float posX2 = (gridX+1)*elementWidth;
      float posY2 = gridY*elementHeight+h2*mouseYFactor;
      stroke(0);
      strokeJoin(ROUND);
      strokeWeight(1.5);
      line(posX, posY, posX2, posY2);
    }
  }

//  if (mousePressed) {
//    saveFrame("Diana-######.png");
//  }
}




