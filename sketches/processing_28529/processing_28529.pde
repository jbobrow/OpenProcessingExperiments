
/**
 * Inspired by Tanagrams.
 *
 * Run and click the application to see a few patterns.
 *
 * Uses the Ani library. Found at
 *   http://www.looksgood.de/libraries/Ani/
 *
 * Author: matthew@densons.org
 * Date: May 8, 2011
 */

import de.looksgood.ani.*;
ArrayList pieces = new ArrayList();
int layout = 0;
void setup ()
{
  size(420, 420);
  background(255);
  Ani.init(this);
  pieces.add(new Triangle(210, 10, 0, 2));
  pieces.add(new Triangle(410, 210, radians(180), 2));
  pieces.add(new Square(10, 10, 0));
  pieces.add(new Diamond(10, 110, radians(0), false));
  pieces.add(new Triangle(10, 210, radians(-90), 0));
  pieces.add(new Triangle(110, 10, 0, 0));
  pieces.add(new Triangle(110, 110, radians(-45), 1));
}
void draw()
{
  background(255);
  for (int i=0; i<pieces.size(); i++)
    ((Piece)pieces.get(i)).draw();
}
void mouseClicked()
{
  if(layout == 0)
  {
    ((Piece)pieces.get(1)).move(10, 210, radians(0));
    layout = 1;
  }
  else if(layout == 1)
  {
    ((Piece)pieces.get(0)).move(210, 210, radians(90));
    ((Piece)pieces.get(1)).move(210, 210, radians(180));
    ((Piece)pieces.get(2)).move(210, 210, radians(0));
    ((Diamond)pieces.get(3)).move(210, 10, radians(90), true);
    ((Piece)pieces.get(4)).move(210, 210, radians(-90));
    ((Piece)pieces.get(5)).move(210, 310, radians(0));
    ((Piece)pieces.get(6)).move(410, 210, radians(135));
    layout = 2;
  }
  else
  {
    ((Piece)pieces.get(0)).move(210, 10, 0);
    ((Piece)pieces.get(1)).move(410, 210, radians(180));
    ((Piece)pieces.get(2)).move(10, 10, 0);
    ((Diamond)pieces.get(3)).move(10, 110, 0, false);
    ((Piece)pieces.get(4)).move(110, 10, 0);
    ((Piece)pieces.get(5)).move(10, 210, radians(-90));
    ((Piece)pieces.get(6)).move(110, 110, radians(-45));
    layout = 0;
  }
}

///////////////////////////////////////////////////////////////
// Piece objects 
///////////////////////////////////////////////////////////////
public class Piece
{
  // these need to be public to allow Ani to Reflect them in an applet
  public float x; 
  public float y;
  public float orient;
  
  color cfill = color(203);
  
  public Piece(float x, float y, float orient)
  {
    this.x = x;
    this.y = y;
    this.orient = orient;
  }
  public void move(float x, float y, float orient)
  {
    Ani.to(this, 1.0, "x", x, Ani.QUAD_OUT);
    Ani.to(this, 1.0, "y", y, Ani.QUAD_OUT);
    Ani.to(this, 1.0, "orient", orient, Ani.QUAD_OUT);
  }

  public void draw() {
    pushMatrix();
    translate(x,y);
    rotate(orient);
    fill(cfill);
    drawPieceShape();
    popMatrix();
  }
  protected void drawPieceShape() {
  }
}
class Square extends Piece
{
  public Square(float x, float y, float orient)
  {
    super(x,y,orient);
  }
  protected void drawPieceShape()
  {
    rect(0,0,100,100);
  }
}
class Diamond extends Piece
{
  boolean mirror = false;
  public Diamond(float x, float y, float orient, boolean mirror)
  {
    super(x,y,orient);
    this.mirror = mirror;
  }
  public void move(float x, float y, float orient, boolean mirror)
  {
    super.move(x,y,orient);
    this.mirror = mirror;
  }
  protected void drawPieceShape()
  {
    if (!mirror)
      quad(0,0,100,0,200,100,100,100);
    else
      quad(0,0,100,0,200,-100,100,-100);
  }
}
class Triangle extends Piece
{
  float fSize;
  public Triangle(float x, float y, float orient, int nSize)
  {
    super(x,y,orient);
    if (nSize == 0)
      fSize = 100;
    else if (nSize == 1)
      fSize = 100 / cos(radians(45));
    else
      fSize = 200;

  }
  protected void drawPieceShape()
  {
    triangle(0,0,fSize,0,0,fSize);
  }
}

