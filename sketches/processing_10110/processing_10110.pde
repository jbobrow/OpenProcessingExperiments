
/**
 * StringArt
 * by Jim Medlock
 *
 * This is a re-creation of an Apple II Basic program I wrote in the late 70's.
 * That program drew a series of different colored spinning lines that bounced
 * off the edges of the canvas. It was fairly simple to write, but the result 
 * was satisfying.
 *
 * I've since forgotten the original algorithm I'd used so for this implementation
 * the code is patterned after John Bokma's BouncingLines applet 
 * (http://johnbokma.com/java/applet-animation.html).
 */
 
 /* Line colors */
 int     colorIdx = 0;
 color   lineColor;
 color   redColor = #FF0303;
 color   greenColor = #078B15;
 color   blueColor = #1A0CF0;
 color   yellowColor = #FAFF03;
 color   whiteColor = #FFFFFF;
 color   blackColor = #000000;
 color   backgroundColor = whiteColor;
 
 /* Display Window */
 int     windowWidth = 500;
 int     windowHeight = 500;
 int     iterCount = 100;                               /* No. times to cycle through */
 
 /* Line geometry */
 int     noLines = 30;                                  /* No. lines to display */
 int     firstLine = 0;                                 /* Index to the first line in the buffer */
 int     lastLine = 1;                                  /* Index to the last line in the buffer */
 int     currentLine = 0;                               /* Index to the current line in the buffer */
 int     currentLineCt = 0;                             /* Current line count */
 float   lineWeight = 2;                                /* Line width */
 
 float[] lineStartX = new float[noLines];               /* Buffer containing line coordinates */
 float[] lineStartY = new float[noLines];               /* ..This is a circular buffer */
 float[] lineEndX = new float[noLines];                 /* ..that is noLines in size and is */
 float[] lineEndY = new float[noLines];                 /* ..indexed by firstLine and currentLine */
 
 float   offsetStartX = 2.0 + ( 3.0 * random(1));
 float   offsetStartY = 2.0 + ( 3.0 * random(1));
 float   offsetEndX = 2.0 + ( 3.0 * random(1));
 float   offsetEndY = 2.0 + ( 3.0 * random(1));
 
 void setup() {
   randomSeed(0);
   
   /* Set color and animation attributes */
   frameRate(15);
   smooth();
   
   /* Set basic display window attributes */
   size(windowWidth,windowHeight);
   background(backgroundColor);
   strokeWeight(lineWeight);
   
   /* Set color attributes */
   colorMode(HSB);
   
   /* Set lines in the buffer to initial coordinates */
   lineStartX[0] = windowWidth * random(1);
   lineStartY[0] = windowHeight * random(1);
   lineEndX[0] = windowWidth * random(1);
   lineEndY[0] = windowHeight * random(1);
   for (int i=1; i<noLines; i+=1) {
     lineStartX[i] = lineStartX[0];
     lineStartY[i] = lineStartY[0];
     lineEndX[i] = lineEndX[0];
     lineEndY[i] = lineEndY[0];
   }
 }
 
/*
 * Function:     draw
 * Purpose:      A function automatically called by Processing.js to generate the display window
 * Description:  Invokes the drawline function to draw the lines onto the display window. 
 */
 void draw() {
   drawline(); 
 }
 
/*
 * Function:     drawline
 * Purpose:      Draw the next line in graphics window.
 * Description:  Update the buffer to display the current line, erase the oldest line in the buffer, and
 *               then generate the next line.
 */
  void drawline() {
    /* Draw the current line */
    stroke(setcolor());
    line(lineStartX[currentLine],lineStartY[currentLine],lineEndX[currentLine],lineEndY[currentLine]);
    
    /* Clear the oldest line in the buffer */
    currentLineCt += 1;
    if (currentLineCt > (noLines-1)) {
      lastLine -= 1;
      if (lastLine < 0) {
        lastLine = noLines - 1;
      }
      /* println(firstLine+" "+currentLine+" "+lastLine); */
      stroke(backgroundColor);
      line(lineStartX[lastLine],lineStartY[lastLine],lineEndX[lastLine],lineEndY[lastLine]);
    }
    
    /* Calculate the coordinates of the next line in the buffer */
    currentLine=firstLine;
    firstLine -= 1;
    if (firstLine < 0 ) {
      firstLine = noLines - 1;
    }
    lineStartX[firstLine] = lineStartX[currentLine];
    lineStartY[firstLine] = lineStartY[currentLine];
    lineEndX[firstLine] = lineEndX[currentLine];
    lineEndY[firstLine] = lineEndY[currentLine];

    if (lineStartX[firstLine] + offsetEndX < windowWidth) 
      lineStartX[firstLine] += offsetStartX;
    else 
      offsetStartX = -(2 + (int)( 3 * random(1) ));
    if (lineStartX[firstLine] + offsetStartX >= 0)
      lineStartX[firstLine] += offsetStartX;
    else
      offsetStartX = 2 + (int)( 3 * random(1) );
    if (lineStartY[firstLine] + offsetStartY < windowHeight)
      lineStartY[firstLine] += offsetStartY;
    else
      offsetStartY = -(2 + (int)( 3 * random(1) ));
    if (lineStartY[firstLine] + offsetStartY >= 0)
      lineStartY[firstLine] += offsetStartY;
    else
      offsetStartY = 2 + (int)( 3 * random(1) );
    if (lineEndX[firstLine] + offsetEndX < windowWidth)
      lineEndX[firstLine] += offsetEndX;
    else
      offsetEndX = -(2 + (int)( 3 * random(1) ));
    if (lineEndX[firstLine] + offsetEndX >= 0)
      lineEndX[firstLine] += offsetEndX;
    else
      offsetEndX = 2 + (int)( 3 * random(1) );
    if (lineEndY[firstLine] + offsetEndY < windowHeight)
      lineEndY[firstLine] += offsetEndY;
    else
      offsetEndY = -(2 + (int)( 3 * random(1) ));
    if (lineEndY[firstLine] + offsetEndY >= 0)
      lineEndY[firstLine] += offsetEndY;
    else
      offsetEndY = 2 + (int)( 3 * random(1) );
  }

/*
 * Function:     setcolor
 * Purpose:      Responsible for managing the color of the next line to be drawn.
 * Description:  Each basic color is identified by a unique integer in the range 0-n. A simple switch control
 *               structure is used to assign the current color to the global lineColor variable and to 
 *               then to set the color index to the identifier of the next color in sequence.
 */
  color setcolor() {
    switch(colorIdx) {
      case 0: lineColor = redColor;
              colorIdx = 1;
              break;
      case 1: lineColor = greenColor;
              colorIdx = 2;
              break;
      case 2: lineColor = blueColor;
              colorIdx = 3;
              break;
      case 3: lineColor = yellowColor;
              colorIdx = 0;
              break;
      }
    return lineColor;
  }

