
//Initial primary color: black
int brushHue = 0;
int brushSaturation = 0;
int brushBrightness = 0;

color secondaryColor = color(255,255,255); //White
color tempColor; //Is used for exchange variables.
color brushColor;
int brushAlpha = 100;

boolean isChoosingHue = false;
boolean isChoosingSb = false;
boolean isPickingColor = false; boolean isInFirstHalfOfPickingColor = false;
boolean isSwappingColors = false;
boolean isChoosingAlpha = false;
boolean isChoosingSize = false;
boolean isChoosingStabilizer = false;

int brushSize = 1; //Acutual size will be (brushSize/2)>=1.
int stabilizerDistancePower = 5; //Default:5, Range:0-50
int stabilizerTimePower = 10; //Default:10, Range:0-250

int curveBeforeStartX = 0;
int curveBeforeStartY = 0;
int curveStartX = 0;
int curveStartY = 0;
boolean isDrawing = false;
int curvePointsDistance = 0;
int previousCurvePointX = 0;
int previousCurvePointY = 0;
int stabilizerTimer = 0;

color savedPixels[][] = new color[10][250000];
byte undoRemaining = 0;

void setup()
{
  size(500,500);
  frameRate(60);
  smooth();
  colorMode(HSB, 100,100,100, 100);
  background(0,0,100);
  
  cursor(ARROW);
  
  initializeTools();
}

void draw()
{
  if(isDrawing)
  {
    doDraw();
  }
  else if(isPickingColor)
  {
      doPickColor();
  }
  else if(mousePressed)
  {
    if(isChoosingHue)
    {
      doChooseHue();
    }
    else if(isChoosingSb)
    {
      doChooseSb();
    }
    else if(isChoosingAlpha)
    {
      doChooseAlpha();
    }
    else if(isChoosingSize)
    {
      doChooseSize();
    }
    else if(isChoosingStabilizer)
    {
      doChooseStabilizer();
    }
  }
  else
  {
    curveBeforeStartX = mouseX;
    curveBeforeStartY = mouseY;
  }
}

void mousePressed()
{
  if(!isDrawing && !isChoosingHue && !isChoosingSb && !isPickingColor && !isSwappingColors)
  {
    if(mouseY >= 120)
    {
      startDraw();
    }
    else //Tools
    {
      if(mouseY>=10 && mouseY<110 && mouseX>=10 && mouseX<25)
      {
        startChooseHue();
      }
      else if(mouseY>=10 && mouseY<110 && mouseX>=35 && mouseX<135)
      {
        startChooseSb();
      }
      else if(mouseY>=10 && mouseY<55 && mouseX>=145 && mouseX<190)
      {
        startPickColor();
      }
      else if(mouseY>=65 && mouseY<110 && mouseX>=145 && mouseX<190)
      {
        startSwapColors();
      }
      else if(mouseY>=10 && mouseY<25 && mouseX>=200 && mouseX<300)
      {
        startChooseAlpha();
      }
      else if(mouseY>=35 && mouseY<50 && mouseX>=200 && mouseX<300)
      {
        startChooseSize();
      }
      else if(mouseY>=60 && mouseY<110 && mouseX>=200 && mouseX<300)
      {
        startChooseStabilizer();
      }
    }
  }
}

void mouseReleased()
{
  if(isDrawing)
  {
    finishDraw();
  }
  else
  {
    if(isChoosingHue)
    {
      finishChooseHue();
    }
    else if(isChoosingSb)
    {
      finishChooseSb();
    }
    else if(isPickingColor)
    {
      finishPickColor();
    }
    else if(isSwappingColors)
    {
      finishSwapColors();
    }
    else if(isChoosingAlpha)
    {
      finishChooseAlpha();
    }
    else if(isChoosingSize)
    {
      finishChooseSize();
    }
    else if(isChoosingStabilizer)
    {
      finishChooseStabilizer();
    }
  }
}

