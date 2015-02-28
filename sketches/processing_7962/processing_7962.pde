
/**
 * spxlSuperKnob
 * 2010-02-27 by subpixel
 * http://subpixels.com
 *
 * Inspired by code by bmud posted at
 * http://processing.org/discourse/yabb2/YaBB.pl?num=1235508056/3#3
 *
 * 2010-03-2 spxl v02
 * - Problem: "it gets weird" touching near middle of the knob
 *   - Disallow knob tweaking close to the middle
 * - Problem: "flubbing" multiple buttons causes unexpected knob expansion
 *   - Check that not already adjusting before trying to adjust;
 *   - Check for LEFT mouse button explicitly
 * - Abstract Knob class renamed Widget; knob-properties moved to SuperKnob class
 * - knobPos renamed "position"
 * - SuperKnob.lock renamed "snapped"; added snap, snapTolerance;
 *   only snap angle if snap == true
 * - Add SuperKnob automation
 * - Add selected, adjusting and automate hilight colours
 * - Add keyboard control to adjust selected knob
 */

final int sketchBackgroundColor = 0xffc8c8c8; // Pale grey

final int gridCols = 4;
final int gridRows = 3;

final int gridSizeX = 100;
final int gridSizeY = 100;

final int knobFontSize = 12;

ArrayList widgets;

Widget selectedWidget;  // Current selected widget
boolean adjustingWidget = false; // Adjusting now?

long idleTime; // Timeout before doing something sneaky
long idleMin = 5000;  // Min idle delay in milliseconds
long idleMax = 10000; // Max idle delay in milliseconds

void setup()
{
  size(gridCols * gridSizeX, gridRows * gridSizeY);

  smooth();
  ellipseMode(RADIUS);
  
  textFont(createFont("", knobFontSize));
  textAlign(CENTER, CENTER);
  
  int offX = gridSizeX >> 1;
  int offY = gridSizeY >> 1;

  // Create a grid of SuperKnobs with references stored in the widgets ArrayList
  widgets = new ArrayList(gridCols * gridRows);
  for (int row = 0; row < gridRows; row++)
  {
    for (int col = 0; col < gridCols; col++)
    {
      SuperKnob knob = new SuperKnob(col * gridSizeX + offX, row * gridSizeY + offY);
      knob.maxRevs = row * gridCols + col + 1;
      knob.setAngle(knob.maxRevs * random(-TWO_PI, TWO_PI));
      widgets.add(knob);
    }
  }
  
  resetIdle();
}

void resetIdle()
{
  idleTime = millis() + (long)random(idleMin, idleMax);
}

void draw()
{
  background(sketchBackgroundColor);

  if (millis() > idleTime || (keyPressed && key == ' '))
  {
    SuperKnob randomKnob = (SuperKnob)widgets.get((int)random(widgets.size()));
    randomKnob.keyPressed('r', 0);
    resetIdle();
  }

 // Update widgets
  for (int i = 0; i < widgets.size(); i++)
    ((Widget)widgets.get(i)).update();

  // Draw widgets
  for (int i = 0; i < widgets.size(); i++)
    ((Widget)widgets.get(i)).draw();
}

void keyPressed()
{
  resetIdle();

  if (selectedWidget != null)
  {
    selectedWidget.keyPressed(key, keyCode);
  }
}

void mousePressed()
{
  resetIdle();
  
  // Only use left clicks to adjust; don't try to adjust if already adjusting
  if (mouseButton != LEFT || adjustingWidget) return;

  // Deselect existing selection
  if (selectedWidget != null)
  {
    selectedWidget.selected = false;
    selectedWidget = null;
  }

  // Check for (and make) new selection
  for (int i = 0; selectedWidget == null && i < widgets.size(); i++)
  {
    Widget widget = (Widget) widgets.get(i);
    if (widget.hit(mouseX, mouseY))
    {
      selectedWidget = widget;
      widget.initAdjust(mouseX, mouseY);
      adjustingWidget = true;
    }
  }
}

void mouseMoved()
{
  resetIdle();
}

void mouseDragged()
{
  resetIdle();

  if (adjustingWidget)
    selectedWidget.adjust(mouseX, mouseY, pmouseX, pmouseY);
}
  
void mouseReleased()
{
  resetIdle();

  if (adjustingWidget && mouseButton == LEFT)
  {
    selectedWidget.endAdjust(mouseX, mouseY);
    adjustingWidget = false;
  }
}

