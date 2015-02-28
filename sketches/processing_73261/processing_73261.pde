
class Rectangle{
  int posX;
  int posY;
  int RectWidth;
  int RectHeight;
  int RectColor;
  int myDist;

  Rectangle(int tempPosX, int tempPosY, int tempRectWidth, int tempRectHeight, int tempRectColor){
  posX = tempPosX;
  posY = tempPosY;
  RectWidth = tempRectWidth;
  RectHeight = tempRectHeight;
  RectColor = tempRectColor;
}


void appear(){
  fill(RectColor);
  rect(posX, posY, RectWidth, RectHeight);
}

void grow(){
 myDist = int(dist(mouseX, mouseY, posX, posY));
 RectWidth = int(map(myDist, 0, width, 10, 250));
 RectHeight = int(map(myDist, 0, width, 10, 250));
}
}


