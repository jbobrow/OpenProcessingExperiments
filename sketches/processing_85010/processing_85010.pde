
/* 
 FUNCTIONS 
 */

/* 
 Check if neighboring space is occupied 
 */
int checkNeighboringSpace (int[ ] theArray, int currentPixIndex, int neighborDirection, int imageWidth, int imgHeight)
{
  // Return value, 1 if neighbor is empty, otherwise -1
  int neighborIsEmpty = -1;

  // Check the neighboring space
  int neighboringPixIndex = obtainNeighborIndex (currentPixIndex, neighborDirection, imageWidth, imgHeight);
  if ( neighboringPixIndex == -1) // If the neighbour is over the edge
  {
    neighborIsEmpty = 1; // It's assumed an empty space
  }
  else if (theArray[neighboringPixIndex] != 1)
  {
    neighborIsEmpty = 1; // The neighboring space is empty
  }

  // Return
  return neighborIsEmpty;
} // end checkNeighboringSpace

/* Obtain neighbor pixel array index */
int obtainNeighborIndex (int currentPixIndex, int neighborDirection, int imageWidth, int imageHeight)
{
  // Get x,y coordinate of the pixel whose neighbor is sought
  int currentPix_X = currentPixIndex % imageWidth;
  int currentPix_Y = ( currentPixIndex - currentPix_X ) / imageWidth;

  // Variables to store neuihboring pixel x,y coordinate and index
  int neighborPix_X = 0;
  int neighborPix_Y = 0;
  int neighborPixIndex = 0;

  // Use switch to calculate pix index based on direction, based on the schema illustrated below
  // 0 1 2
  // 3 . 4
  // 5 6 7
  switch (neighborDirection)
  {
  case 0: // North West
    // Edge cutoff
    if (currentPix_X == 0 || currentPix_Y == 0)
    {
      neighborPixIndex = -1;
    }
    else 
    {
      neighborPix_X = currentPix_X - 1;
      neighborPix_Y = currentPix_Y - 1;
    } 
    break;
  case 1: // North
    // Edge cutoff
    if (currentPix_Y == 0)
    {
      neighborPixIndex = -1;
    }
    else
    {
      neighborPix_X = currentPix_X;
      neighborPix_Y = currentPix_Y - 1;
    }
    break;
  case 2: // North East
    // Edge cutoff
    if (currentPix_X == (imageWidth-1) || currentPix_Y == 0)
    {
      neighborPixIndex = -1;
    }
    else
    {
      neighborPix_X = currentPix_X + 1;
      neighborPix_Y = currentPix_Y - 1;
    }
    break;
  case 3: // West
    // Edge cutoff
    if (currentPix_X == 0)
    {
      neighborPixIndex = -1;
    }
    else
    {
      neighborPix_X = currentPix_X - 1;
      neighborPix_Y = currentPix_Y;
    }
    break;
  case 4: // East
    // Edge cutoff
    if (currentPix_X == (imageWidth-1))
    {
      neighborPixIndex = -1;
    }
    else
    {
      neighborPix_X = currentPix_X + 1;
      neighborPix_Y = currentPix_Y;
    }
    break;
  case 5: // South West
    // Edge cutoff
    if (currentPix_X == 0 || currentPix_Y == (imageHeight-1))
    {
      neighborPixIndex = -1;
    }
    else
    {
      neighborPix_X = currentPix_X - 1;
      neighborPix_Y = currentPix_Y + 1;
    }  
    break;
  case 6: // South
    // Edge cutoff
    if (currentPix_Y == (imageHeight-1))
    {
      neighborPixIndex = -1;
    }
    else
    {
      neighborPix_X = currentPix_X;
      neighborPix_Y = currentPix_Y + 1;
    }
    break;
  case 7: // South East
    // Edge cutoff
    if (currentPix_X == (imageWidth-1) || currentPix_Y == (imageHeight-1))
    {
      neighborPixIndex = -1;
    }
    else
    {
      neighborPix_X = currentPix_X + 1;
      neighborPix_Y = currentPix_Y + 1;
    }
    break;
  } // end switch

  // Calculate the neighbor pixel index
  if (neighborPixIndex != -1) // if the neighboring pixel is not over the edge
  {
    neighborPixIndex = neighborPix_X + (neighborPix_Y * imageWidth);
  }

  // Return value
  return neighborPixIndex;
} // end obtainNeighborIndex

// Use this to get either the X or Y value from pixel index
int obtainPix_XY (char theAxis, int currentPixIndex, int imgWidth, int imgHeight) 
{
  int theAxisValue = 0;
  switch (theAxis) 
  {
  case 'x':
    theAxisValue = currentPixIndex % imgWidth;
    break;
  case 'y':
    theAxisValue = ( currentPixIndex - (currentPixIndex % imgWidth) ) / imgWidth;
  }
  return theAxisValue;
} // end obtainPix_X

// Converting an array into an image
void convertArrayToImage(int[ ] sourceArray, PImage targetImg)
{
  targetImg.loadPixels(); // initiate pixels array of target image
  for (int i = 0; i < sourceArray.length; i++)
  {
    if (sourceArray[i] == 1) // If pixel space is occupied
    {
      targetImg.pixels[i] = color(0, 0, 0); // Draw as black
    }
    else if (sourceArray[i] == 0) // If pixel space is empty
    {
      targetImg.pixels[i] = color(255, 255, 255);  // Draw as white
    }
  }
} // end convertArrayToImage