abstract class Widget
{
  public PVector position;
  public boolean selected = false;

  public abstract void update();
  public abstract void draw();
  public abstract boolean hit(int x, int y);
  public abstract void initAdjust(int mx, int my);
  public abstract void adjust(int mx, int my, int px, int py);
  public abstract void endAdjust(int mx, int my);
  public abstract float value();
  
  public abstract void keyPressed(int key, int keyCode);
}

class SuperKnob extends Widget
{
  public int maxRevs = 5; // This many revolutions allowed in +ve and -ve directions

  public float knobSize = 20; // Radius of knob body

  float angle;  // Current angle
  private float adjustAngle = angle; // Angle attempting to be set by mouse movement
  
  float angleSmallStep = TWO_PI * 0.1;
  float angleLargeStep = TWO_PI;

  boolean adjusting; // Set true when adjusting (not automating);
  
  boolean automate; // Set true when automating
  float automateTargetAngle; // Target angle of automation
  float automateEase = 0.1; // Easing factor for automation
  float automateEpsilon = 0.02; // Automation will "finish" if this close or closer
  
  boolean snap = true;     // Snapping on?
  boolean snapped = false; // Set true when snapped (at snap point or min/max)
  float snapTolerance = 0.06; // Snap to full revolution if within this angle (radians)
  
  int knobBodyColor       = 0xffffffff;  // White
  int knobOutlineColor    = 0xff000000;  // Black
  int knobMarkerColor     = 0xffcc9900;  // Orange
  int knobMarkerSnapColor = 0xffff0000;  // Red

  int knobSelectedColor   = 0xffffff66;  // Pale yellow
  int knobAdjustingColor  = 0xffffff00;  // Yellow
  int knobMarkerAdjustingColor = 0xff000000; // Black
  int knobAutomateColor   = 0xff6666ff;  // Blue

  float cuffRelativeSize = 1.3; // Size of cuff in proportion to knob (should be >1 !)
  int cuffColorNeg     = 0xff00aaff;  // Blue-cyan
  int cuffColorPos     = 0xffffaa00;  // Orange
  int cuffColorZero    = 0xff336633;  // Dark green
  int cuffOutlineColor = 0xff000000;  // Black
  int cuffDivsColor    = 0xff333333;  // Dark grey
  
  int revsMarkerColor        = 0xff000000; // Black
  int revsMarkerHilightColor = 0xffffffff; // White
  int revsMarkerSnapColor    = 0xffffff00; // Yellow
  
  int textColor = 0xff000000; // Black
  
  public SuperKnob(float posx, float posy)
  {
    position = new PVector(posx, posy);
    setAngle(0);
  }
  
  public void update()
  {
    if (automate)
    {
      adjustAngle = lerp(adjustAngle, automateTargetAngle, automateEase);
      
      // Complete automation if close to target
      if (abs(adjustAngle - automateTargetAngle) < automateEpsilon)
      {
        adjustAngle = automateTargetAngle;
        automate = false;
      }
      
      setAngle(adjustAngle);
    }
  }

