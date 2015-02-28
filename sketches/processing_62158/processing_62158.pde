

class CColorWheel extends PGraphicsJava2D
{
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
      rect(x,y,w,h);
    }
    
    void vExpand(float expandBy)
    {
      y -= expandBy * 0.5;
      h += expandBy;
    }
  }
  
  void setup()
  {
    beginDraw(); // We're not drawing, but we do need to be able to set up the drawing environment

    noStroke();
    smooth();
    colorMode(HSB);

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
      greys[nBlock] = new Rect(blockStart + (greyWidth * nBlock), height - (blockSize * 1.75), greyWidth - 4, blockSize - 4, color(round(nBlock * 255 / (nBlocks-1))));
    }
  
    greys[0].vExpand(blockSize * 0.5);
    greys[nBlocks-1].vExpand(blockSize * 0.5);

    endDraw();
  }
  
  void draw()
  {
    beginDraw();

    background(128);
  
    for (int nSegment = 0; nSegment < nSegments; ++nSegment)
    {
      Segment segment = segments[nSegment];
  
      fill(segment.segmentColor);
      
      arc(xWheel, yWheel, wheelDiameter, wheelDiameter, segment.arcStart, segment.arcStop);  
    }
  
    fill(128);
    ellipse(xWheel, yWheel, wheelInnerDiameter, wheelInnerDiameter);
  
    if (selectedSegment != null)
    {
      Segment segComplimentary = segments[(selectedSegment.index + (nSegments/2)) % nSegments];
  
      pushMatrix();
      translate(xWheel, yWheel);
      rotate(selectedSegment.middle() - (0.25*PI));
      drawHueTriangle(hue(selectedSegment.segmentColor), -sliceRadius, -sliceRadius, 2*sliceRadius, segComplimentary.segmentColor); 
      popMatrix();
  
      if (selectedColor == selectedSegment.segmentColor)
      {
        noFill();
        stroke(segComplimentary.segmentColor);
        strokeWeight(wheelThickness/20);
        
        arc(xWheel, yWheel, wheelDiameter, wheelDiameter, selectedSegment.arcStart, selectedSegment.arcStop);
        arc(xWheel, yWheel, wheelInnerDiameter, wheelInnerDiameter, selectedSegment.arcStart, selectedSegment.arcStop);
        
        line(xWheel + (0.5 * wheelDiameter*cos(selectedSegment.arcStart)),
             yWheel + (0.5 * wheelDiameter*sin(selectedSegment.arcStart)),
             xWheel + (0.5 * wheelInnerDiameter*cos(selectedSegment.arcStart)),
             yWheel + (0.5 * wheelInnerDiameter*sin(selectedSegment.arcStart)));
             
        line(xWheel + (0.5 * wheelDiameter*cos(selectedSegment.arcStop)),
             yWheel + (0.5 * wheelDiameter*sin(selectedSegment.arcStop)),
             xWheel + (0.5 * wheelInnerDiameter*cos(selectedSegment.arcStop)),
             yWheel + (0.5 * wheelInnerDiameter*sin(selectedSegment.arcStop)));
    
        noStroke();
      }
    }
  
    noSmooth();
    for (int nBlock = 0; nBlock < nBlocks; ++nBlock)
    {
      fill(greys[nBlock].m_color);
      greys[nBlock].draw();
      
      if (bColorSelected == true && selectedColor == greys[nBlock].m_color)
      {
        noFill();
        if (selectedSegment != null)
          stroke(segments[(selectedSegment.index + (nSegments/2)) % nSegments].segmentColor);
        else
          stroke(255,255,255);
        strokeWeight(5);
        greys[nBlock].draw();
        noStroke();
      }
    }
    smooth();
    
    endDraw();
  }
  
  void mousePressed(float mouseX, float mouseY, int mouseButton)
  {
    if (mouseButton == LEFT)
    {
      float distance = dist(xWheel,yWheel,mouseX,mouseY);
      
      if (distance < wheelInnerDiameter/2)
      {
        if (selectedSegment != null)
        {
          PVector v = new PVector(mouseX, mouseY);
          rotateCoord(v, selectedSegment.middle() - (0.25*PI));
          float xBase = xWheel - sliceRadius;
          float yBase = yWheel - sliceRadius;
          xBlock = (int)((v.x - xBase) / blockSize);
          yBlock = (int)((v.y - yBase) / blockSize);
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
            selectedColor = segment.segmentColor;
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
            selectedColor = greys[n].m_color;
            bColorSelected = true;
          }
        }
      }
    }
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
        
        fill(nHue, nSaturation, nBrightness);
        rect(xBlock, yBlock, blockSize, blockSize);
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
        
        fill(nHue, nSaturation, nBrightness);
        rect(xBlockPos, yBlockPos, blockSize, blockSize);
        
        if (xIndex + nBlocks - nBlocksInThisRow == xBlock && yIndex == yBlock)
        {
            selectedColor = color(nHue, nSaturation, nBrightness);
        }
        
        if (color(nHue, nSaturation, nBrightness) == selectedColor)
        {
          stroke(complementaryColor);
          strokeWeight(5);
          noFill();
  
          rect(xBlockPos, yBlockPos, blockSize, blockSize);
          
          noStroke();
          
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


