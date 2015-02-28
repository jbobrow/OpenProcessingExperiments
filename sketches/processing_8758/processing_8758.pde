
/**
 * spxlUnderPressure
 * 2010-04-08 by subpixel
 * http://subpixels.com
 *
 * Basice pressure-sensitive stylus input
 * using JTablet from Cellosoft
 * http://jtablet.cellosoft.com
 */

import cello.jtablet.*;
import cello.jtablet.event.*;
import cello.jtablet.installer.JTabletExtension;

final String desiredMinimumJTabletVersion = "1.2.0";

final int BLACK = 0xff000000;
final int WHITE = 0xffffffff;

int strokeColor = BLACK;
int fillColor = WHITE;

boolean erasing = false;

void setup()
{
  size(600, 400, JAVA2D);
  ellipseMode(RADIUS);
  smooth();
  
  if (JTabletExtension.checkCompatibility(this, desiredMinimumJTabletVersion))
  {
    println("JTablet Compatible! Version: " + JTabletExtension.getInstalledVersion());
    TabletManager.getDefaultManager().addTabletListener(this, new PTablet());
  }

  background(255);
}

void draw()
{
}

public class PTablet extends TabletAdapter
{
  public void cursorEntered(TabletEvent event)
  {
    erasing = (event.getDevice().getType() == TabletDevice.Type.ERASER);
  }
  
  public void cursorPressed(TabletEvent event)
  {
    int rawButtonMask = event.getRawTabletButtonMask();

    if ((rawButtonMask & 2) != 0) // First button (not tip)
    {
      background(fillColor = WHITE);
      stroke(strokeColor = BLACK);
    }
    else
    if ((rawButtonMask & 4) != 0) // Second button
    {
      background(fillColor = BLACK);
      stroke(strokeColor = WHITE);
    }
  }

  public void cursorDragged(TabletEvent event)
  {
    // Only draw if stylus tip and no other button pressed
    if (event.getRawTabletButtonMask() == 1)
    {
      float x = event.getFloatX();
      float y = event.getFloatY();
      float pressure = event.getPressure();

      if (erasing)
        noStroke();
      else
        stroke(strokeColor);

      fill(fillColor);
      
      float radius = pressure * 20;
      ellipse(x, y, radius, radius);
    }
  }
}


