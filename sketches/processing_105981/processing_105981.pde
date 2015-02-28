

/*

 First effort at programmatically generating Mondrian type
 artworks.
 
 Each mouseclick randomly generates another layout. 
 
 The size, minimal spacing, and number of lines can be varied. 
 There is a natural cut off point in the relationship, however. 
 
 The color and number of squares is currently hardcoded
 but could likely be extended with some effort. 
 
 My algorithm for making sure that the colored squares
 do not overlap is very hack-y and not particularly extensible.
 
 */

int screenWidth = 200;
int screenHeight = 200;
int minSpace = 10;

int lineWeight = 6;
int lineCount = 4;  

int vert = 0;
int horiz = 1;

void setup()
{
  size(screenWidth, screenHeight);
  strokeWeight(lineWeight);
  createLayout();
}

void draw()
{
  // not doing anything here
}

void createLayout()
{
  background(255); //clear the screen

  int[] verticalLines = calculateLines(lineCount, minSpace, screenWidth);
  int[] horizontalLines = calculateLines(lineCount, minSpace, screenHeight);

  colorInSquares(verticalLines, horizontalLines);

  drawLines(verticalLines, vert);
  drawLines(horizontalLines, horiz);
}

void colorInSquares(int[] vLines, int[] hLines)
{
  noStroke(); // temporarily suspend stroke
  
  int[] legalOrigins = calculateLegalOrigins();

  fill(255, 0, 0); //red
  drawRandomRectangle(legalOrigins[0], vLines, legalOrigins[1], hLines);

  fill(0, 0, 255); //blue
  drawRandomRectangle(legalOrigins[2], vLines, legalOrigins[3], hLines);

  fill(255, 255, 0); //yellow
  drawRandomRectangle(legalOrigins[4], vLines, legalOrigins[5], hLines);

  stroke(000); // reset stroke to black
}

void mousePressed()
{
  setup();
}

void drawRandomRectangle(int vIndex, int[] vLines, int hIndex, int[] hLines)
{
  int originX = vLines[vIndex];
  int originY = hLines[hIndex];

  int widthToColor = 0;
  int heightToColor = 0;

  if (vIndex == 0)
  {
    widthToColor = vLines[vIndex];
    originX = 0;
  }
  else if (vIndex == vLines.length -1)
  {
    widthToColor = screenWidth - vLines[vIndex];
  }
  else
  {
    widthToColor = vLines[vIndex + 1] - vLines[vIndex];
  }

  if (hIndex == 0)
  {
    heightToColor = hLines[hIndex];
    originY = 0;
  }
  else if (hIndex == hLines.length -1)
  {
    heightToColor = screenHeight - hLines[hIndex];
  }
  else
  {
    heightToColor = hLines[hIndex + 1] - hLines[hIndex];
  }

  rect(originX, originY, widthToColor, heightToColor);
}

int[] calculateLines(int numLines, int space, int screenBoundary)
{
  int[] lines = new int[numLines];

  int tempCoord = 0;

  for (int i = 0; i < lines.length; i++)
  {
    do
    {
      tempCoord = int(random(space, screenBoundary - space));
    } 
    while (!isLineLegal (tempCoord, lines));

    lines[i] = tempCoord;
  }

  return sort(lines);
}

boolean isLineLegal(int coord, int[] existingLines)
{
  boolean result = true;

  for (int i = 0; i < existingLines.length; i++)
  {

    if ((coord - minSpace) <= existingLines[i] && existingLines[i]  <= (coord + minSpace))
    {
      result = false;
    }
  }

  return result;
}

void drawLines(int[] lines, int orientation)
{
  for (int i = 0; i < lines.length; i++)
  {
    if (orientation == vert)
    {
      line(lines[i], 0, lines[i], screenHeight);
    }
    else {
      line(0, lines[i], screenWidth, lines[i]);
    }
  }
}

int[] calculateLegalOrigins()
{
  int[] result = new int[6];

  for (int i = 0; i < result.length; i++)
  {
    result[i] = int(random(0, 3));
  }

  if ((result[0] == result[2] && result[1] == result[3]) || (result[2] == result[4] && result[3] == result[5]) || (result[0] == result[4] && result[1] == result[5]))
  {
    return calculateLegalOrigins();
  }
  else
  {
    return result;
  }
}



