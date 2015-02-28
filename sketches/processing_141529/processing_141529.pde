
/* @pjs preload="1.png,2.png,3.png,4.png,5.png,6.png,7.png,8.png,9.png,10.png,11.png,12.png,13.png,14.png,15.png,16.png,17.png,18.png,19.png,20.png,21.png,22.png,23.png,24.png,25.png,26.png,27.png,28.png,29.png,30.png,31.png"; */
ArrayList<MyImage> shapes;
MyImage selected;
boolean hasSelection;
int clickedX, clickedY;

void setup() {
  size(500, 500);
  background(255);
  shapes = new ArrayList<MyImage>();
  noStroke();
  loadShapes();
}

void draw() {
  background(255);
  for (int i = shapes.size()-1; i >= 0 ; i--) {
    shapes.get(i).show();
  }
  fill(0);
  text("Press space-key for restart", 20, 20);
  text("Press 's' to scramble", 20, 40);
}

void mousePressed() {
  for (MyImage m : shapes) {
    if (m.checkCoords()) {
      selected = m;
      hasSelection = true;
      break;
    }
  }
  clickedX = mouseX;
  clickedY = mouseY;
}

void mouseReleased() {
  hasSelection = false;
}

void mouseDragged() {
  if (hasSelection) {
    selected.movePos(mouseX - clickedX, mouseY - clickedY);
    clickedX = mouseX;
    clickedY = mouseY;
  }
}

void keyReleased() {
  if (key == ' ') {
    initShapes();
  }
  if(key == 's'){
    scrambleShapes();
  }
}

void initShapes() {
  int midX = (width - shapes.get(0).getImg().width) / 2;
  int midY = (height - shapes.get(0).getImg().height) / 2;
  for (MyImage mI : shapes) {
    mI.setPos(midX, midY);
  }


  hasSelection = false;
  selected = null;
}

void loadShapes() {
  for (int i = 31; i > 0; i--) {
    shapes.add(0, new MyImage(i + ".png", 0, 0));
  }

  for (MyImage mI : shapes) {
    PImage temp = mI.getImg();
    temp.resize((mI.getImg().width * (height / mI.getImg().height)), height);
  }

  initShapes();
}

void scrambleShapes() {
  for (MyImage mI : shapes) {
    int randX = (int)random(0 - mI.getImg().width, width);
    int randY = (int)random(0 - mI.getImg().height, height);
    mI.setPos(randX, randY);
  }
}
class MyImage {

  int x, y;
  PImage img;

  MyImage(String url, int x, int y) {
    img = loadImage(url);
    this.x = x;
    this.y = y;
  }

  int getX() {
    return x;
  }

  int getY() {
    return y;
  }
  
  void setPos(int x, int y){
    this.x = x;
    this.y = y;
  }
  
  void movePos(int x, int y){
    this.x += x;
    this.y += y;
  }

  PImage getImg() {
    return img;
  }
  
  boolean checkCoords() {
    int mX = mouseX;
    int mY = mouseY;
    if (x < mX && mX < x + img.width) {
      if (y < mY && mY < y + img.height) {
        int index = (mY - y) * img.width + (mX - x);
        img.loadPixels();
        return alpha(img.pixels[index]) > 0;
      }
    }
    return false;
  }

  
  void show(){
    image(img, x, y);
  }
}


