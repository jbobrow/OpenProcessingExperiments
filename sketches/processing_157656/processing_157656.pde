


boolean LOGGING = true;

Background _background;
Pivot _pivotRadians;
Pivot _pivotPercent;
Arc _arc;
Point _center;
Triangle _triangle;
Circle _end0;
Circle _end1;
Text _percent;
Text _decimal;
Button _tanButton;
Button _cosButton;
Button _sinButton;
Button test;


final int BLACK_OUTLINE = #000000;
final int BLUE_OUTLINE = #385D8A;
final int BLUE_FILL = #B3A2C7;
final int RED_FILL = #C05048;
final int GREEN_FILL = #77933C;
final int BACKGROUND_FILL = #31859C;

// types
final int PERCENT = 0;
final int DECIMAL = 1;
final int RADIANS = 2;

//modes
final int SIN = 100;
final int COS = 101;
final int TAN = 102;

final int OPPOSITE = 200;
final int ADJACENT = 201;
final int HYPOTENUSE = 202;

final int ADJACENT_COLOUR = #B3A2C7;
final int OPPOSITE_COLOUR = #C05048;
final int HYPOTENUSE_COLOUR = #A349A4;

final int HAS_OUTLINE = 300;
final int NO_OUTLINE = 301;

ArrayList objects;

float _scaleFactor = 1.0;