void keyPressed()
{
  if(key=='z' || key=='Z')
  {
    if(undoRemaining > 0)
    {
      loadPixels();
      
      for(int i=0; i<width*height; i++)
      {
        pixels[i] = savedPixels[0][i];
      }
      
      for(int i=1; i <= 9; i++)
      {
        for(int j=0; j<width*height; j++)
        {
          savedPixels[i-1][j] = savedPixels[i][j];
        }
      }
      
      updatePixels();
      
      undoRemaining--;
    }
    
    initializeTools();
  }
  else if(key=='r' || key=='R')
  {
    loadPixels();
    for(int i=8; i >= 0; i--)
    {
      for(int j=0; j<width*height; j++)
      {
        savedPixels[i+1][j] = savedPixels[i][j];
      }
    }
    for(int i=0; i < width*height; i++)
    {
      savedPixels[0][i] = pixels[i];
    }
    if(undoRemaining<10)
    {
      undoRemaining++;
    }
  
    background(brushHue,brushSaturation,brushBrightness);
    initializeTools();
  }
}

void startDraw()
{
  isDrawing = true;

  loadPixels();
  
  for(int i=8; i >= 0; i--)
  {
    for(int j=0; j<width*height; j++)
    {
      savedPixels[i+1][j] = savedPixels[i][j];
    }
  }
  for(int i=0; i < width*height; i++)
  {
    savedPixels[0][i] = pixels[i];
  }
  if(undoRemaining<10)
  {
    undoRemaining++;
  }

  initializeBrush();

  strokeCap(ROUND);
  beginShape();
  curveVertex(curveBeforeStartX+1, curveBeforeStartY+1); 
  //curveVertex(mouseX, mouseY);
  curveVertex(curveBeforeStartX, curveBeforeStartY);
  //curveVertex(mouseX, mouseY);

  previousCurvePointX = mouseX;
  previousCurvePointY = mouseY;

  curveStartX = mouseX;
  curveStartY = mouseY;
}

void doDraw()
{
  strokeCap(SQUARE);
  line(pmouseX, pmouseY, mouseX, mouseY) ;
  curvePointsDistance = int( sqrt( sq(previousCurvePointX-mouseX) + sq(previousCurvePointY-mouseY) ) );
  stabilizerTimer++;

  if (curvePointsDistance>=stabilizerDistancePower && stabilizerTimer>=(stabilizerTimePower*frameRate)/1000)
  {
    strokeCap(ROUND);
    curveVertex(mouseX, mouseY);
    previousCurvePointX = mouseX;
    previousCurvePointY = mouseY;

    stabilizerTimer = 0;
  }
}

void finishDraw()
{
  for (int i=0; i < width*height; i++)
  {
    pixels[i] = pixels[i];
  }
  updatePixels();

  strokeCap(ROUND);
  curveVertex(mouseX, mouseY);
  curveVertex( mouseX + (mouseX - previousCurvePointX), mouseY + (mouseY - previousCurvePointY) );
  endShape();

  fill(brushColor, 100);
  noStroke();

  initializeTools();

  isDrawing = false;
}

void initializeBrush()
{
  smooth();
  strokeCap(SQUARE);
  strokeJoin(ROUND);
  //strokeWeight(brushSize);
  strokeWeight(map(brushSize,1,100,1,50));
  
  if(mouseButton == RIGHT)
  {
    brushColor = secondaryColor;
  }
  else
  {
    brushColor = color(brushHue,brushSaturation,brushBrightness);
  }
  
  stroke(brushColor, brushAlpha);
  
  noFill();
}

void initializeTools()
{
  noStroke();
  //Tools base
  fill(60,14,39);
  rect(0,0, 600,120);
  
  //Base border
  stroke(0,0,0);
  strokeWeight(1);
  line(0,119, 599,119);
  
  noStroke();
  //Frame
  fill(0,0,100);
  rect(10-1,10-1, 15+2,100+2); //Hue
  rect(35-1,10-1, 100+2,100+2); //Sb
  rect(145-1,10-1, 45+2,45+2); //Pick color
  rect(145-1,65-1, 45+2,45+2); //Swap colors
  rect(200-1,10-1, 100+2,15+2); //Alpha
  rect(200-1,35-1, 100+2,15+2); //Size
  rect(200-1,60-1, 100+2,50+2); //Stabilizer
  rect(310-1,10-1, 100+2,100+2); //Preview
  
  makeHuePalette();
  makeSbPalette();
  makePickPalette();
  makeSwapPalette();
  makeAlphaPalette();
  makeSizePalette();
  makePreviewPalette();
  makeStabilizerPalette();
  makeUndoPalette();
}

