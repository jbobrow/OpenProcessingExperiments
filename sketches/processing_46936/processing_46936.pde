
PImage pencilButton;
PImage penButton;
PImage rectangleButton;
PImage ellipseButton;
int toolID = 0;
boolean drawingMode;
Line myLine;
Rectangle myRect;
Ellipse myEllipse;

void setup(){
  size(1000,600);
  background(255);
  frameRate(60);
  fill(0);
  myLine = new Line();
  myRect = new Rectangle();
  myEllipse = new Ellipse();
}
void draw(){
  if(!drawingMode){
    background(255);
  }
  textAlign(CENTER);
  text("Paint program HCI Final Project by Liaros Georgios", width/2, 30);
  text("Press 'h' key to show help (also clears background)", width/2, 570);
  drawButtons();
  if(keyPressed && key=='h'){
    showHelp();
  }
  //println(toolID);
  switch(toolID){
    case 1:
      //drawingMode = true;
      break;
    case 2:
      drawingMode = true;
      initPencilTool();
      break;
    case 3:
      drawingMode = true;
      initPenTool();
      break;
    case 4:
      drawingMode = true;
      initRectTool();
      break;
    case 5:
      drawingMode = true;
      initEllipseTool();
      break;
  }//switch
}//draw

void drawButtons(){
  pencilButton = loadImage("pencil.png");
  penButton = loadImage("stylos.png");
  rectangleButton = loadImage("rectangle.png");
  ellipseButton = loadImage("ellipse.png");
  image(pencilButton, 10, 100);
  image(penButton, 10, 140);
  image(rectangleButton, 10, 180);
  image(ellipseButton, 13, 220);
}

void showHelp(){
  //background(255);
  fill(0);
  text("Pencil tool", 80, 120);
  text("Pen tool", 80, 160);
  text("Rectangle tool", 80, 200);
  text("Ellipse tool", 80, 240);
}

void initPencilTool(){
  if(mousePressed){
    ellipse(mouseX,mouseY, 4, 4);
  }
}



void keyReleased(){
  if(key=='h'){
    background(255);
  }
}

void mousePressed(){
  //if(drawingMode){
    //return;
 // }
  //background(255);
  if(mouseX>5 && mouseX<35 && mouseY>95 && mouseY<125){
    toolID = 2;
    println("Pencil tool selected");
    drawingMode = true;
  }
  else if(mouseX>5 && mouseX<35 && mouseY>135 && mouseY<165){
    toolID = 3;
    println("Pen tool selected");
    drawingMode = true;
  }
  else if(mouseX>5 && mouseX<35 && mouseY>175 && mouseY<205){
    toolID = 4;
    println("Rectangle tool selected");
    drawingMode = true;
  }
  else if(mouseX>5 && mouseX<35 && mouseY>215 && mouseY<245){
    toolID = 5;
    println("Ellipse tool selected");
    drawingMode = true;
  }
  //else{
    //toolID = 0;
 // }
  println(toolID);
  //println(drawingMode);
}

void initPenTool(){
  myLine.drawLine();
}

void initRectTool(){
  myRect.getRectanglePos();
  myRect.growRectangleX();
  myRect.growRectangleY();
  myRect.shrinkRectangleX();
  myRect.shrinkRectangleY();
  myRect.drawRectangle();
  myRect.colorize();
}//initRectTool

void initEllipseTool(){
  myEllipse.getEllipsePos();
  myEllipse.growEllipseX();
  myEllipse.growEllipseY();
  myEllipse.shrinkEllipseX();
  myEllipse.shrinkEllipseY();
  myEllipse.drawEllipse();
  myEllipse.colorize();
}//initEllipseTool
class Line{
  int x1Pos;
  int x2Pos;
  int y1Pos;
  int y2Pos;
  int i = 0;
  Line(){
    x1Pos = 0;
    x2Pos = 0;
    y1Pos = 0;
    y2Pos = 0;
  }
  void drawLine(){
    while(i<4){
      delay(100);
      switch(i){
        case 1:
          x1Pos = mouseX;
          y1Pos = mouseY;
          println("x1:");
          println(x1Pos);
          println("y1:");
          println(y1Pos);
          ellipse(mouseX,mouseY, 2, 2);
          i++;
          break;
        case 3:
          x2Pos = mouseX;
          y2Pos = mouseY;
          println("x2:");
          println(x2Pos);
          println("y2:");
          println(y2Pos);
          i++;
          break;
      }//switch
      if(keyPressed && key=='q'){
        //println("i = :");
        i++;
        //println(i);
      }//if
      return;
    }//while
    line(x1Pos,y1Pos,x2Pos,y2Pos);
    i = 0;
    toolID = 0;
    return;
  }//drawLine
}//class

