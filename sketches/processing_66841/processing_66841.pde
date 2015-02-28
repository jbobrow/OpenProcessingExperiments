
/*---------------------------------------------------------------------------
Created Name : Sukij Lertpradist
Created Date : 08/08/2012
Desc         : Animation for Assignment 01(London Olympic Game 2012) Subject idea9204 Sydney University
---------------------------------------------------------------------------*/



//-------------- DECLARE VARIABLE
int endPointX =800; // >>INPUT: SizeX
int endPointY =600; // >>INPUT: SizeY
int colmNum =15;     // >>INPUT: colmNum
int rowNum =10;      // >>INPUT: rowNum
int startPointX =0;
int startPointY =0;
int centerPointX;
int centerPointY;

color[] colorCode = new color[12];
int currentColorCode = 0;
int bakcurrentColorCode =0;
String message = "YOU WIN";
String message2 = "London Olympic Game 2012";

int msgSize  = 25;
int msgAlpha = 255;
int msgMode  = 0; // 0=Increate Size; 1=Decreate Size
//-------------- SETUP()
void setup() {
  frameRate(15);

  size(endPointX, endPointY);
  colorMode(RGB);
  centerPointX = endPointX/2;
  centerPointY = endPointY/2;


  // Set Color Code
  colorCode[0]  = color(255, 0, 0);
  colorCode[1]  = color(255, 0, 150); 
  colorCode[2]  = color(255, 0, 255);
  colorCode[3]  = color(150, 0, 255);
  colorCode[4]  = color(  0, 0, 255);
  colorCode[5]  = color(  0, 150, 255);
  colorCode[6]  = color(  0, 255, 255);
  colorCode[7]  = color(  0, 255, 150);
  colorCode[8]  = color(  0, 255, 0);
  colorCode[9]  = color(150, 255, 0);
  colorCode[10] = color(255, 255, 0);
  colorCode[11] = color(255, 150, 0);
}


//-------------- Check ColorCode
void ChkColorCode() {
  if ( currentColorCode == colorCode.length-1) {
    currentColorCode = 0;
  }
  else {
    currentColorCode++;
  }
}


//-------------- DRAW()
void draw() {
  //-------------- START BG Color
  ChkColorCode();
  bakcurrentColorCode = currentColorCode;

  for (int colmX = 0; colmX < colmNum; colmX++) {
    fill(colorCode[currentColorCode]);
    noStroke();
    triangle(colmX*endPointX/colmNum, startPointY, 
    (colmX+1)*endPointX/colmNum, startPointY, 
    centerPointX, centerPointY);
    ChkColorCode();
  }

  for (int rowY = 0; rowY < rowNum; rowY++) {
    fill(colorCode[currentColorCode]);
    noStroke();
    triangle(endPointX, rowY*endPointY/rowNum, 
    endPointX, (rowY+1)*endPointY/rowNum, 
    centerPointX, centerPointY);
    ChkColorCode();
  }

  for (int colmX = colmNum; colmX > 0; colmX--) {
    fill(colorCode[currentColorCode]);
    noStroke();
    triangle(colmX*endPointX/colmNum, endPointY, 
    (colmX+1)*endPointX/colmNum, endPointY, 
    centerPointX, centerPointY);
    ChkColorCode();
  }

  for (int rowY = rowNum; rowY >= 0; rowY--) {
    fill(colorCode[currentColorCode]);
    noStroke();
    triangle(startPointX, rowY*endPointY/rowNum, 
    startPointX, (rowY+1)*endPointY/rowNum, 
    centerPointX, centerPointY);
    ChkColorCode();
  }
 
  currentColorCode= bakcurrentColorCode;
  
  //-------------- Effect Number
  if (msgSize > 30) {
    msgMode=1;
  }
  else if (msgSize < 25) {
    msgMode=0;
  }

  if (msgMode ==0) {
    msgSize += 1;
    msgAlpha -=20;
  }else{
    msgSize -= 1;
    msgAlpha +=20;
  }
  
  //-------------- Set Satuation for BG
  fill(255, 255, 255 , 150);
  rect( startPointX, startPointY , endPointX, endPointY);
  
  //-------------- Random Rect Effect
  fill(255, 255, 255, random(0,200));
  float tmpRandomX = random(0,endPointX);
  float tmpRandomY = random(0,endPointY);
  float tmpRandomSize = random(10,20);
  ellipse( tmpRandomX, tmpRandomY , tmpRandomX+tmpRandomSize, tmpRandomX+tmpRandomSize);
  
  //-------------- BG Circle White
  noStroke();
  fill(0, 0, 0);
  ellipse(centerPointX, centerPointY, 20, 20);

  fill(255, 255, 255, 180);
  ellipse(centerPointX, centerPointY, 260, 260);

  smooth();
  stroke(180, 180, 180);
  strokeWeight(2);
  fill(255, 255, 255, 200);
  ellipse(centerPointX, centerPointY, 300, 300);

  //-------------- Message
  fill(0, 0, 0, msgAlpha);
  textSize (msgSize); 
  textAlign(CENTER);
  text(message, centerPointX, centerPointY+80);
  
  fill(0, 0, 0, 180);
  textSize (10);
  text(message2, centerPointX, centerPointY+100);
  
  //-------------- Logo 5 Rings
  smooth();
  noFill();
  strokeWeight(8);
  stroke(0, 0, 0, msgAlpha);
  ellipse(centerPointX, centerPointY-40, 80, 80);
  stroke(6, 109, 209, msgAlpha);
  ellipse(centerPointX-60, centerPointY-40, 80, 80);
  stroke(255, 0, 0, msgAlpha);
  ellipse(centerPointX+60, centerPointY-40, 80, 80);
  stroke(255, 207, 0, msgAlpha);
  ellipse(centerPointX-30, centerPointY, 80, 80);
  stroke(0, 160, 50, msgAlpha);
  ellipse(centerPointX+30, centerPointY, 80, 80);
}

