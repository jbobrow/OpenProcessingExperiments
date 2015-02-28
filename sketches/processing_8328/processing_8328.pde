
class PixelPalette
{
  int x, y, pixX, pixY, magnify, tw, th;
  boolean[] pixelStatus;
  int titleHeight = 25;
  boolean dragging = false;
  
  // Colors
  color bigPixC = color (255, 0, 162, 200);
  color smallPixC = color (255);
  color gridC = color (225);
  color titleBarC = color (255, 236, 18);
  color frameC = color (255);
  
  PixelPalette (int startX, int startY, int pX, int pY, int mag)
  {
    x = startX;
    y = startY;
    pixX = pX;
    pixY = pY;
    pixelStatus = new boolean[pixX * pixY];
    magnify = mag;
    tw = pixX * magnify;
    th = pixY * magnify;
    
    // Fill the status arrays with falses
    for (int i=0; i < pixelStatus.length; i++)
    {
      pixelStatus[i] = false;
    }
    pixelStatus[0] = true; // Start with only the top left pixel filled
  }
  
  void display()
  {
    noStroke();
    
    updateDrag();
    
    // Update the pixels on the full background
    for (int dx = 0; dx <= width / pixX; dx++)
    {
      for (int dy = 0; dy <= height / pixY; dy++)
      {
        // Run through each pixel in pixelStatus
        for (int i=0; i < pixelStatus.length; i++)
        {
          if (pixelStatus[i])
          {
            set(dx * pixX + floor(i % pixX), dy * pixY + floor(i / pixX), smallPixC);
          }
        }
      }
    }
    
    // Draw the frame
    fill(frameC);
    rect(x, y, tw, th);
    
    // Draw the Title Bar
    fill(titleBarC);
    rect(x, y - titleHeight, tw, titleHeight);
    
    // Draw the light grid
    for (int dx=0; dx < tw; dx++)
    {
      for (int dy=0; dy < th; dy++)
      {
        if (dx != 0 && dx != x + tw && dy != 0 && dy != y + th)
        {
          if (dx % 10 == 0 || dy % 10 ==0)
          {
            set((int)x + dx, (int)y + dy, gridC);
          }
        }
      }
    }
    
    // Update the pixels on the palette
    for (int i=0; i < pixelStatus.length; i++)
    {
      if (pixelStatus[i])
       {
         noStroke();
         fill(bigPixC);
         rect(x + magnify * floor(i % pixX), floor(i / pixX) * magnify + y, magnify, magnify);
       }
    }
  }
  
  void processClick()
  {
    // Check to see if the click was within the palette pixel area
    if (mouseX > x && mouseX < x + tw && mouseY > y && mouseY < y + th)
    {
      // Get our clicked coordinate location
      int currSectX = (mouseX - (int)x) / 10;
      int currSectY = (mouseY - (int)y) / 10;
      int totalCurrSect = (currSectY * pixX) + currSectX;
      
      // Swap the pixel status for that location
      pixelStatus[totalCurrSect] = !pixelStatus[totalCurrSect];
    }
  }
  
  void evalDrag()
  {
    if (mouseX > x && mouseX < x + tw && mouseY > y - titleHeight && mouseY < y)
    {
      dragging = true;
    }
  }
  
  void updateDrag()
  {
    // Check to see if the mouse is within the title bar area
    if (dragging)
    {
      x += mouseX - pmouseX;
      y += mouseY - pmouseY;
    }
  }
}