class Rectangle{
  int xPos;
  int yPos;
  int xWidth;
  int yHeight;
  int i = 0;
  int col1,col2,col3;
  Rectangle(){
    xPos = 0;
    yPos = 0;
    xWidth = 0;
    yHeight = 0;
    i = 0;
    col1 = 0;
    col2 = 0;
    col3 = 0;
  }
  void getRectanglePos(){
    if(i == 1){
      xPos = mouseX;
      yPos = mouseY;
      i++;
      println(xPos);
      println(yPos);
    }
    if(keyPressed && key=='q'){
      i++;
    }
  }
  
  void growRectangleX(){
    if(keyPressed && keyCode==RIGHT){
      xWidth += 5;
    }
  }
  void growRectangleY(){
    if(keyPressed && keyCode==DOWN){
      yHeight +=5;
    }
  }
  void shrinkRectangleX(){
    if(keyPressed && keyCode==LEFT){
      xWidth -= 5;
    }
  }
  void shrinkRectangleY(){
    if(keyPressed && keyCode==UP){
      yHeight -= 5;
    }
  }
  void drawRectangle(){
    if((xPos == 0) || (yPos == 0) || (xWidth == 0) || (yHeight == 0)){
      return;
    }
    else{
      if(keyPressed && key==ENTER){
        delRectangle();
        return;
      }
      background(255);
      fill(col1,col2,col3);
      rect(xPos,yPos,xWidth,yHeight);
      fill(0);
    }
  }//drawRectangle
  void delRectangle(){
    xPos = 0;
    yPos = 0;
    xWidth = 0;
    yHeight = 0;
    i = 0;
    toolID = 0;
  }//delRectangle
  void colorize(){
    if(key=='c'){
      println("colorizing...");
      text("change color R = Left mouse button, G = Middle mouse button, B = Right mouse button",width/2, 550);
      if(mousePressed && mouseButton==LEFT){
        col1+=10;
        col1%=255;
      }
      else if(mousePressed && mouseButton==CENTER){
        col2+=10;
        col2%=255;
      }
      else if(mousePressed && mouseButton==RIGHT){
        col3+=10;
        col3%=255;
      }
    }
  }
}//class

class Ellipse{
  int xPos;
  int yPos;
  int xWidth;
  int yHeight;
  int i ;
  int col1;
  int col2;
  int col3;
  Ellipse(){
    xPos = 0;
    yPos = 0;
    xWidth = 0;
    yHeight = 0;
    col1 = 0;
    col2 = 0;
    col3 = 0;
    i = 0;
  }
  void getEllipsePos(){
    if(i == 1){
      xPos = mouseX;
      yPos = mouseY;
      i++;
      println(xPos);
      println(yPos);
    }
    if(keyPressed && key=='q'){
      i++;
    }
  }
  void growEllipseX(){
    if(keyPressed && keyCode==RIGHT){
      xWidth += 5;
    }
  }
  void growEllipseY(){
    if(keyPressed && keyCode==DOWN){
      yHeight +=5;
    }
  }
  void shrinkEllipseX(){
    if(keyPressed && keyCode==LEFT){
      xWidth -= 5;
    }
  }
  void shrinkEllipseY(){
    if(keyPressed && keyCode==UP){
     yHeight -= 5;
    }
  }
  void drawEllipse(){
    if((xPos == 0) || (yPos == 0) || (xWidth == 0) || (yHeight == 0)){
     return;
    }
    else{
      if(keyPressed && key ==ENTER){
        delEllipse();
        return;
      }
      background(255);
      fill(col1,col2,col3);
      ellipse(xPos,yPos,xWidth,yHeight);
      fill(0);
    }
  }
  void delEllipse(){
    xPos = 0;
    yPos = 0;
    xWidth = 0;
    yHeight = 0;
    i = 0;
    toolID = 0;
  }
  void colorize(){
    if(key=='c'){
      println("colorizing...");
      text("change color R = Left mouse button, G = Middle mouse button, B = Right mouse button",width/2, 550);
      if(mousePressed && mouseButton==LEFT){
        col1+=10;
        col1%=255;
      }
      else if(mousePressed && mouseButton==CENTER){
        col2+=10;
        col2%=255;
      }
      else if(mousePressed && mouseButton==RIGHT){
        col3+=10;
        col3%=255;
      }
    }
  }//colorize
}//class

