
/******************************
 *
 * draws pictures and lines between pictures 
 *
 * you can drag the pictures around (don not move too fast !!!!)
 *
 * if pictures are close, they will push each pother away
 *
 * the images used are from a laser shirt from contrechoc
 *
 * key interaction for connections key: 1,2,3,4
 *
 ******************************/

int arrayLength = 7;

PImage[] imageArray = new PImage [ arrayLength ];
float[] xCoordinateArray = new float[ arrayLength ];
float[] yCoordinateArray = new float[ arrayLength ];
float imageSize = 50;

/*
//xls book
 import de.bezier.data.*;
 XlsReader reader;
 */

int[] xlsSheetColumn0 = {
  0, 1, 2, 3, 4, 5, 6
}; //this can be done from an xls sheet
int[] xlsSheetColumn1 = {
  3, 3, 3, 3, 5, 5, 5
};
int[] xlsSheetColumn2 = {
  3, 3, 3, 3, 5, 5, 5
};
int[] xlsSheetColumn3 = {
  4, 4, 2, 2, 1, 1, 1
};
int[] xlsSheetColumn4 = {
  5, 5, 5, 5, 5, 5, 5
};

int dragNumber = -1;
int columnNumber = 1;

PFont fontA;

void setup()
{
  size(798, 760);
  smooth();

  /*
  //load xls file for connections
   reader = new XlsReader( this, "workbook.xls" );    // assumes file to be in the data folder
   */

  //load images
  for (int i = 0; i <  arrayLength; i++)
  {
    imageArray[i] =   loadImage(xlsSheetColumn0[i] + ".jpg");
    xCoordinateArray[i] = random( height*.6 + 250); //drawing random, but a bit in the middle
    yCoordinateArray[i] = random( width*.6 + 250);

    image( imageArray[i], xCoordinateArray[i], yCoordinateArray[i], 60, 60);
  }

  //load font
  fontA = loadFont("ArialNarrow-Bold-48.vlw");
  textFont(fontA, 32);
}

void draw()
{
  //wipe background clean
  background(125);

  fill( 100);
  text ( "example connections", 20, 50);
  text ( "draggable images", 20, 80);
  text ( "connections from column " + columnNumber, 20, 110);
  text ( "images contrechoc.com ", 20, 140);

  drawLines( columnNumber );

  //draw all images
  for (int i = 0; i < arrayLength; i++)
  {
    float xPos = xCoordinateArray[i];
    float yPos = yCoordinateArray[i];
    //draw images
    image(imageArray[i], xPos, yPos, 60, 60);
    //if images too close or on top push them from each other
    pushImageFromImage(xCoordinateArray[i], yCoordinateArray[i], i);

    //look for mouseOver, if so change image
    boolean  mouseOnImage = mouseX > xPos && mouseX < xPos + imageSize && mouseY > yPos && mouseY < yPos + imageSize;
    if ( mouseOnImage == true && dragNumber == -1 ) //only bigger when not dragged
    {

      image(imageArray[i], xPos -20, yPos - 20, 100, 100); //this is making image bigger, can also be loading another image
    }
  }

  if ( !mousePressed ) dragNumber = -1;//reset variable for speeding up dragging after mouse release
}

void keyPressed() {
  if ( key == '1') columnNumber = 1;
  if ( key == '2') columnNumber = 2;
  if ( key == '3') columnNumber = 3;
  if ( key == '4') columnNumber = 4;
}

void drawLines( int whichColumn ) {

  //drawing of the lines between the pictures using the XLS workbook, connections column 2
  strokeWeight(5);

  if ( whichColumn == 1) stroke(255, 0, 0);
  if ( whichColumn == 2) stroke(255, 255, 0);
  if ( whichColumn == 3) stroke(255, 0, 255);
  if ( whichColumn == 4) stroke(0, 255, 255);

  for ( int i = 0; i < arrayLength ; i = i + 1 )
  {
    int value2 = 0;
    // value2 = int(reader.getInt( i, whichColumn ));//i th cell of column 2

    //from the arrays coming from the xls sheet:
    if ( whichColumn == 1) value2 = xlsSheetColumn1[i];
    if ( whichColumn == 2) value2 = xlsSheetColumn2[i];
    if ( whichColumn == 3) value2 = xlsSheetColumn3[i];
    if ( whichColumn == 4) value2 = xlsSheetColumn4[i];


    //- imageSize/2 because of middle of the image
    line (  xCoordinateArray[i]+ imageSize/2, yCoordinateArray[i]+ imageSize/2, xCoordinateArray[value2]+ imageSize/2, yCoordinateArray[value2]+ imageSize/2);
  }
}

void pushImageFromImage(float xPos, float yPos, int counter) {
  //if images too close or on top push them from each other
  for (int i = 0; i < arrayLength; i++)
  {
    if ( i != counter ) {

      // if images are too close using the distance function
      if (  dist(xCoordinateArray[i], yCoordinateArray[i], xPos, yPos) <= imageSize )
      {
        if ( xCoordinateArray[i] <= xPos ) xCoordinateArray[i]-=2; //push image to right direction
        if ( xCoordinateArray[i] >= xPos ) xCoordinateArray[i]+=2; //the same
        if ( yCoordinateArray[i] <= yPos )  yCoordinateArray[i]-=2; //the same
        if ( yCoordinateArray[i] >= yPos )  yCoordinateArray[i]+=2; //the same
      }
    }
  }
}


void mouseDragged() { //called when mosue is presed and dragging

  if ( dragNumber == -1  ) { //do this loop only if there is not dragging already going on
    for (int i = 0; i < arrayLength; i++)
    {
      float xPos = xCoordinateArray[i];
      float yPos = yCoordinateArray[i];

      //look which image is dragged, that is mouse within image bounds
      boolean  mouseOnImage = mouseX > xPos && mouseX < xPos + imageSize && mouseY > yPos && mouseY < yPos + imageSize;

      if (  mouseOnImage == true  ) {
        xCoordinateArray[i] = mouseX - imageSize/2; //make the mouseCoordinate the position of image and image follows mouse
        yCoordinateArray[i] = mouseY- imageSize/2; //make the mouseCoordinate the position of image and image follows mouse
        image(imageArray[i], xCoordinateArray[i], yCoordinateArray[i], 60, 60);
        dragNumber = i;
      }
    }
  }
  else { //the dragged image is already found
    xCoordinateArray[dragNumber] = mouseX - imageSize/2; //make the mouseCoordinate the position of image and image follows mouse
    yCoordinateArray[dragNumber] = mouseY- imageSize/2; //make the mouseCoordinate the position of image and image follows mouse
    image(imageArray[dragNumber], xCoordinateArray[dragNumber], yCoordinateArray[dragNumber], 60, 60);
  }
}


