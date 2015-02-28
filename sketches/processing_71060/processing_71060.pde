
//debugging

void test()
{
  String test = "success!";
  println(test);
}

//variables

int initialX;
int initialY;
int finalX;
int finalY;
boolean typeMode = false;
int cursorTimer = 0;
int cursorStroke = 125;
int charNum = 0;
boolean firstKeyTyped = false;
boolean mouseBeenDragged = false;
int boxPixelX;
int boxPixelY;
int maxX;





//arrays

char[] textLine = new char[25];

void setup()
{
  size(800, 600);
  background(215);
  noFill();
  textSize(24);
}

void draw()
{
  if (typeMode)
  {
    type();
    cursorTimer = cursorTimer + 1;
    if (cursorTimer>30)
    {
      cursorStroke = 215;
    }
    else {
      cursorStroke = 125;
    }
    if (cursorTimer >60)
    {
      cursorTimer = 0;
    }
  }
  else {
    cursorTimer = 0;
  }
}

//sets initial mouse coordinates

void mousePressed()
{
  typeMode = false;
  initialX = mouseX;
  initialY = mouseY;

  mouseBeenDragged = false;

  //debug
  println("current coordinates: " + mouseX + ", " + mouseY + " get: " + get(mouseX, mouseY));
}



//sets final coordinates

void mouseDragged()
{
  mouseBeenDragged = true;
  stroke(75);
  background(215);
  finalX = mouseX;
  finalY = mouseY;
  if (finalX>initialX && finalY>initialY)
  {
    quad(initialX, initialY, finalX, initialY, finalX, finalY, initialX, finalY);
  }
  else {
    line(initialX, initialY, initialX+3, initialY);
    line(initialX, initialY, initialX, initialY+3);
  }
}

//starts type tool, creates minimum size type box

void mouseReleased()
{
  if (mouseBeenDragged)
  {
    type();
  }
}

//type tool

void type()
{
  background(215);
  stroke(75);
  if (finalX>initialX && finalY>initialY)
  {
    if (finalY-initialY>50 && finalX-initialX>120 && maxX<finalX)
    {
      quad(initialX, initialY, finalX, initialY, finalX, finalY, initialX, finalY);
    }
     if (maxX>finalX)
      {
        quad(initialX, initialY, maxX, initialY, maxX, finalY, initialX, finalY);
      }
    else {
      quad(initialX, initialY, initialX+120, initialY, initialX+120, initialY+50, initialX, initialY+50);
    }
  }

  typeMode = true;
  typeCursor();
  textEnter();
  furthestLetter();
}

//flashing vertical line

void typeCursor()
{
  stroke(cursorStroke);
  line(initialX+10, initialY+10, initialX+10, initialY+40);
}

//once a key is typed in type mode, tells program to add it to character array

void keyTyped()
{
  if (charNum<25 && typeMode && key!=BACKSPACE)
  {
    textLine[charNum] = key;
    charNum = charNum + 1;
    firstKeyTyped = true;
  }
  if (key==BACKSPACE && typeMode && charNum>0)
  {
    shorten(textLine);
    charNum = charNum - 1;
  }
}

void textEnter()
{

  if (firstKeyTyped)
  {
    fill(0);
    text(textLine, 0, charNum, initialX+10, initialY+35);
    noFill();
  }
}

//finds maximum X coordinate of fill(0) pixel inside text box
//make boxPixel increase until it reaches other corner!!

void furthestLetter()
{
  int[] charCoordX = new int[2];
  charCoordX[0] = 0;
  charCoordX[1] = 6;
  boxPixelY = initialY+1;
  while (boxPixelY<finalY)
  {
    boxPixelX = initialX+1;
    while (boxPixelX<finalX)
    {
      //println(get(boxPixelX, boxPixelY));
      if (get(boxPixelX, boxPixelY) == -16777216)
      {
        //println(boxPixelX);
        charCoordX = append(charCoordX, boxPixelX);
        maxX = max(charCoordX);
        println(maxX);
      }


      //println(charCoordX + ", " + charCoordY);
      //println(boxPixelX + ", " + boxPixelY);
      //point(boxPixelX, boxPixelY);

      boxPixelX=boxPixelX + 1;
    }


    boxPixelY = boxPixelY + 1;
  }
}
