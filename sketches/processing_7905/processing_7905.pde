
/**
 * spxlSuperKnob
 * 2010-02-27 by subpixel
 * http://subpixels.com
 *
 * Inspired by code by bmud posted at
 * http://processing.org/discourse/yabb2/YaBB.pl?num=1235508056/3#3
 */

final int sketchBackgroundColor = 0xffc8c8c8; // Pale grey

final int gridCols = 2;
final int gridRows = 2;

final int gridSizeX = 100;
final int gridSizeY = 100;

final int knobFontSize = 12;

ArrayList knobs;
Knob adjustingKnob; // Only set if mouse pressed near the knob

void setup()
{
  size(gridCols * gridSizeX, gridRows * gridSizeY);

  smooth();
  ellipseMode(RADIUS);
  
  textFont(createFont("", knobFontSize));
  textAlign(CENTER, CENTER);
  
  int offX = gridSizeX >> 1;
  int offY = gridSizeY >> 1;

  // Create a grid of SuperKnobs with references stored in the knobs ArrayList
  knobs = new ArrayList(gridCols * gridRows);
  for (int col = 0; col < gridCols; col++)
  {
    for (int row = 0; row < gridRows; row++)
    {
      SuperKnob knob = new SuperKnob(col * gridSizeX + offX, row * gridSizeY + offY);
      knob.maxRevs = row * gridCols + col + 1;
      knob.setAngle(knob.maxRevs * random(-TWO_PI, TWO_PI));
      knobs.add(knob);
    }
  }
}

void draw()
{
  background(sketchBackgroundColor);
  
  for (int i = 0; i < knobs.size(); i++)
    ((Knob)knobs.get(i)).draw();
}

void mousePressed()
{
  for (int i = 0; i < knobs.size(); i++)
  {
    Knob knob = (Knob) knobs.get(i);
    if (knob.hit(mouseX, mouseY))
    {
      adjustingKnob = knob;
      adjustingKnob.initAdjust(mouseX, mouseY);
      break;
    }
  }
}

void mouseDragged()
{
  if (adjustingKnob != null)
    adjustingKnob.adjust(mouseX, mouseY, pmouseX, pmouseY);
}
  
void mouseReleased()
{
  if (adjustingKnob != null)
  {
    adjustingKnob.endAdjust(mouseX, mouseY);
    adjustingKnob = null;
  }
}

abstract class Knob
{
  public PVector knobPos;
  public float knobSize = 20;

  float angle;  // Current angle

  public abstract void draw();
  public abstract boolean hit(int x, int y);
  public abstract void initAdjust(int mx, int my);
  public abstract void adjust(int mx, int my, int px, int py);
  public abstract void endAdjust(int mx, int my);
  public abstract void setAngle(float angle);
  public abstract float value();
}

class SuperKnob extends Knob
{
  public int maxRevs = 5;

  private float adjustAngle = angle; // Angle attempting to be set by mouse movement
  
  boolean lock = false; // Set true when at a grabby point (or max or min angle)
  
  int knobBodyColor       = 0xffffffff;  // White
  int knobOutlineColor    = 0xff000000;  // Black
  int knobMarkerColor     = 0xffcc9900;  // Orange
  int knobMarkerLockColor = 0xffff0000;  // Red
  
  int cuffColorNeg     = 0xff00aaff;  // Blue-cyan
  int cuffColorPos     = 0xffffaa00;  // Orange
  int cuffColorZero    = 0xff336633;  // Dark green
  int cuffOutlineColor = 0xff000000;  // Black
  int cuffDivsColor    = 0xff333333;  // Dark grey
  
  int revsMarkerColor        = 0xff000000; // Black
  int revsMarkerHilightColor = 0xffffffff; // White
  int revsMarkerLockColor    = 0xffffff00; // Yellow
  
  int textColor = 0xff000000; // Black
  
  public SuperKnob(float posx, float posy)
  {
    knobPos = new PVector(posx, posy);
    setAngle(0);
  }

  public void draw()
  {
    pushStyle();
    pushMatrix();
    
    fill(textColor);
    text(nfs(value(), 0, 3), knobPos.x, knobPos.y + knobSize + knobFontSize);
  
    translate(knobPos.x, knobPos.y);
    rotate(-PI/2); // Make "up" the zero angle (like "12 oclock")
  
    float maxAngle = maxRevs * TWO_PI;
    
    float cuffSize = knobSize * 1.3;
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
    if (lock)
      stroke(revsMarkerLockColor);
    else
      stroke(revsMarkerHilightColor);
    strokeWeight(3);
    line(x1, y1, x2, y2);

    // Knob body
    fill(knobBodyColor);
    stroke(knobOutlineColor);
    strokeWeight(4);
    ellipse(0, 0, knobSize, knobSize);

    // Knob angle marker
    ca = cos(angle);
    sa = sin(angle);
    r1 = knobSize * 0.35;
    r2 = knobSize * 0.85;
  
    if (lock)
      stroke(knobMarkerLockColor);
    else
      stroke(knobMarkerColor);
    strokeWeight(4);
    line(r1 * ca, r1 * sa, r2 * ca, r2 * sa);
    
    popMatrix();
    popStyle();
  }
  
  public boolean hit(int x, int y)
  {
    return dist(x, y, knobPos.x, knobPos.y) <= knobSize * 1.5 + 15;
  }

  public void initAdjust(int mx, int my)
  {
    adjustAngle = angle;
    knobSize += 10;
  }
  
  public void adjust(int mx, int my, int px, int py)
  {
    float thisAngle = atan2(my - knobPos.y, mx - knobPos.x);
    float prevAngle = atan2(py - knobPos.y, px - knobPos.x);
    float diff = thisAngle - prevAngle;
  
    if (diff >= PI) diff -= TWO_PI;
    else if (diff <= -PI) diff += TWO_PI;
  
    adjustAngle += diff;
    
    setAngle(adjustAngle);
  }
  
  public void endAdjust(int mx, int my)
  {
    knobSize -= 10;
  }
  
  public void setAngle(float setAngle)
  {
    float absAngle = abs(setAngle);
    int sign = setAngle < 0 ? -1 : 1;
    int revs = round(absAngle / TWO_PI);
    float off = absAngle - revs * TWO_PI;
  
    if (abs(off) < 0.06)
    {
      // Note: Maybe really only want to do this
      //       when absAngle is near zero, not on other revolutions
      angle = sign * revs * TWO_PI;
      lock = true;
    }
    else
    {
      angle = setAngle;
      lock = false;
    }

    // Make sure we don't rotate past the max rotations
    float maxAngle = maxRevs * TWO_PI;
    if (angle < -maxAngle)
    {
      angle = -maxAngle;
      lock = true;
    }
    else if (angle > maxAngle)
    {
      angle = maxAngle;
      lock = true;
    }
  }
  
  public float value()
  {
    return angle / TWO_PI;
  }
}


