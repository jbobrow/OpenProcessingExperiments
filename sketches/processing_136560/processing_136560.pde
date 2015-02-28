
import processing.pdf.*;
 
void setup(){
  size(4000,4000,PDF, "LaserDrawer10.1.pdf");
  final int dpi = 72;
  noFill();
}

void draw(){
  
  slide(216,216,216,18,20,20);
  exit();
}
void slide(int X, int Y, int Z, int thick, int offsetX, int offsetY){
  int thick2;
  int offX;
  int gap;
  gap = 25;
  thick2 = thick*2;
  offX = 80+X+Z+Z; 
  drawer(X-thick2,Y-thick2,Z-thick2,thick, offsetX, offsetY);
  slot(X,Y,Z,thick,offsetX+offX, offsetY);
  shell(X+36,Y+72,Z+72,thick,offsetX,offsetY,gap);
}
void shell(int X, int Y, int Z, int thick, int offsetX, int offsetY, int gap){
  int gap2;
  int gap3;
  int gap4;
  gap2 = gap+gap;
  gap3 = gap2+gap;
  gap4 = gap3+gap;
  int spacer = 20;
  int spacer2 = spacer + spacer;
  int spacer3 = spacer2 + spacer;
  int spacer4 = spacer3 + spacer;
  //top and bottom
  boxType2(spacer+offsetX,spacer2+X+Y+offsetY,thick,X+gap2,Y+gap2);
  boxType2(spacer2+offsetX+X+gap2,spacer2+X+Y+offsetY,thick,X+gap2,Y+gap2);
  //left and right
  boxType1(spacer3+offsetX+X+gap4+X,spacer2+X+Y+offsetY,thick,Z+gap2,Y+gap2);
  boxType1(spacer4+offsetX+X+gap4+gap2+X+Y,spacer2+X+Y+offsetY,thick,Z+gap2,Y+gap2);
  //back
  boxType1(spacer+offsetX,spacer3+X+Y+offsetY+Y+gap2,thick,Z+gap2,X+gap2);
  //front
  boxType1(spacer2+offsetX+gap2+Z,spacer3+X+Y+offsetY+Y+gap2,thick,Z+gap2,X+gap2);
  boxType5(spacer2+offsetX+gap2+Z+thick+32,spacer3+X+Y+offsetY+Y+gap2+thick+36,thick,Z-72,X-36);

}
void drawer(int X, int Y, int Z, int thick, int offsetX, int offsetY){
   int spacer = 20;
   int spacer2 = spacer + spacer;
   int spacer3 = spacer2 + spacer;
   boxType2(spacer+offsetX,offsetY,thick,X,Y);
   boxType3(spacer2+X+offsetX,offsetY,thick,Z,Y);
   boxType3(spacer3+X+Z+offsetX,offsetY,thick,Z,Y);
   boxType3(spacer+offsetX,spacer+Y+offsetY,thick,Z,X);
   boxType4(spacer2+Z+offsetX,spacer+Y+offsetY,thick,Z,X);
}
void slot(int X, int Y, int Z, int thick, int offsetX, int offsetY){
   int spacer = 20;
   int spacer2 = spacer + spacer;
   int spacer3 = spacer2 + spacer;
   boxType2(spacer+offsetX,offsetY,thick,X,Y);
   boxType3(spacer2+X+offsetX,offsetY,thick,Z,Y);
   boxType6(spacer3+X+Z+offsetX,offsetY,thick,Z,Y);
   boxType3(spacer+offsetX,spacer+Y+offsetY,thick,Z,X);
}

