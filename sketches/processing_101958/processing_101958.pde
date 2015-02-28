
int cellDim = 100;
int margin = 20;
int smallCirc = 10;
boolean [] [] cellFull = new boolean[10][10];
int numCellsX = 6;
int numCellsY = 6;
int strokeWt = 8;
int [] [] cellArray = new int[numCellsY] [numCellsX];
int [] [] colours = {{196, 63, 63}, {59, 120, 189}, {255, 243, 64}, {85, 176, 57}, {255, 255, 255}};
int numColours = 5;

void setup() {
  size(600, 600);
  background(255);
  ellipseMode(RADIUS);
  rectMode(CORNER);
  strokeWeight(strokeWt);
  stroke(10);
  for (int i = 0; i < numCellsY; i++) {
    for (int j = 0; j < numCellsX; j++) {
      int shapeNum = (int) random(0, 15);
      cellArray[i][j] = shapeNum;
      pushMatrix();
      translate(j * cellDim + cellDim/2, i * cellDim + cellDim/2);
      rotate((int) (random(0, 4))  * PI/2);
      drawShape(shapeNum);
      popMatrix();
    }
  }
}



  

void draw() 
{
}

void mouseClicked()
{
  int currentCellY = (int) (mouseY / cellDim);
  int currentCellX = (int) (mouseX / cellDim);
  int newShape = (cellArray[currentCellY][currentCellX] + (int) (random(1, 15))) % 15;
  cellArray[currentCellY][currentCellX] = newShape;
  pushMatrix();
  translate(currentCellX * cellDim + cellDim/2, currentCellY * cellDim + cellDim/2);
  rotate((int) (random(0, 4))  * PI/2);
  noStroke();
  fill(255);
  rect(-cellDim/2, -cellDim/2, cellDim, cellDim);
  stroke(strokeWt);
  drawShape(newShape);
  popMatrix();
}

void drawShape(int shapeNum) 
{
  switch(shapeNum) {
    case 0:
     shape0();
     break;
   case 1:
     shape1();
     break;
   case 2:
     shape2();
     break;
   case 3:
     shape3();
     break;
   case 4:
     shape4();
     break;
   case 5:
     shape5();
     break;
   case 6:
     shape6();
     break;
   case 7:
     shape7();
     break;
   case 8:
     shape8();
     break;
   case 9:
     shape9();
     break;
   case 10:
     shape10();
     break;
   case 11:
     shape11();
     break;
   case 12:
     shape12();
     break;
   case 13:
     shape13();
     break;
   case 14:
     shape14();
     break;
  }
}


void connections()
{
  line(-cellDim/2, 0, cellDim/2, 0);
  line(0, -cellDim/2, 0, cellDim/2);
}

void marginConnections()
{
  line(cellDim/2 - margin, 0, cellDim/2, 0);
  line(-cellDim/2 + margin, 0, -cellDim/2, 0);
  line(0, cellDim/2 - margin, 0, cellDim/2);
  line(0, -cellDim/2 + margin, 0, -cellDim/2);
}

void pickColour()
{
  int colNum = (int) (random(0, numColours));
  fill(colours[colNum][0], colours[colNum][1], colours[colNum][2]);
}


void extraCircle()
{
  pickColour();
  float flipCoin = random(0, 10);
  if (flipCoin > 3) {
    ellipse(0, 0, smallCirc, smallCirc);
  }
}

void shape0()
{
  connections();
  extraCircle();
}

void shape1()
{
  pickColour();
  ellipse(0, 0, cellDim/2 - margin, cellDim/2 - margin);
  connections();
}


void shape2()
{
  connections();
  pickColour();
  ellipse(0, 0, cellDim/2 - margin, cellDim/2 - margin);
  extraCircle();
}


void shape3()
{
  marginConnections();
  noFill();
  arc(0, 0, cellDim/2 - margin, cellDim/2 - margin, 0, 3 * PI/2);
  extraCircle();
}

void shape4()
{
  marginConnections();
  noFill();
  arc(0, 0, cellDim/2 - margin, cellDim/2 - margin, -PI/2, PI/2);
  line(0, 0, -cellDim/2, 0);
  pickColour();
  ellipse(0, 0, smallCirc, smallCirc);
}

