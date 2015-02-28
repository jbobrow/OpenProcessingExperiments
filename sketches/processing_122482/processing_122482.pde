
PFont font;
ColorPanel colorPanel;

void setup()
{
  size(900,600);
  colorMode(HSB);
  PGraphics graphics = createGraphics(width, height);
  colorPanel = new ColorPanel();
  colorPanel.setup(graphics);

  font = createFont("Courier New", 13);
}

void draw()
{
  colorPanel.draw();
  image(colorPanel.m_Graphics, 0, 0);
  
  noStroke();
  fill(colorPanel.getHue(), colorPanel.getSaturation(), colorPanel.getBrightness());
  rect(0,0,150,400);
  
  int h  = round(colorPanel.getHue());
  int s  = round(colorPanel.getSaturation());
  int br = round(colorPanel.getBrightness());
  int r  = round(colorPanel.getRed());
  int g  = round(colorPanel.getGreen());
  int bl = round(colorPanel.getBlue());
  
  // Yes, I'm breaking the guidelines about how to construct a string efficiently :-)
  String sInfo = "       Hue: " + pad(h)  + " (0x" + hex(h,2)  + ")\n"
               + "Saturation: " + pad(s)  + " (0x" + hex(s,2)  + ")\n"
               + "Brightness: " + pad(br) + " (0x" + hex(br,2) + ")\n\n"
               + "       Red: " + pad(r)  + " (0x" + hex(r,2)  + ")\n"
               + "     Green: " + pad(g)  + " (0x" + hex(g,2)  + ")\n"
               + "      Blue: " + pad(bl) + " (0x" + hex(bl,2) + ")";

  fill(0);
  textFont(font);
  text(sInfo, 10, height * 0.75);

}

String pad(int n)
{
  String s = str(n);
  switch (s.length())
  {
  case 1:
    s = "  " + s;
    break;
  case 2:
    s = " " + s;
    break;
  }

  return s;
}

void mousePressed()
{
  colorPanel.mousePressed(mouseX, mouseY, mouseButton);
}

class ColorPanel
{
  PGraphics m_Graphics;
  
  // The selected color is accessed in this slightly cumbersome fashion to avoid making assumptions about the callers color-space
  float getRed() {return red(selectedColor);}
  float getGreen() {return green(selectedColor);}
  float getBlue() {return blue(selectedColor);}
  float getHue() {return hue(selectedColor);}
  float getSaturation() {return saturation(selectedColor);}
  float getBrightness() {return brightness(selectedColor);}

  void setHSB(float h, float s, float b)
  {
    setSelectedColor(color(round(h),round(s),round(b)));
    bColorSelected = true;
  }

  void setSelectedColor(color newSelectedColor)
  {
    selectedColor = newSelectedColor;
//    println("hue " + hue(newSelectedColor) + ", saturation " + saturation(newSelectedColor) + ", brightness " + brightness(newSelectedColor));
  }

  int nSegments = 12;
  int nBlocks = 6;
  int nBlockGap = 3;
  float xWheel;
  float yWheel;
  float wheelDiameter = 475;
  float wheelThickness = 125;
  float wheelInnerDiameter;
  float sliceRadius;
  float blockSize;
  int xBlock = -1;
  int yBlock = -1;
  Segment segments[];
  Segment selectedSegment;
  Rect greys[];
  
  boolean bColorSelected = false;
  color selectedColor;
  
  class Segment
  {
    float arcStart;
    float arcStop;
    color segmentColor;
    int index;
    
    boolean hitTest(float angle)
    {
      float a = (arcStart + TWO_PI) % TWO_PI;
      float b = (angle    + TWO_PI) % TWO_PI;
      float c = (arcStop  + TWO_PI) % TWO_PI;
  
      if (a < c)
      {
        if (a < b && b < c)
          return true;
        else
          return false;
      }
      else
      {
        if (b < c || a < b)
          return true;
        else
          return false;
      }
    }
    
    float middle()
    {
      float c = arcStop;
      if (arcStop < arcStart)
      {
        c += TWO_PI;
      }
      
      return (arcStart + c)/2;
    }
  };
  
  class Rect
  {
    Rect(float xx, float yy, float ww, float hh, color col)
    {
      x = xx; y = yy; w = ww; h = hh; m_color = col;
    }
  
    float x;
    float y;
    float w;
    float h;
    color m_color;
    
    boolean hitTest(float xTest, float yTest)
    {
      if (xTest > x && xTest < x + w && yTest > y && yTest < y + h)
        return true; 
      else
        return false;
    }
    
    void draw()
    {
      m_Graphics.rect(x,y,w,h);
    }
    
    void vExpand(float expandBy)
    {
      y -= expandBy * 0.5;
      h += expandBy;
    }
  }
  