void boxType1 (int offsetX,int offsetY, int thickness, int xLength, int yWidth){
  int xThird;
  int yThird;
  xThird = xLength/3;
  yThird = yWidth/3;
  beginShape();
    //top
    vertex(offsetX+thickness,offsetY+thickness);
    vertex(xThird+offsetX,offsetY+thickness);
    vertex(xThird+offsetX,offsetY);
    vertex(xThird+xThird+offsetX,offsetY);
    vertex(xThird+xThird+offsetX,offsetY+thickness);
    vertex(xLength+offsetX-thickness,offsetY+thickness);
    //Right
    vertex(xLength+offsetX-thickness,yThird+offsetY);
    vertex(xLength+offsetX,yThird+offsetY);
    vertex(xLength+offsetX,yThird+yThird+offsetY);
    vertex(xLength+offsetX-thickness,yThird+yThird+offsetY);
    vertex(xLength+offsetX-thickness,yWidth+offsetY);
    //bottom
    vertex(xThird+xThird+offsetX,yWidth+offsetY);
    vertex(xThird+xThird+offsetX,yWidth+offsetY-thickness);
    vertex(xThird+offsetX,yWidth+offsetY-thickness);
    vertex(xThird+offsetX,yWidth+offsetY);
    vertex(offsetX+thickness,yWidth+offsetY);
    //Left
    vertex(offsetX+thickness,yThird+yThird+offsetY);
    vertex(offsetX,yThird+yThird+offsetY);
    vertex(offsetX,yThird+offsetY);
    vertex(offsetX+thickness,yThird+offsetY);
    vertex(offsetX+thickness,offsetY+thickness);
  endShape();

}