  public void draw()
  {
    pushStyle();
    pushMatrix();
    
    fill(textColor);
    text(nfs(value(), 0, 3), position.x, position.y + knobSize + knobFontSize);
  
    translate(position.x, position.y);
    rotate(-PI/2); // Make "up" the zero angle (like "12 oclock")
  
    float maxAngle = maxRevs * TWO_PI;
    
    float cuffSize = knobSize * cuffRelativeSize;
    float cuffAngle = TWO_PI / 3.0f;

    // Fill the cuff based on revolutions away from zero
    int maxColor = angle < 0 ? cuffColorNeg : cuffColorPos;
    fill(lerpColor(cuffColorZero, maxColor, abs(angle) / maxAngle));
    stroke(cuffOutlineColor);
    strokeWeight(2);
    arc(0, 0, cuffSize, cuffSize, TWO_PI - cuffAngle, TWO_PI + cuffAngle);

    float a, ca, sa, r1, r2; // angle, cos, sin, inner/outer radius

    for (int i = 0; i <= maxRevs; i++)
    {
      a = (float) i / maxRevs * cuffAngle;
      ca = cos(a);
      sa = sin(a);
      
      r1 = (i == maxRevs) ? knobSize : cuffSize + 5;
      r2 = cuffSize + 9;

      line(r1 * ca, r1 * sa, r2 * ca, r2 * sa);
      line(r1 * ca, -r1 * sa, r2 * ca, -r2 * sa);
    }

    // Revs marker
    a = angle / maxAngle * cuffAngle;
    ca = cos(a);
    sa = sin(a);
    float x1 = knobSize * ca;
    float y1 = knobSize * sa;
    float x2 = cuffSize * ca;
    float y2 = cuffSize * sa;

    // Revs marker outline
    stroke(revsMarkerColor);
    strokeWeight(9);
    line(x1, y1, x2, y2);

    // Revs marker hilight
    if (snapped)
      stroke(revsMarkerSnapColor);
    else
      stroke(revsMarkerHilightColor);
    strokeWeight(3);
    line(x1, y1, x2, y2);

    // Knob body
    fill(adjusting ? knobAdjustingColor :
         automate  ? knobAutomateColor  :
         selected  ? knobSelectedColor
                   : knobBodyColor);
    stroke(knobOutlineColor);
    strokeWeight(4);
    ellipse(0, 0, knobSize, knobSize);

    // Knob angle marker
    ca = cos(angle);
    sa = sin(angle);
    r1 = knobSize * 0.35;
    r2 = knobSize * 0.85;
  
    stroke(snapped   ? knobMarkerSnapColor :
           adjusting ? knobMarkerAdjustingColor
                     : knobMarkerColor);
    strokeWeight(4);
    line(r1 * ca, r1 * sa, r2 * ca, r2 * sa);
    
    popMatrix();
    popStyle();
  }
  
  // Determine if coordinates are close enough to knob for adjustment
  public boolean hit(int x, int y)
  {
    return dist(x, y, position.x, position.y) <= knobSize * cuffRelativeSize * 1.2 + 15;
  }

  // Call to initiate value adjustment (eg on mouse click)
  public void initAdjust(int mx, int my)
  {
    selected = true;
    automate = false;
    adjusting = true;
    adjustAngle = angle;
  }

  // Call to enact adjustment (eg on mouse move)
  // Takes current mouse position and previous mouse position  
  public void adjust(int mx, int my, int px, int py)
  {
    float offx = mx - position.x;
    float offy = my - position.y;
    if (abs(offx) + abs(offy) < 3)
      return;
    
    float thisAngle = atan2(offy, offx);
    float prevAngle = atan2(py - position.y, px - position.x);
    float diff = thisAngle - prevAngle;
  
    if (diff >= PI) diff -= TWO_PI;
    else if (diff <= -PI) diff += TWO_PI;
  
    adjustAngle += diff;
    
    setAngle(adjustAngle);
  }
  
  // Call to complete adjustment (eg on mouse release)
  public void endAdjust(int mx, int my)
  {
    adjusting = false;
  }
  
  public float maxAngle()
  {
    return maxRevs * TWO_PI;
  }
  
  public void automate(float targetAngle)
  {
    if (!adjusting)
    {
      float maxAngle = maxAngle();
      adjustAngle = angle;
      automateTargetAngle = constrain(targetAngle, -maxAngle, maxAngle);
      automate = true;
    }
  }
  
  public void setAngle(float setAngle)
  {
    float absAngle = abs(setAngle);
    int sign = setAngle < 0 ? -1 : 1;
    int revs = round(absAngle / TWO_PI);
    float off = absAngle - revs * TWO_PI;
  
    if (snap && abs(off) < snapTolerance)
    {
      angle = sign * revs * TWO_PI;
      snapped = true;
    }
    else
    {
      angle = setAngle;
      snapped = false;
    }

    // Make sure we don't rotate past the max rotations
    float maxAngle = maxRevs * TWO_PI;
    if (angle < -maxAngle)
    {
      angle = -maxAngle;
      snapped = true;
    }
    else if (angle > maxAngle)
    {
      angle = maxAngle;
      snapped = true;
    }
  }
  
  public float value()
  {
    return angle / TWO_PI;
  }

  public void keyPressed(int key, int keyCode)
  {
    float step = 0;
    if (key == CODED) switch(keyCode)
    {
      case UP:    step = +angleSmallStep; break;
      case DOWN:  step = -angleSmallStep; break;
      case LEFT:  step = -angleLargeStep; break;
      case RIGHT: step = +angleLargeStep; break;
    }
    else switch(key)
    {
      case 'r':
        automate(maxRevs * random(-TWO_PI, TWO_PI));
        break;
    }
    
    if (step != 0) automate((automate ? automateTargetAngle : adjustAngle) + step);
  }
}


