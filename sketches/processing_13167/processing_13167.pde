
int centerX = 240;
int centerY = 180;

void explodeLine(int index, float distance) {

  ArrayList tempNode;
  ArrayList tempController;
  int temp;
  float x = 0;
  float y = 0;
  float x1,y1,x2,y2,x3,y3;

  beginShape();
  tempNode = (ArrayList)nodeList.get(index);
  tempController = (ArrayList)nodeList.get(index+1);
  temp = (int)(index/2);
  temp = (Integer)(weightList.get(temp));
  strokeWeight(temp);

  for(int i=0;i < tempNode.size(); i++) {
    x += ((tempPoint)tempNode.get(i)).getX();
    y += ((tempPoint)tempNode.get(i)).getY();
  }  

  x /= tempNode.size();
  y /= tempNode.size();

  if(x < centerX)
    x1 = - ((tempPoint)tempNode.get(0)).getX() * distance;
  else
    x1 = (2 * centerX - ((tempPoint)tempNode.get(0)).getX()) * distance;

  if(y < centerY)
    y1 = - ((tempPoint)tempNode.get(0)).getY() * distance;
  else
    y1 = (2 * centerY - ((tempPoint)tempNode.get(0)).getY()) * distance;

  vertex(((tempPoint)tempNode.get(0)).getX()+x1, ((tempPoint)tempNode.get(0)).getY()+y1);
  //vertex(x1,y1); // first point
  for(int j=0;j < tempNode.size()-1; j++) {

    if(x < centerX) 
      x3 = - ((tempPoint)tempNode.get(j+1)).getX() * distance;
    else 
      x3 = (2 * centerX - ((tempPoint)tempNode.get(j+1)).getX()) * distance;
    
    if(y < centerY)
      y3 = - ((tempPoint)tempNode.get(j+1)).getY() * distance;
    else
      y3 = (2 * centerY - ((tempPoint)tempNode.get(j+1)).getY()) * distance;

    bezierVertex(((tempPoint)tempController.get(j)).getX()+x1, ((tempPoint)tempController.get(j)).getY()+y1,
    ((tempPoint)tempController.get(j+1)).getX()+x3, ((tempPoint)tempController.get(j+1)).getY()+y3,
    ((tempPoint)tempNode.get(j+1)).getX()+x3, ((tempPoint)tempNode.get(j+1)).getY()+y3);
    
    x1 = x3; y1 = y3;
  }
  endShape();
}

void explodeShape(int index, float distance) {
  ArrayList tempShape;
  int temp;
  float x = 0;
  float y = 0;
  float x1, y1;

  tempShape = (ArrayList)shapeList.get(index);
  for(int i=0;i < tempShape.size(); i++) {
    x += ((tempPoint)tempShape.get(i)).getX();
    y += ((tempPoint)tempShape.get(i)).getY();
  }  

  x /= tempShape.size();
  y /= tempShape.size();

  fill(   ((Color)shapeColorList.get(index)).getR(),
          ((Color)shapeColorList.get(index)).getG(),
          ((Color)shapeColorList.get(index)).getB()
       );
  beginShape();

  for(int j=0;j < tempShape.size(); j++) {

    if(x < centerX)
      x1 = - ((tempPoint)tempShape.get(j)).getX() * distance;
    else
      x1 = (2 * centerX - ((tempPoint)tempShape.get(j)).getX()) * distance;

    if(y < centerY)
      y1 = - ((tempPoint)tempShape.get(j)).getY() * distance;
    else
      y1 = (2 * centerY - ((tempPoint)tempShape.get(j)).getY()) * distance;

    vertex(((tempPoint)tempShape.get(j)).getX() + x1, ((tempPoint)tempShape.get(j)).getY() + y1);
  }

  endShape();
}