void setup()
{
  size(800, 800);

  console.log("NO_OUTLINE: " + NO_OUTLINE);
  // set background early to stop flicker
  background(BACKGROUND_FILL);
  
  noLoop();

  imageMode(CENTER);
  shapeMode(CENTER);

  objects = new ArrayList();
  
  // draw background square so that it does antialiasing
  _background = new Background(BACKGROUND_FILL);
  _arc = new Arc(width * .2, height * .7, (int)(width*1.2), (int)(width*1.2), -HALF_PI, 0f);
  _end0 = new Circle(_arc.x, (int)_arc.nearestPointOnArc(_arc.x, 0).y, GREEN_FILL, true);
  _end1 = new Circle((int)_arc.nearestPointOnArc(width, _arc.y).x, _arc.y, BLUE_FILL, true);
  _pivotRadians = new Pivot(RADIANS, width, 0, #D9D9D9, true);
  _triangle = new Triangle();
  _pivotPercent = new Pivot(PERCENT, _scaleFactor * 10, _scaleFactor * 10, #000000, false);
  _percent = new Text(PERCENT, _pivotRadians.getRadians(), _arc.x - _scaleFactor * 100, _arc.y - _scaleFactor * 100);
  _decimal = new Text(DECIMAL, _pivotRadians.getRadians(), _arc.x - _scaleFactor * 100, _arc.y - _scaleFactor * 50);
  _sinButton = new Button(width/2 - _scaleFactor * 200, _arc.y + _scaleFactor * 140, SIN);
  _cosButton = new Button(width/2, _arc.y + _scaleFactor * 140, COS);
  _tanButton = new Button(width/2 + _scaleFactor * 200, _arc.y + _scaleFactor * 140, TAN);
    
  objects.add(_background);
  objects.add(_arc);
  //objects.add(_end0);
  //objects.add(_end1);
  objects.add(_triangle);
  objects.add(_pivotPercent);
  objects.add(_pivotRadians);
  objects.add(_percent);
  objects.add(_decimal);
  
  objects.add(_sinButton);
  objects.add(_cosButton);
  objects.add(_tanButton);
  
}

void draw()
{ 
  // loop through each drawing object
  for(int i = 0; i < objects.size(); i++)
  {
    // draw the object
    objects.get(i).draw(); 
  }
  
  // alternate way to draw is to explicitly call each draw method
  // e.g. _background.draw();
}

class Background
{
  int colour;
  public Background(int colour)
  {
    this.colour = colour;  
  }
  
  void draw()
  {
    fill(this.colour);
    noStroke();
    rect(0,0,width,height);
  }
}

class Circle
{
  int x, y, d = _scaleFactor * 30;
  color colour;
  int _outline = BLUE_OUTLINE;
  
  // type of fill, whether filled or not
  boolean isFilled;
  
  public Circle(color colour, boolean isFilled)
  {  
    this.isFilled = isFilled;
    this.colour = colour;
  }
  
  public Circle(int x, int y, int colour, boolean isFilled)
  {
    this(colour, isFilled);
    this.x = x;
    this.y = y;
  }

  public Circle(int x, int y, int d, int colour, boolean isFilled)
  {
    this(x, y, colour, isFilled);
    this.d = d;
  }
  
  float getRadius()
  {
    return d/2; 
  }
  
  void draw()
  {
    strokeWeight(3);
    stroke(this._outline);
    if(this.isFilled)
    {
      fill(this.colour);
    }
    else
    {
      noFill();
    }
    ellipse(this.x, this.y, this.d, this.d);    
  }
}

class Button extends Circle
{
  
  int type;
  int denominator_colour = HYPOTENUSE_COLOUR;
  
  // indicates whether the button is currently being pressed
  boolean pressed = false;
  
  public Button(int x, int y, int type)
  {
    super(x, y, _scaleFactor * 75, OPPOSITE_COLOUR, true);
    
    this.type = type;
    this.setNumeratorColour();
    this.setDenominatorColour();
    this._outline = BLACK_OUTLINE;
  }
  
  void setNumeratorColour()
  {
    // opposite colour is default
    if(this.getNumerator() == ADJACENT)
    {
      this.colour = ADJACENT_COLOUR;
    }    
  }
  
  void setDenominatorColour()
  {
    // hypotenuse colour is default
    if(this.getDenominator() == ADJACENT)
    {
      this.denominator_colour = ADJACENT_COLOUR;
    }    
  }
  
  boolean hitTest(int mouse_x, int mouse_y)
  {   
    float radius = this.d / 2;
    if( mouse_x > this.x - radius  &&
        mouse_x < this.x + radius &&
        mouse_y > this.y - radius &&
        mouse_y < this.y + radius )
    {
      return true;
    }
    return false;
  }
  
  void draw()
  {
    // draw top half of button
    super.draw();
    
    fill(this.denominator_colour);
    arc(this.x, this.y, this.d, this.d, 0, PI);
    
    // draw the line to close the chord
    line(this.x - this.d/2, this.y, this.x + this.d/2 - 1, this.y);
  }
  
  int getNumerator()
  {
     if (this.type == SIN || this.type == TAN)
     {
        return OPPOSITE; 
     }     
     else //(this.type == COS)
     {
        return ADJACENT; 
     }
  }
  
  int getDenominator()
  {
     if (this.type == COS || this.type == SIN)
     {
        return HYPOTENUSE; 
     }     
     else //(this.type == COS)
     {
        return ADJACENT; 
     }
  }
  
  void click()
  {
     _triangle.setMode(this.type);
     redraw();
  }
}

class Pivot extends Circle
{
  public boolean dragging = false;  
  int type;
  
  Pivot(int type, int x, int y, int colour, int fill)
  {
    super(colour, fill);
    this.type = type;
    
    // initial placement
    if(this.type == RADIANS)
    {
      Point center = _arc.nearestPointOnArc(x, y);
      this.x = center.x;
      this.y = center.y;
    }
    else if (this.type == PERCENT)
    {
      Point center = _triangle.getTransitionPoint();
      this.x = center.x;
      this.y = center.y;
    }
  }
  
  void draw()
  {
    if(this.type == RADIANS)
    {
      Point center = _arc.nearestPointOnArc(x, y);
      this.x = center.x;
      this.y = center.y;
    }
    else if (this.type == PERCENT)
    {
      Point center = _triangle.getTransitionPoint();
      this.x = center.x;
      this.y = center.y;
    }
    super.draw();
  }
  
  public float getAdjacentLength()
  {
    return _arc.x - this.x;
  }
  
  public float getOppositeLength()
  {
     return this.y - _arc.y; 
  }
  
  public float getHypotenuseLength()
  {
    return _arc.h/2;
  }
  
  public double getRadians()
  {
    float oppositeLength = this.getOppositeLength();
    float adjacentLength = this.getAdjacentLength();
    float hypotenuseLength = this.getHypotenuseLength();
    
    // when the sides get too small the result of asin or acos is unreliable, so use longest sides
    if(oppositeLength > adjacentLength)
      return asin(oppositeLength / hypotenuseLength);
    else
      return - PI + acos(adjacentLength/hypotenuseLength);
  }
  
  public boolean hitTest(int mouse_x, int mouse_y)
  { 
    float radius = this.d / 2;
    if( mouse_x > this.x - radius  &&
        mouse_x < this.x + radius &&
        mouse_y > this.y - radius &&
        mouse_y < this.y + radius )
    {
      return true;
    }
    return false;
  }
}

class Text
{
  double message;
  int type, x, y;
  int _textSize = _scaleFactor * 20;
  
   public Text(int type, double message, int x, int y)
   {
     this.type = type;
     this.message = message; 
     this.x = x;
     this.y = y;
   }
   
   public void draw()
   {
     textAlign(LEFT);
     fill(0);
     textSize(_textSize);
     
     pushMatrix();
     Point transitionPoint = _triangle.getTransitionPoint();
     
     if (this.type == PERCENT)
     {
       message = _triangle.getPercent();
       
       translate(transitionPoint.x, transitionPoint.y);
  
       if(_triangle.mode != TAN)
       {
         rotate((float)_pivotRadians.getRadians(), transitionPoint.x, transitionPoint.y);
       }
       else if (abs(transitionPoint.y - _arc.y) > 1) // on the opposite side, allow for if screen resized
       {
         rotate(-HALF_PI, transitionPoint.x, transitionPoint.y); 
       }
       
       String messagePercent = nf(round((float)message), 1, 0) + "%";
       
       if (message != message) // NaN is only number this is true
       {
         text("NaN", 0, 0);
       }
       else
       {
         // center text manually because rotate ignores textAlign(CENTER)
         translate(-textWidth(messagePercent) / 2, 0);
         
         // move up above the pivot point
         translate(0, - _pivotRadians.d);
         text(messagePercent, 0,  0);
       }
     }
     else if (this.type == DECIMAL)
     {
       // located above the button
       
       Button activeButton;
       if (_triangle.mode == SIN)
       {
           activeButton = _sinButton;
       }
       else if (_triangle.mode == COS)
       {
          activeButton = _cosButton; 
       }
       else if (_triangle.mode == TAN)
       {
          activeButton = _tanButton;
       }
       
       textAlign(CENTER);
              
       message = _triangle.getDecimal();
       
       if (message != message) // NaN is only number this is true
       {
         text("NaN", activeButton.x, activeButton.y - _scaleFactor * 50);
       }
       else
       {
         String messagePercent = nf((float)message, 1, 2);

         text(messagePercent, activeButton.x, activeButton.y - _scaleFactor * 50);
       }
     } 
     popMatrix();
   }
}



class Arc
{
  int x, y, w, h;
  float start, stop;
  
  // x, y is center of the circle
  Arc(int x, int y, int w, int h, float start, float stop)
  {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.start = start;
    this.stop = stop;
  }
  
  // given location x, y
  // return the nearest point 
  // from http://stackoverflow.com/questions/300871/best-way-to-find-a-point-on-a-circle-closest-to-a-given-point
  // where P is the point, C is the center, and R is the radius, in a suitable "mathy" language:
  //  V = (P - C); Answer = C + V / |V| * R;

  Point nearestPointOnArc(int x, int y)
  {
    float vX = x - this.x; 
    float vY = y - this.y;
    float magV = sqrt(vX*vX + vY*vY);
    float aX = this.x + vX / magV * this.w/2;
    float aY = this.y + vY / magV * this.h/2;
    return new Point(aX, aY);
  }
  
  void draw()
  {
    //black line
    stroke(#000000);
    strokeWeight(2);
    noFill();
    
    // draw the arc
    arc(this.x, this.y, this.w, this.h, this.start, this.stop); 
  }
}

class DashedLine
{
  int x0, y0, x1, y1;
  DashedLine(int x0, int y0, int x1, int y1)
  {
    this.x0 = x0;
    this.y0 = y0;
    this.x1 = x1;
    this.y1 = y1; 
  }
  
  void draw()
  {
    stroke(BLUE_FILL);
    strokeWeight(3);
    
    // number of dashes depends on the length of the line
    float numDashes = distance(x0, y0, x1, y1);
    
    // scale number of dashes to aesthetically pleasing amount
    numDashes /= 15;
    
    boolean draw = true;
    
    float x_prev = x0, y_prev = y0;
    
    // use the number of dashes to make small lines
    for(int i = 1; i < numDashes; i++)
    {
      
        float x = lerp(x0, x1, i/numDashes);
        float y = lerp(y0, y1, i/numDashes);
        
        if (draw)
        {
            line(x_prev, y_prev, x, y);
        }
        draw = !draw;
                
        x_prev = x;
        y_prev = y;
    }
    
    // solid line would look like: line(this.x0, this.y0, this.x1, this.y1); 
  }
  
  float distance(int x0, int y0, int x1, int y1)
  {
      return sqrt((x0 - x1)*(x0 - x1) + (y1 - y0)*(y1 - y0));
  }
}

class Triangle
{
  int rectWidth;
  int rectSkinnyWidth;
  // corners  
  // center: _arc.x, _arc.y
  // righttop: _pivotRadians.x, _pivotRadians.y
  // rightbottom: _pivotRadians.x, _arc.y
  
  Point _transitionPoint;
  int mode;
  
  Triangle() 
  {
    this.mode = SIN;
    this.rectWidth = 30 * _scaleFactor;
    this.rectSkinnyWidth = 10 * _scaleFactor;
  }
  
  Point getTransitionPoint()
  {
    console.log("getTransitionPoint: " + mode);

    if (this.mode == SIN)
    {
      console.log("hi");
      Quad opposite_quad = GetOppositeSide(HAS_OUTLINE);
      console.log("getTransitionPoint(): opposite_quad: " + opposite_quad.toString());
            
      //move the non-pivot end to the end where it will stay 
      opposite_quad.translate(_arc.x - _pivotRadians.x, 0);
      
      // rotate to the angle of the hypotenuse
      opposite_quad.rotate(HALF_PI + _pivotRadians.getRadians() + PI);
      
      // move along the hypotenuse so the end is at the arc point
      opposite_quad.translate(_pivotRadians.x - _arc.x, _pivotRadians.y - _arc.y);
      
      setTransitionPoint(new Point((opposite_quad.points[2].x + opposite_quad.points[3].x)/2, (opposite_quad.points[2].y + opposite_quad.points[3].y)/2));
    }
    else if (this.mode == COS)
    {
      // clone the adjacent_quad
      Quad overlay_quad = GetAdjacentSide(HAS_OUTLINE);
      
      // draw an overlay on top of the hypotenuse to show the length of the adjacent side
      overlay_quad.rotate(_pivotRadians.getRadians());
      
      setTransitionPoint(new Point((overlay_quad.points[2].x + overlay_quad.points[3].x)/2, (overlay_quad.points[2].y + overlay_quad.points[3].y)/2));
    }    
    else if (this.mode == TAN)
    {
      // for longer side red
      if(_pivotRadians.getRadians() < -PI/4)
      {
         overlay_quad = GetAdjacentSide(HAS_OUTLINE);
         
         overlay_quad.translate(- _pivotRadians.x + _arc.x, 0);
        
        // rotate to the angle of the adjacent side
        overlay_quad.rotate(HALF_PI);
        
        overlay_quad.translate(_pivotRadians.x - _arc.x, 0);
        
        setTransitionPoint(new Point((overlay_quad.points[0].x + overlay_quad.points[1].x)/2, (overlay_quad.points[0].y + overlay_quad.points[1].y)/2));
      }
      else // longer side is the adjacent side
      {
        // draw an overlay on top of the hypotenuse to show the length of the adjacent side
        overlay_quad = GetOppositeSide(HAS_OUTLINE);
        
        overlay_quad.translate(- _pivotRadians.x + _arc.x, 0);
        
        // rotate to the angle of the adjacent side
        overlay_quad.rotate(-HALF_PI);
        
        overlay_quad.translate(_pivotRadians.x - _arc.x, 0);
        
        setTransitionPoint(new Point((overlay_quad.points[2].x + overlay_quad.points[3].x)/2, (overlay_quad.points[2].y + overlay_quad.points[3].y)/2));
      }
    }
    
    return this._transitionPoint;
  }
  
  void setTransitionPoint(Point point)
  {
      _transitionPoint = point;
      
      // TODO: change the other stuff in the triangle accordingly
  }
  
  void setMode(int mode)
  {
     this.mode = mode;
   }
  
  void draw()
  { 
    console.log("Triangle.draw(): " + mode);
    if(this.mode == COS)
    {
      DashedLine opposite_line = new DashedLine(_pivotRadians.x, _pivotRadians.y, _pivotRadians.x, _arc.y);
      //opposite_line.draw();
      
      // show hypotenuse
      // largest side gets filled red
      Quad hypotenuse_quad = GetHypotenuse(HAS_OUTLINE);
      hypotenuse_quad.draw();
      
      // show adjacent side
      Quad adjacent_quad = GetAdjacentSide(NO_OUTLINE);
      adjacent_quad.draw();
      
      // draw an overlay on top of the hypotenuse to show the length of the adjacent side
      Quad overlay_quad = new Quad(adjacent_quad);
      
      overlay_quad.rotate(_pivotRadians.getRadians());
      overlay_quad.draw();
      
      //setTransitionPoint(new Point((overlay_quad.points[2].x + overlay_quad.points[3].x)/2, (overlay_quad.points[2].y + overlay_quad.points[3].y)/2));
    }
    else if(this.mode == SIN)
    {

      DashedLine opposite_line = new DashedLine(_pivotRadians.x, _arc.y, _arc.x, _arc.y);
      //opposite_line.draw();
      
      // show hypotenuse
      Quad hypotenuse_quad = GetHypotenuse(HAS_OUTLINE);
      hypotenuse_quad.draw();
      
      // show opposite side
      Quad opposite_quad = GetOppositeSide(NO_OUTLINE);
      opposite_quad.draw();
      
      console.log("draw: opposite_quad: " + opposite_quad.toString());

      // draw an overlay on top of the hypotenuse to show the length of the adjacent side
      Quad overlay_quad = new Quad(opposite_quad);
      
      console.log("draw: overlay_quad: " + overlay_quad.toString());
      
      
      //move the non-pivot end to the end where it will stay 
      overlay_quad.translate(_arc.x - _pivotRadians.x, 0);
      
      // rotate to the angle of the hypotenuse
      overlay_quad.rotate(HALF_PI + _pivotRadians.getRadians() + PI);
      
      // move along the hypotenuse so the end is at the arc point
      overlay_quad.translate(_pivotRadians.x - _arc.x, _pivotRadians.y - _arc.y);

      overlay_quad.draw();
      
      //setTransitionPoint(new Point((opposite_quad.points[2].x + opposite_quad.points[3].x)/2, (opposite_quad.points[2].y + opposite_quad.points[3].y)/2));
    }
    else if(this.mode == TAN)
    {
      DashedLine opposite_line = new DashedLine(_arc.x, _arc.y, _pivotRadians.x, _pivotRadians.y);
      //console.log("new DashedLine(" + _arc.x + ", " + _arc.y + ", " + _pivotRadians.x + ", " + _pivotRadians.y + ");");
      
      //opposite_line.draw();
      
      // show adjacent side
      Quad adjacent_quad;

      // show opposite side
      Quad opposite_quad;
      
      // show overlay
      Quad overlay_quad;
      
      // draw longer side red
      if(_pivotRadians.getRadians() < -PI/4)
      {
         opposite_quad = GetOppositeSide(HAS_OUTLINE);
         opposite_quad.draw();

         adjacent_quad = GetAdjacentSide(NO_OUTLINE);
         adjacent_quad.draw();
         
         overlay_quad = new Quad(adjacent_quad);
         
         overlay_quad.translate(- _pivotRadians.x + _arc.x, 0);
        
        // rotate to the angle of the adjacent side
        overlay_quad.rotate(HALF_PI);
        
        overlay_quad.translate(_pivotRadians.x - _arc.x, 0);
        
        setTransitionPoint(new Point((overlay_quad.points[0].x + overlay_quad.points[1].x)/2, (overlay_quad.points[0].y + overlay_quad.points[1].y)/2));
        
        overlay_quad.draw();
      }
      else // longer side is the adjacent side
      {
        adjacent_quad = GetAdjacentSide(HAS_OUTLINE);
        adjacent_quad.draw();

        opposite_quad = GetOppositeSide(NO_OUTLINE);
        opposite_quad.draw();

        // draw an overlay on top of the hypotenuse to show the length of the adjacent side
        overlay_quad = new Quad(opposite_quad);
        
        overlay_quad.translate(- _pivotRadians.x + _arc.x, 0);
        
        // rotate to the angle of the adjacent side
        overlay_quad.rotate(-HALF_PI);
        
        overlay_quad.translate(_pivotRadians.x - _arc.x, 0);
        
        setTransitionPoint(new Point((overlay_quad.points[2].x + overlay_quad.points[3].x)/2, (overlay_quad.points[2].y + overlay_quad.points[3].y)/2));
        
        overlay_quad.draw();
      }
    }
  } // end draw()
  
  float getAdjacentLength()
  {
    return _arc.x - _pivotRadians.x;
  }
  
  float getOppositeLength()
  {
     return _pivotRadians.y - _arc.y; 
  }
  
  float getHypotenuseLength()
  {
    return _arc.w/2;
  }
  
  // return the current ratio
  float getPercent()
  {
    return getDecimal() * 100;
    
  }
  
    // return the current ratio
  float getDecimal()
  {
    switch(this.mode)
    {
      case SIN:
        return abs(this.getOppositeLength() / this.getHypotenuseLength());
        break;
      case COS:
        return abs(this.getAdjacentLength() / this.getHypotenuseLength());
        break;
      case TAN:
        float adjacentLength = abs(this.getAdjacentLength());
        float oppositeLength = abs(this.getOppositeLength());

        if (oppositeLength < .0001) return NaN;
        return adjacentLength / oppositeLength;
    }
  }

  Quad GetHypotenuse()
  { 
    return GetHypotenuse(HAS_OUTLINE);
  }
  
  Quad GetHypotenuse(int _outline)
  {
    if (_outline == HAS_OUTLINE)
    {
      return GetHypotenuse(HYPOTENUSE_COLOUR, rectWidth, _outline);
    } 
    else if (_outline == NO_OUTLINE)
    {
      return GetHypotenuse(HYPOTENUSE_COLOUR, rectSkinnyWidth, _outline);
    }
  }
  
  Quad GetHypotenuse(int colour, float _width, int _outline)
  {
    Quad hypotenuse_quad = new Quad(_arc.x, _arc.y - _width/2,
           _arc.x, _arc.y + _width/2,
           _arc.x + _arc.w/2, _arc.y + _width/2,         
           _arc.x + _arc.w/2, _arc.y - _width/2, colour, HAS_OUTLINE);
     hypotenuse_quad.rotate(_pivotRadians.getRadians(),
     _outline);  
     return hypotenuse_quad;
  }
  
  Quad GetAdjacentSide()
  {
    return GetAdjacentSide(HAS_OUTLINE);
  }
  
  Quad GetAdjacentSide(int _outline)
  {
    if (_outline == HAS_OUTLINE)
    {
      return GetAdjacentSide(ADJACENT_COLOUR, rectWidth, _outline);
    } 
    else if (_outline == NO_OUTLINE)
    {
      return GetAdjacentSide(ADJACENT_COLOUR, rectSkinnyWidth, _outline);
    } 
  }
  
  Quad GetAdjacentSide(int colour, float _width, int _outline)
  {
    Quad adjacent_side = new Quad(_arc.x, _arc.y - _width/2,
           _arc.x, _arc.y + _width/2,
           _pivotRadians.x, _arc.y + _width/2,         
           _pivotRadians.x, _arc.y - _width/2,
           colour, _outline);
           return adjacent_side;
  }
  
  Quad GetOppositeSide(int _outline)
  {
    console.log("GetOppositeSide("+_outline+")");
    if (_outline == HAS_OUTLINE)
    {
      return GetOppositeSide(OPPOSITE_COLOUR, rectWidth, _outline);
    } 
    else if (_outline == NO_OUTLINE)
    {
      return GetOppositeSide(OPPOSITE_COLOUR, rectSkinnyWidth, _outline);
    } 
  }
  
  Quad GetOppositeSide(int colour, float _width, int _outline)
  { 
    // show opposite side
      Quad opposite_quad = new Quad(_pivotRadians.x - _width/2, _arc.y,
           _pivotRadians.x + _width/2, _arc.y,
           _pivotRadians.x + _width/2, _pivotRadians.y,         
           _pivotRadians.x - _width/2, _pivotRadians.y,
           colour, _outline);
      console.log("GetOppositeSide(" + colour + ", " + _width + "): " + opposite_quad.toString());
      return opposite_quad; 
  }
}

class Quad
{
    Point[] points = new Point[4];
    int colour;
    int _outline;
    
    public Quad(int x0, int y0, int x1, int y1, int x2, int y2, int x3, int y3, int colour, int _outline)
    {
      this.points[0] = new Point(x0, y0);
      this.points[1] = new Point(x1, y1);
      this.points[2] = new Point(x2, y2);
      this.points[3] = new Point(x3, y3);
      this.colour = colour;
      this._outline = _outline;
    }
    
    // clone
    Quad(Quad original)
    {
      for(int i = 0; i < 4; i++)
      {
        this.points[i] = new Point(original.points[i].x, original.points[i].y);
      }
      this.colour = original.colour;  
      this._outline = original._outline;    
    }
    
    
    public void rotate(double radians)
    {
      for(int i = 0; i < 4; i++)
      {
        points[i].rotate(radians);
      }
    }
    
    public void translate(int x, int y)
    {
      for(int i = 0; i < 4; i++)
      {
        points[i].translate(x, y);
      }
    }
    
    public void draw()
    {
      if(_outline == HAS_OUTLINE)
      {
        stroke(BLUE_OUTLINE);
        strokeWeight(3);
      }
      else if (_outline == NO_OUTLINE)
      {
        noStroke(); 
      }
      fill(colour);
      quad(points[0].x, points[0].y,
            points[1].x, points[1].y,
            points[2].x, points[2].y,
            points[3].x, points[3].y);
    }
    
    String toString()
    {
      return this.points[0].toString() + ", " + 
        this.points[1].toString() + ", " +
        this.points[2].toString() + ", " +
        this.points[3].toString() + ", " +
        colour + ", " +
        _outline; 
    }
}

class Point
{
  int x, y;
  public Point(float x, float y)
  {
    this.x = (int)x;
     this.y = (int)y; 
  }
  
  String toString()
  {
    return "{" + x + ", " + y + "}";  
  }
  
  // adapted from http://jsfiddle.net/dahousecat/4TtvU/
  void rotate(double radians)
  {
    double new_x =  Math.cos(radians) * (this.x-_arc.x) - Math.sin(radians) * (this.y-_arc.y) + _arc.x;
    this.y = (int)(Math.sin(radians) * (this.x-_arc.x) + Math.cos(radians) * (this.y-_arc.y) + _arc.y);
    this.x = (int)new_x;
  }
  
  void translate(int x, int y)
  {
     this.x = this.x + x;
     this.y = this.y + y; 
  }
  
  void draw()
  {
    // black
    stroke(0);
    
    // size of the point
    strokeWeight(_scaleFactor * 10);
    
    // draw the point
    point(this.x, this.y); 
  }
}


/// MOUSE ///
void mouseMoved()
{
  if(_pivotRadians.hitTest(mouseX, mouseY) ||
       _pivotPercent.hitTest(mouseX, mouseY) || 
       _sinButton.hitTest(mouseX, mouseY) ||
       _cosButton.hitTest(mouseX, mouseY) ||
       _tanButton.hitTest(mouseX, mouseY))
  {
    cursor(HAND);
  }
  else
  {
     cursor(ARROW); 
  }
}

void mousePressed() 
{
  console.log("mousePressed");
  // check if the mouse was clicked on the pivot
  if(_pivotRadians.hitTest(mouseX, mouseY))
  {
    _pivotRadians.dragging = true;
    redraw();
  }
  else if (_pivotPercent.hitTest(mouseX, mouseY))
  {
     _pivotPercent.dragging = true; 
     redraw();
  }
  else if (_sinButton.hitTest(mouseX, mouseY))
  {
    _sinButton.pressed = true;
  }
  else if (_cosButton.hitTest(mouseX, mouseY))
  {
    _cosButton.pressed = true;
  }
  else if (_tanButton.hitTest(mouseX, mouseY))
  {
    _tanButton.pressed = true;
  }
}

// whenever the mouse was dragged while holding down a button
void mouseDragged()
{
  if (_pivotRadians.dragging)
  {
    Point p = _arc.nearestPointOnArc(mouseX, mouseY);

    // no further left than the leftmost part of the arc    
    if(p.x < _arc.x)
    {
      _pivotRadians.x = _end0.x;
      _pivotRadians.y = _end0.y;
    }
    else if(p.y > _end1.y)
    {
      _pivotRadians.x = _end1.x; 
      _pivotRadians.y = _end1.y;
    }
    else
    {
      _pivotRadians.x = p.x;
      _pivotRadians.y = p.y;
    }
    
    Point transitionPoint = _triangle.getTransitionPoint();
    _pivotPercent.x = transitionPoint.x;
    _pivotPercent.y = transitionPoint.y;
    
    redraw();
  }
  else if (_pivotPercent.dragging)
  {
    _pivotPercent.x = mouseX;
    _pivotPercent.y = mouseY;
    
    redraw();
    // TODO: move the rest of the objects accordingly
  }
}

void mouseReleased() 
{    
  if (_sinButton.hitTest(mouseX, mouseY) && _sinButton.pressed)
  {
    console.log("_sinButton.click();");
    _sinButton.click();
    redraw();
  }
  else if (_cosButton.hitTest(mouseX, mouseY) && _cosButton.pressed)
  {
    console.log("_cosButton.click();");
    _cosButton.click();
    redraw();
  }
  else if (_tanButton.hitTest(mouseX, mouseY) && _tanButton.pressed)
  {
    console.log("_tanButton.click();");
    _tanButton.click();
    redraw();
  }
  
  _pivotRadians.dragging = false;
  _pivotPercent.dragging = false;
  _cosButton.pressed = false;
  _sinButton.pressed = false;
  _tanButton.pressed = false;
}