void makeHuePalette()
{
  pushStyle();
  
  strokeWeight(1);
  strokeCap(SQUARE);
  noSmooth();
  
  for(int iY = 0; iY < 100; iY++) //Does not actually display H=100 color.
  {
    stroke(iY,100,100);
    line(10,iY+10, 24,iY+10);
  }
  
  //Pointer
  stroke(0,0,100, 50);
  line( 10, constrain(brushHue,0,99)+10-1,  25, constrain(brushHue,0,99)+10-1 );
  line( 10, constrain(brushHue,0,99)+10+1,  25, constrain(brushHue,0,99)+10+1 );
  stroke(0,0,0, 100);
  line( 10, constrain(brushHue,0,99)+10,  24, constrain(brushHue,0,99)+10 );

  popStyle();
}

void makeSbPalette()
{
  pushStyle();
  
  noSmooth();
  
  color sbPalettePixelColor;
  for(int iY = 0; iY < 100; iY++) //Does not actually display S=0 and B=0 colors.
  {
    for(int iX = 0; iX < 100; iX++)
    {
      sbPalettePixelColor = color(brushHue,100-iX,100-iY);
      set(iX+35,iY+10, sbPalettePixelColor);
    }
  }
  
  //Pointer
  stroke(0,0,100, 50);
  line( constrain(100-brushSaturation,0,99)+35-1, 10,  constrain(100-brushSaturation,0,99)+35-1, 110);
  line( constrain(100-brushSaturation,0,99)+35+1, 10,  constrain(100-brushSaturation,0,99)+35+1, 110);
  line( 35, constrain(100-brushBrightness,0,99)+10-1, 135, constrain(100-brushBrightness,0,99)+10-1);
  line( 35, constrain(100-brushBrightness,0,99)+10+1, 135, constrain(100-brushBrightness,0,99)+10+1);
  stroke(0,0,0, 100);
  line( constrain(100-brushSaturation,0,99)+35, 10,  constrain(100-brushSaturation,0,99)+35, 109);
  line( 35, constrain(100-brushBrightness,0,99)+10, 134, constrain(100-brushBrightness,0,99)+10);
  
  popStyle();
}

void makePickPalette()
{
  pushStyle();
  
  noSmooth();
  
  if(isPickingColor)
  {
    if(isInFirstHalfOfPickingColor)
    {
      fill(60,14,70);
      rect(145,10, 45,45);
      
      //Cross
      pushStyle();
      strokeCap(SQUARE);
      strokeWeight(5);
      stroke(0,0,0);
      line(145+5,32.5, 190-5,32.5);
      line(167.5,10+5, 167.5,55-5);
      popStyle();
    }
    else
    {
      fill(60,14,80);
      rect(145,10, 45,45);
      
      if(mouseY >= 120)
      {
        //Cross
        pushStyle();
        strokeCap(SQUARE);
        strokeWeight(7);
        stroke(0,0,0);
        line(145+5-1,32.5, 190-5+1,32.5);
        line(167.5,10+5-1, 167.5,55-5+1);
        strokeWeight(5);
        stroke(brushHue,brushSaturation,brushBrightness);
        line(145+5,32.5, 190-5,32.5);
        line(167.5,10+5, 167.5,55-5);
        popStyle();
      }
    }
  }
  else
  {
    fill(60,14,80);
    rect(145,10, 45,45);
    
    //Cross
    pushStyle();
    strokeCap(SQUARE);
    strokeWeight(5);
    stroke(0,0,0);
    line(145+5,32.5, 190-5,32.5);
    line(167.5,10+5, 167.5,55-5);
    popStyle();
  }
  
  popStyle();
}

void makeSwapPalette()
{
  pushStyle();
  
  noSmooth();
  
  //Inner-frame
  if(isSwappingColors)
  {
    fill(60,14,70);
    rect(145,65, 45,45);
  }
  else
  {
    fill(60,14,80);
    rect(145,65, 45,45);
  }
  
  //Color rect
  fill(0,0,0);
  rect(145+5+10-1,65+5+10-1, 25+2,25+2);
  fill(secondaryColor);
  rect(145+5+10,65+5+10, 25,25);
  fill(0,0,0);
  rect(145+5-1,65+5-1, 25+2,25+2);
  fill(brushHue,brushSaturation,brushBrightness);
  rect(145+5,65+5, 25,25);
  
  
  popStyle(); 
}