  void setup(PGraphics graphics)
  {
    m_Graphics = graphics;
    
    m_Graphics.beginDraw(); // We're not drawing, but we do need to be able to set up the drawing environment

    m_Graphics.noStroke();
    m_Graphics.smooth();
    m_Graphics.colorMode(HSB);

    xWheel = 0.5 * width;
    yWheel = 0.45 * height;
    wheelInnerDiameter = wheelDiameter - wheelThickness;
    sliceRadius = wheelInnerDiameter/3;
    blockSize = sliceRadius * 2 / nBlocks;
  
    segments = new Segment[nSegments];
  
    for (int nSegment = 0; nSegment < nSegments; ++nSegment)
    {
      Segment segment = new Segment();
      segment.arcStart = (TWO_PI * (nSegment - 0.5)) / nSegments;
      segment.arcStop = (TWO_PI * (nSegment + 0.5)) / nSegments;
      segment.arcStart -= HALF_PI - 0.01;
      segment.arcStop -= HALF_PI + 0.01;
      
      segment.segmentColor = color(round(nSegment * 255 / nSegments), 255, 255);
      segment.index = nSegment;
  
      segments[nSegment] = segment;
    }
    
    greys = new Rect[nBlocks];
    float greyWidth = blockSize * 1.5;
    float blockStart = (width - (greyWidth * nBlocks)) * 0.5;
    
    for (int nBlock = 0; nBlock < nBlocks; ++nBlock)
    {
      greys[nBlock] = new Rect(blockStart + (greyWidth * nBlock), height * 0.9, greyWidth - 4, blockSize - 4, color(round(nBlock * 255 / (nBlocks-1))));
    }
  
    greys[0].vExpand(blockSize * 0.5);
    greys[nBlocks-1].vExpand(blockSize * 0.5);

    m_Graphics.endDraw();
  }
  
  void draw()
  {
    m_Graphics.beginDraw();

    m_Graphics.background(128);
  
    for (int nSegment = 0; nSegment < nSegments; ++nSegment)
    {
      Segment segment = segments[nSegment];
  
      m_Graphics.fill(segment.segmentColor);
      
      m_Graphics.arc(xWheel, yWheel, wheelDiameter, wheelDiameter, segment.arcStart, segment.arcStop);
      
      if (segment.segmentColor == selectedColor)
      {
        selectedSegment = segment;
      }
    }
  
    m_Graphics.fill(128);
    m_Graphics.ellipse(xWheel, yWheel, wheelInnerDiameter, wheelInnerDiameter);
  
    if (selectedSegment != null)
    {
      Segment segComplimentary = segments[(selectedSegment.index + (nSegments/2)) % nSegments];
  
      m_Graphics.pushMatrix();
      m_Graphics.translate(xWheel, yWheel);
      m_Graphics.rotate(selectedSegment.middle() - (0.25*PI));
      drawHueTriangle(hue(selectedSegment.segmentColor), -sliceRadius, -sliceRadius, 2*sliceRadius, segComplimentary.segmentColor); 
      m_Graphics.popMatrix();
  
      if (selectedColor == selectedSegment.segmentColor)
      {
        m_Graphics.noFill();
        m_Graphics.stroke(segComplimentary.segmentColor);
        m_Graphics.strokeWeight(wheelThickness/20);
        
        m_Graphics.arc(xWheel, yWheel, wheelDiameter, wheelDiameter, selectedSegment.arcStart, selectedSegment.arcStop);
        m_Graphics.arc(xWheel, yWheel, wheelInnerDiameter, wheelInnerDiameter, selectedSegment.arcStart, selectedSegment.arcStop);
        
        m_Graphics.line(
             xWheel + (0.5 * wheelDiameter*cos(selectedSegment.arcStart)),
             yWheel + (0.5 * wheelDiameter*sin(selectedSegment.arcStart)),
             xWheel + (0.5 * wheelInnerDiameter*cos(selectedSegment.arcStart)),
             yWheel + (0.5 * wheelInnerDiameter*sin(selectedSegment.arcStart)));
             
        m_Graphics.line(
             xWheel + (0.5 * wheelDiameter*cos(selectedSegment.arcStop)),
             yWheel + (0.5 * wheelDiameter*sin(selectedSegment.arcStop)),
             xWheel + (0.5 * wheelInnerDiameter*cos(selectedSegment.arcStop)),
             yWheel + (0.5 * wheelInnerDiameter*sin(selectedSegment.arcStop)));
    
        m_Graphics.noStroke();
      }
    }
  
    m_Graphics.noSmooth();
    for (int nBlock = 0; nBlock < nBlocks; ++nBlock)
    {
      m_Graphics.fill(greys[nBlock].m_color);
      greys[nBlock].draw();
      
      if (bColorSelected == true && selectedColor == greys[nBlock].m_color)
      {
        m_Graphics.noFill();
        if (selectedSegment != null)
          m_Graphics.stroke(segments[(selectedSegment.index + (nSegments/2)) % nSegments].segmentColor);
        else
          m_Graphics.stroke(255,255,255);
        m_Graphics.strokeWeight(5);
        greys[nBlock].draw();
        m_Graphics.noStroke();
      }
    }
    m_Graphics.smooth();
    
    m_Graphics.endDraw();
  }
  