void boxType2 (int offsetX,int offsetY, int thickness, int xLength, int yWidth){
  int xThird;
  int yThird;
  xThird = xLength/3;
  yThird = yWidth/3;
  beginShape();
    //top
    vertex(offsetX,offsetY);
    vertex(xThird+offsetX,offsetY);
    vertex(xThird+offsetX,thickness+offsetY);
    vertex(xThird+xThird+offsetX,thickness+offsetY);
    vertex(xThird+xThird+offsetX,offsetY);
    vertex(xLength+offsetX,offsetY);
    //Right
    vertex(xLength+offsetX,yThird+offsetY);
    vertex(xLength+offsetX-thickness,yThird+offsetY);
    vertex(xLength+offsetX-thickness,yThird+yThird+offsetY);
    vertex(xLength+offsetX,yThird+yThird+offsetY);
    vertex(xLength+offsetX,yWidth+offsetY);
    //bottom
    vertex(xThird+xThird+offsetX,yWidth+offsetY);
    vertex(xThird+xThird+offsetX,yWidth+offsetY-thickness);
    vertex(xThird+offsetX,yWidth+offsetY-thickness);
    vertex(xThird+offsetX,yWidth+offsetY);
    vertex(offsetX,yWidth+offsetY);
    //Left
    vertex(offsetX,yThird+yThird+offsetY);
    vertex(offsetX+thickness,yThird+yThird+offsetY);
    vertex(offsetX+thickness,yThird+offsetY);
    vertex(offsetX,yThird+offsetY);
    vertex(offsetX,offsetY); 
  endShape();
}
void boxType3 (int offsetX, int offsetY, int thickness, int xLength, int yWidth){
  int xThird;
  int yThird;
  xThird = xLength/3;
  yThird = yWidth/3;
  beginShape();
    //top
    vertex(offsetX+thickness,offsetY+thickness);
    vertex(xThird+offsetX,offsetY+thickness);
    vertex(xThird+offsetX,offsetY);
    vertex(xThird+xThird+offsetX,offsetY);
    vertex(xThird+xThird+offsetX,offsetY+thickness);
    //Right
    vertex(xLength+offsetX,offsetY+thickness);
    vertex(xLength+offsetX,offsetY+yWidth);
    //bottom
    vertex(xThird+xThird+offsetX,yWidth+offsetY);
    vertex(xThird+xThird+offsetX,yWidth+offsetY-thickness);
    vertex(xThird+offsetX,yWidth+offsetY-thickness);
    vertex(xThird+offsetX,yWidth+offsetY);
    vertex(offsetX+thickness,yWidth+offsetY);
    //Left
    vertex(offsetX+thickness,yThird+yThird+offsetY);
    vertex(offsetX,yThird+yThird+offsetY);
    vertex(offsetX,yThird+offsetY);
    vertex(offsetX+thickness,yThird+offsetY);
    vertex(offsetX+thickness,offsetY+thickness);
  endShape();

}
void boxType4 (int offsetX, int offsetY, int thickness, int xLength, int yWidth){
  int xThird;
  int yThird;
  int yHalf;
  yHalf = yWidth/2;
  xThird = xLength/3;
  yThird = yWidth/3;
  beginShape();
    //top
    vertex(offsetX+thickness,offsetY+thickness);
    vertex(xThird+offsetX,offsetY+thickness);
    vertex(xThird+offsetX,offsetY);
    vertex(xThird+xThird+offsetX,offsetY);
    vertex(xThird+xThird+offsetX,offsetY+thickness);
    //Right
    vertex(xLength+offsetX,offsetY+thickness);
    vertex(xThird+xThird+offsetX,offsetY+yHalf);
    vertex(xLength+offsetX,offsetY+yWidth);
    //bottom
    vertex(xThird+xThird+offsetX,yWidth+offsetY);
    vertex(xThird+xThird+offsetX,yWidth+offsetY-thickness);
    vertex(xThird+offsetX,yWidth+offsetY-thickness);
    vertex(xThird+offsetX,yWidth+offsetY);
    vertex(offsetX+thickness,yWidth+offsetY);
    //Left
    vertex(offsetX+thickness,yThird+yThird+offsetY);
    vertex(offsetX,yThird+yThird+offsetY);
    vertex(offsetX,yThird+offsetY);
    vertex(offsetX+thickness,yThird+offsetY);
    vertex(offsetX+thickness,offsetY+thickness);
  endShape();

}
void boxType5 (int offsetX,int offsetY, int thickness, int xLength, int yWidth){
  int xThird;
  int yThird;
  xThird = xLength/3;
  yThird = yWidth/3;
  beginShape();
    //top
    vertex(offsetX,offsetY);
    vertex(xThird+offsetX,offsetY);
    vertex(xThird+offsetX,thickness+offsetY);
    vertex(xThird+xThird+offsetX,thickness+offsetY);
    vertex(xThird+xThird+offsetX,offsetY);
    vertex(xLength+offsetX,offsetY);
    //Right
    vertex(xLength+offsetX,yWidth+offsetY);
    //bottom
    vertex(xThird+xThird+offsetX,yWidth+offsetY);
    vertex(xThird+xThird+offsetX,yWidth+offsetY-thickness);
    vertex(xThird+offsetX,yWidth+offsetY-thickness);
    vertex(xThird+offsetX,yWidth+offsetY);
    vertex(offsetX,yWidth+offsetY);
    //Left
    vertex(offsetX,yThird+yThird+offsetY);
    vertex(offsetX+thickness,yThird+yThird+offsetY);
    vertex(offsetX+thickness,yThird+offsetY);
    vertex(offsetX,yThird+offsetY);
    vertex(offsetX,offsetY); 
  endShape();
}
void boxType6 (int offsetX, int offsetY, int thickness, int xLength, int yWidth){
  int xThird;
  int yThird;
  xThird = xLength/3;
  yThird = yWidth/3;
  beginShape();
    //top
    vertex(offsetX+thickness,offsetY);
    vertex(xThird+offsetX,offsetY);
    vertex(xThird+offsetX,offsetY+thickness);
    vertex(xThird+xThird+offsetX,offsetY+thickness);
    vertex(xThird+xThird+offsetX,offsetY);
    //Right
    vertex(xLength+offsetX,offsetY);
    vertex(xLength+offsetX,offsetY+yWidth);
    //bottom
    vertex(xThird+xThird+offsetX,yWidth+offsetY);
    vertex(xThird+xThird+offsetX,yWidth+offsetY-thickness);
    vertex(xThird+offsetX,yWidth+offsetY-thickness);
    vertex(xThird+offsetX,yWidth+offsetY);
    vertex(offsetX+thickness,yWidth+offsetY);
    //Left
    vertex(offsetX+thickness,yThird+yThird+offsetY);
    vertex(offsetX,yThird+yThird+offsetY);
    vertex(offsetX,yThird+offsetY);
    vertex(offsetX+thickness,yThird+offsetY);
    vertex(offsetX+thickness,offsetY);
  endShape();
}