void shape5()
{
  pickColour();
  rect(-cellDim/2 + margin, -cellDim/2 + margin, cellDim - 2 * margin, cellDim - 2 * margin);   
  connections();
}

void shape6()
{
  connections();
  pickColour();
  rect(-cellDim/2 + margin, -cellDim/2 + margin, cellDim - 2 * margin, cellDim - 2 * margin); 
  extraCircle();
}

void shape7()
{
  noFill();
  marginConnections();
  line(-cellDim/2 + margin, -cellDim/2 + margin, cellDim/2 - margin, -cellDim/2 + margin); 
  line(-cellDim/2 + margin, -cellDim/2 + margin, -cellDim/2 + margin, cellDim/2 - margin); 
  line(cellDim/2 - margin, -cellDim/2 + margin, cellDim/2 - margin, 0);
  line(-cellDim/2 + margin, cellDim/2 - margin, 0, cellDim/2 - margin);
  extraCircle();
}

void shape8()
{
  marginConnections();
  line(-cellDim/2 + margin, -cellDim/2 + margin, 0, -cellDim/2 + margin); 
  line(-cellDim/2 + margin, -cellDim/2 + margin, -cellDim/2 + margin, cellDim/2 - margin); 
  line(-cellDim/2 + margin, cellDim/2 - margin, 0, cellDim/2 - margin);
  line(0, 0, cellDim/2, 0);
  pickColour();
  ellipse(0, 0, smallCirc, smallCirc);
}
  
  
void shape9()
{
  connections();
  noFill();
  line(0, -cellDim/2 + margin, cellDim/2 - margin, 0);
  line(0, -cellDim/2 + margin, -cellDim/2 + margin, 0);
  line(0, cellDim/2 - margin, cellDim/2 - margin, 0);
  line(0, cellDim/2 - margin, -cellDim/2 + margin, 0);
}

void shape10()
{
  noFill();
  marginConnections();
  line(0, -cellDim/2 + margin, cellDim/2 - margin, 0);
  line(0, -cellDim/2 + margin, -cellDim/2 + margin, 0);
  line(0, cellDim/2 - margin, cellDim/2 - margin, 0);
  line(0, cellDim/2 - margin, -cellDim/2 + margin, 0);
  extraCircle();
}

void shape11()
{
  marginConnections();
  line(0, -cellDim/2 + margin, cellDim/2 - margin, 0);
  line(0, -cellDim/2 + margin, -cellDim/2 + margin, 0);
  line(0, cellDim/2 - margin, -cellDim/2 + margin, 0);
  extraCircle();
}

void shape12()
{
  marginConnections();
  fill(255);
  line(0, -cellDim/2 + margin, cellDim/2 - margin, 0);
  line(0, -cellDim/2 + margin, -cellDim/2 + margin, 0);
  line(0, 0, 0, cellDim/2);
  pickColour();
  ellipse(0, 0, smallCirc, smallCirc);
}
  
void shape13()
{
  fill(255);
  line(0, -cellDim/2, 0, cellDim/2);
  line(-cellDim/2, 0, -cellDim/4, 0);
  line(cellDim/2, 0, cellDim/4, 0);
  pickColour();
  ellipse(-cellDim/4, 0, smallCirc, smallCirc);
  pickColour();
  ellipse(cellDim/4, 0, smallCirc, smallCirc);
}

void shape14()
{
  fill(255);
  line(0, -cellDim/2, 0, -cellDim/4);
  line(0, cellDim/2, 0, cellDim/4);
  line(-cellDim/2, 0, -cellDim/4, 0);
  line(cellDim/2, 0, cellDim/4, 0);
  pickColour();
  ellipse(0, cellDim/4, smallCirc, smallCirc);
  pickColour();
  ellipse(0, -cellDim/4, smallCirc, smallCirc);
  pickColour();
  ellipse(-cellDim/4, 0, smallCirc, smallCirc);
  pickColour();
  ellipse(cellDim/4, 0, smallCirc, smallCirc);
}
  

  
  
  
 
      
  