  boolean mousePressed(float mouseX, float mouseY, int mouseButton)
  {
    boolean returnValue = false;
    
    if (mouseButton == LEFT)
    {
      color previousColor = selectedColor;

      float distance = dist(xWheel,yWheel,mouseX,mouseY);
      
      if (distance < wheelInnerDiameter/2)
      {
        if (selectedSegment != null)
        {
          int prevXBlock = xBlock;
          int prevYBlock = yBlock;
          
          PVector v = new PVector(mouseX, mouseY);
          rotateCoord(v, selectedSegment.middle() - (0.25*PI));
          float xBase = xWheel - sliceRadius;
          float yBase = yWheel - sliceRadius;
          xBlock = (int)((v.x - xBase) / blockSize);
          yBlock = (int)((v.y - yBase) / blockSize);

          if (xBlock == prevXBlock && yBlock == prevYBlock && xBlock >= 0 && yBlock >= 0 && xBlock + yBlock > nBlocks - 2)
          {
            returnValue = true;
          }
        }
      }
      else if (distance < wheelDiameter/2)
      {
        float xDist = mouseX - xWheel;
        float yDist = mouseY - yWheel;
        float angle = atan2(yDist,xDist);
  
        for (int nSegment = 0; nSegment < nSegments; ++nSegment)
        {
          Segment segment = segments[nSegment];
  
          if (segment.hitTest(angle))
          {
            selectedSegment = segment;
            xBlock = -1;
            yBlock = -1;
            bColorSelected = true;
            setSelectedColor(segment.segmentColor);
            if (previousColor == segment.segmentColor)
            {
              returnValue = true;
            }
          }
        }
      }
      else
      {
        for (int n = 0; n < nBlocks; ++n)
        {
          if (greys[n].hitTest(mouseX, mouseY))
          {
            selectedSegment = null;
            setSelectedColor(greys[n].m_color);
            bColorSelected = true;
            if (previousColor == greys[n].m_color)
            {
              returnValue = true;
            }
          }
        }
      }
    }

    return returnValue;
  }
  
  void drawColorCubeSlice(float nHue, float x, float y, float nSize)
  {
    float blockSize = nSize / nBlocks;
    blockSize -= nBlockGap; // Leave a gap between blocks
    
    for (int xIndex = 0; xIndex < nBlocks; ++xIndex)
    {
      float nSaturation = 255 * ((float)xIndex/(nBlocks-1));
      float xBlock = (nSize*xIndex/nBlocks) + x;
      for (int yIndex = 0; yIndex < nBlocks; ++yIndex)
      {
        float nBrightness = 255 * ((float)yIndex/(nBlocks-1));
        float yBlock = (nSize*yIndex/nBlocks) + y;
        
        m_Graphics.fill(nHue, nSaturation, nBrightness);
        m_Graphics.rect(xBlock, yBlock, blockSize, blockSize);
      }
    }
  
  }
  
  void drawHueTriangle(float nHue, float x, float y, float nSize, color complementaryColor)
  {
    nHue = round(nHue);
   
    float blockSize = nSize / nBlocks;
    blockSize -= 3; // Leave a gap between blocks
    
    for (int yIndex = 0; yIndex < nBlocks; ++yIndex)
    {
      float nBrightness = 255 * ((float)yIndex/(nBlocks-1));
      nBrightness = round(nBrightness);
      float yBlockPos = (nSize*yIndex/nBlocks) + y;
      
      int nBlocksInThisRow = yIndex + 1;
      float xAdjust = (nBlocks - nBlocksInThisRow) * (nSize/nBlocks);
  
      for (int xIndex = 0; xIndex < nBlocksInThisRow; ++xIndex)
      {
        float nSaturation = 255 * ((float)xIndex/(nBlocksInThisRow-1));
        nSaturation = round(nSaturation);
        
        float xBlockPos = (nSize*xIndex/nBlocks) + x;
        xBlockPos += xAdjust;
        
        m_Graphics.fill(nHue, nSaturation, nBrightness);
        m_Graphics.rect(xBlockPos, yBlockPos, blockSize, blockSize);
        
        if (xIndex + nBlocks - nBlocksInThisRow == xBlock && yIndex == yBlock)
        {
            setHSB(nHue, nSaturation, nBrightness);
        }
        
        if (color(nHue, nSaturation, nBrightness) == selectedColor)
        {
          m_Graphics.stroke(complementaryColor);
          m_Graphics.strokeWeight(5);
          m_Graphics.noFill();
  
          m_Graphics.rect(xBlockPos, yBlockPos, blockSize, blockSize);
          
          m_Graphics.noStroke();
          
        }
      }
    }
  
  }
  
  void rotateCoord(PVector v, float adjustmentAngle)
  {
    float angle = atan2(v.y - yWheel, v.x - xWheel);
    float distance = dist(xWheel, yWheel, v.x, v.y);
    angle -= adjustmentAngle;
    v.x = xWheel + (distance * cos(angle));
    v.y = yWheel + (distance * sin(angle));
  }
};



