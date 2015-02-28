
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
 ******************************/

int arrayLength = 11;

PImage[] imageArray = new PImage [ arrayLength ];
float[] xCoordinateArray = new float[ arrayLength ];
float[] yCoordinateArray = new float[ arrayLength ];
float imageSize = 100;

//xls book
import de.bezier.data.*;
XlsReader reader;

int dragNumber = -1;

void setup()
{
  size(798, 760);
  background(255);

  //load xls file for connections
  reader = new XlsReader( this, "workbook.xls" );    // assumes file to be in the data folder


  //load images
  for (int i = 0; i <  arrayLength; i++)
  {
    imageArray[i] =   loadImage(i + ".jpg");
    xCoordinateArray[i] = random( width);
    yCoordinateArray[i] = random( height);

    image( imageArray[i], xCoordinateArray[i], yCoordinateArray[i], 60, 60);
  }
}

void draw()
{
  //wipe background clean
  background(255);

  //drawing of the lines between the pictures using the XLS workbook, connections column 2
  strokeWeight(6);
  stroke(255, 0, 0);
  for ( int i = 0; i < arrayLength ; i = i + 1 )
  {
    int value2 = int(reader.getInt( i, 1 ));//i th cell of column 2
    //- imageSize/2 because of middle of the image
    line (  xCoordinateArray[i]+ imageSize/2, yCoordinateArray[i]+ imageSize/2, xCoordinateArray[value2]+ imageSize/2, yCoordinateArray[value2]+ imageSize/2);
  }


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