void makeAlphaPalette()
{
  pushStyle();
  
//  //Old inner-frame
//  fill(60,14,80);
//  rect(200,10, 100,15);
  
  strokeWeight(1);
  strokeCap(SQUARE);
  noSmooth();
  
  //Inner-frame
  for(int i=200; i<=299; i++)
  {
    stroke( lerpColor( color(60,14,80), color(60,14,60), (i-199)/100.0 ) );
    line(i,10, i,24);
  }
  
  stroke(0,0,100, 50);
  line(constrain(brushAlpha,1,100)-1+200-1,10, constrain(brushAlpha,1,100)-1+200-1,24+1);
  line(constrain(brushAlpha,1,100)-1+200+1,10, constrain(brushAlpha,1,100)-1+200+1,24+1);
  stroke(0,0,0, 100);
  line(constrain(brushAlpha,1,100)-1+200,10, constrain(brushAlpha,1,100)-1+200,24);
  
  popStyle();
}

void makeSizePalette()
{
  pushStyle();
  
  smooth();
  noStroke();
  
  //Inner-frame
  fill(60,14,80);
  rect(200,35, 100,15);
  
  fill(60,14,60);
  triangle(200,50, 300,35, 300,50);
  
  strokeWeight(1);
  strokeCap(SQUARE);
  noSmooth();
  
  //Pointer
  stroke(0,0,100, 50);
  line(constrain(brushSize,1,100)-1+200-1,35, constrain(brushSize,1,100)-1+200-1,50);
  line(constrain(brushSize,1,100)-1+200+1,35, constrain(brushSize,1,100)-1+200+1,50);
  stroke(0,0,0, 100);
  line(constrain(brushSize,1,100)-1+200,35, constrain(brushSize,1,100)-1+200,49);
  
  popStyle();
}

void makeStabilizerPalette()
{
  pushStyle();
  
  noStroke();
  
  //Inner-frame
  fill(60,14,80);
  rect(200,60, 100,50);
  
  strokeWeight(1);
  strokeCap(SQUARE);
  noSmooth();
  
  //Pointer
  stroke(0,0,100, 50);
  line(constrain(stabilizerDistancePower*2,0,99)+200-1,60, constrain(stabilizerDistancePower*2,0,99)+200-1,109+1);
  line(constrain(stabilizerDistancePower*2,0,99)+200+1,60, constrain(stabilizerDistancePower*2,0,99)+200+1,109+1);
  line(200,constrain(49-(stabilizerTimePower/5),0,49)+60-1, 299+1,constrain(49-(stabilizerTimePower/5),0,49)+60-1);
  line(200,constrain(49-(stabilizerTimePower/5),0,49)+60+1, 299+1,constrain(49-(stabilizerTimePower/5),0,49)+60+1);
  stroke(0,0,0, 100);
  line(constrain(stabilizerDistancePower*2,0,99)+200,60, constrain(stabilizerDistancePower*2,0,99)+200,109);
  line(200,constrain(49-(stabilizerTimePower/5),0,49)+60, 299,constrain(49-(stabilizerTimePower/5),0,49)+60);
  //line();
  
  popStyle();
}

void makePreviewPalette()
{
  pushStyle();
  
  noStroke();
  
  //Inner-frame
  fill(60,14,80);
  rect(310,10, 100,100);
  
  smooth();
  fill(brushHue,brushSaturation,brushBrightness, brushAlpha);
  ellipse(360.5,60.5, map(brushSize,1,100,1,50),map(brushSize,1,100,1,50));
  
  popStyle();
}

void makeUndoPalette()
{
  pushStyle();
  
  noStroke();
  
  while(undoRemaining > 0)
  {
    fill(0,0,100,65);
    rect(480,100, 10,10);
    if(undoRemaining<=1){break;};
    
    fill(0,0,100,60);
    rect(480,90, 10,10);
    if(undoRemaining<=2){break;};
    
    fill(0,0,100,55);
    rect(480,80, 10,10);
    if(undoRemaining<=3){break;};
    
    fill(0,0,100,50);
    rect(480,70, 10,10);
    if(undoRemaining<=4){break;};
    
    fill(0,0,100,45);
    rect(480,60, 10,10);
    if(undoRemaining<=5){break;};
    
    fill(0,0,100,40);
    rect(480,50, 10,10);
    if(undoRemaining<=6){break;};
    
    fill(0,0,100,35);
    rect(480,40, 10,10);
    if(undoRemaining<=7){break;};
    
    fill(0,0,100,30);
    rect(480,30, 10,10);
    if(undoRemaining<=8){break;};
    
    fill(0,0,100,25);
    rect(480,20, 10,10);
    if(undoRemaining<=9){break;};
    
    fill(0,0,100,20);
    rect(480,10, 10,10);
    
    break;
  }
  
  popStyle();
}

//Choose alpha
void startChooseAlpha()
{
  isChoosingAlpha = true;
}

void doChooseAlpha()
{
  brushAlpha = constrain(mouseX-200, 1,100); //Min is 1, to avoid choosing Alpha=0: completely invisible.
  
  initializeTools();
}

void finishChooseAlpha()
{
  initializeTools();
  
  isChoosingAlpha = false;
  
  //println(brushAlpha);
}

//Choose size
void startChooseSize()
{
  isChoosingSize = true;
}

void doChooseSize()
{
  brushSize = constrain(mouseX-200, 1,100); //Min is 1, to avoid choosing Size=0: better to be set with alpha.
  
  initializeTools();
}

void finishChooseSize()
{
  initializeTools();
  
  isChoosingSize = false;
  
  //println(brushSize);
}

//Choose stabilizer
void startChooseStabilizer()
{
  isChoosingStabilizer = true;
}

void doChooseStabilizer()
{
  stabilizerDistancePower = constrain((mouseX-200)/2, 0,50);
  stabilizerTimePower = constrain( (50-(mouseY-60))*5, 0,250);
  
  initializeTools();
}

void finishChooseStabilizer()
{
  initializeTools();
  
  isChoosingStabilizer = false;
  
  //println(stabilizerDistancePower);
  //println(stabilizerTimePower);
}

void startChooseHue()
{
  isChoosingHue = true;
}

void doChooseHue()
{
  brushHue = constrain(mouseY-10, 0,100);
  
  //makeSbPalette();
  //makeHuePalette();
  initializeTools();
}

void finishChooseHue()
{
  //makeSbPalette();
  initializeTools();
  
  isChoosingHue = false;
  
  //println("HSB",brushHue,brushSaturation,brushBrightness);
}

void startPickColor()
{
  if(isPickingColor == false)
  {
    isPickingColor = true;
    isInFirstHalfOfPickingColor = true;
    
    tempColor = color(brushHue,brushSaturation,brushBrightness);
  }
}

void doPickColor()
{
  if(isInFirstHalfOfPickingColor)
  {
  }
  else
  {
    if(mouseY >= 120)
    {
      brushHue = int(round(hue(get(mouseX,mouseY))));
      brushSaturation = int(round(saturation(get(mouseX,mouseY))));
      brushBrightness = int(round(brightness(get(mouseX,mouseY))));
    }
    else
    {
      brushHue = int(round(hue(tempColor)));
      brushSaturation = int(round(saturation(tempColor)));
      brushBrightness = int(round(brightness(tempColor)));
    }
  }
  
  initializeTools();
}

void finishPickColor()
{
  if(isInFirstHalfOfPickingColor)
  {
    if(mouseY>=10 && mouseY<55 && mouseX>=145 && mouseX<190)
    {
      isInFirstHalfOfPickingColor = false;
      cursor(CROSS);
    }
    else
    {
      isPickingColor = false;
    }
  }
  else
  {
    cursor(ARROW);
    isPickingColor = false;
  }
  
  initializeTools();
}

void startChooseSb()
{
  isChoosingSb = true;
}

void doChooseSb()
{
  brushSaturation = constrain(100-(mouseX-35), 0,100);
  brushBrightness = constrain(100-(mouseY-10), 0,100);
  
  //makeSbPalette();
  initializeTools();
}

void finishChooseSb()
{
  //makeSbPalette();
  initializeTools();
  
  isChoosingSb = false; 
  
  //println("HSB",brushHue,brushSaturation,brushBrightness);
}

void startSwapColors()
{
  isSwappingColors = true;
  
  makeSwapPalette();
}

void finishSwapColors()
{
  if(mouseY>=65 && mouseY<110 && mouseX>=145 && mouseX<190)
  {
    tempColor = color(brushHue,brushSaturation,brushBrightness);
    
    brushHue = int(round(hue(secondaryColor)));
    brushSaturation = int(round(saturation(secondaryColor)));
    brushBrightness = int(round(brightness(secondaryColor)));
    
    secondaryColor = tempColor;
  }
  
  isSwappingColors = false;
  
  //makeSwapPalette(); //Used for turning inner-frame color back to normal.
  initializeTools();
}



