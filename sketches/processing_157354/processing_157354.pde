
// Water adapted from http://gamedevelopment.tutsplus.com/tutorials/make-a-splash-with-2d-water-effects--gamedev-236

// TODO: Fix that flicker bug

Centroid centroid;
boolean playing = true;

float delta = 0;

float _scaleFactor = 1.0;

void setup()
{
  size(800, 800);
  
  frameRate(30);
  centroid = new Centroid(); 
}

void draw()
{
  if(playing)
  {  
    fill(#2F4F4F);
    background(#2F4F4F); // darkslategray (SVG)  
    rect(0,0,width,height);

    //centroid._rotation = centroid._rotation + delta;  

    centroid.draw();
  }
}


boolean dragging = false;
float pressedMouseX, pressedMouseY;
float initial_atan2;
void mousePressed()
{ 
  pressedMouseX = mouseX;
  pressedMouseY = mouseY;
  
  initial_atan2 = atan2( mouseY - height/2, mouseX - width/2);
  
  dragging = true;
}

void mouseDragged()
{
  centroid._rotation = atan2( mouseY - height/2, mouseX - width/2) - initial_atan2;
 // TODO: rotation depends on the velocity 
}

void mouseReleased()
{
  dragging = false; 
  centroid.Jiggle();
}

void mouseClicked()
{
  redraw(); 
}

void keyPressed() 
{
  // increase speed of rotation the more that they rotate
  delta = delta * 1.1;
  if(key == CODED)
  {
    if(keyCode == LEFT)
    {
      centroid._rotation = centroid._rotation - delta;
    }  
    if(keyCode == RIGHT)
    {
      centroid._rotation = centroid._rotation + delta;
    }  
//    if(keyCode == ENTER)
//    {
//      redraw(); 
//    }
  }

}
void keyReleased()
{
  delta = 0.01; 
}
class Centroid
{
  Triangle Z;
  Quad A;
  Quad B;
  Quad C;

  
//float _scaleFactor = 3;
  float _rotation = 0;
  
  int count = 0;
  
  Centroid()
  {
    Z = new Triangle(new Vector2((float)width/500 * 40*3, (float)width/500 * 50* 3), new Vector2((float)width/500 * 40* 3, (float)width/500 * 80* 3), new Vector2((float)width/500 * 80* 3, (float)width/500 * 80* 3));
    //Z = new Triangle(new Vector2(_scaleFactor * 40, _scaleFactor * 50), new Vector2(_scaleFactor * 40, _scaleFactor * 80), new Vector2(_scaleFactor * 80, _scaleFactor * 80));
    A = new Quad(Z.Aside);
    B = new Quad(Z.Bside);
    C = new Quad(Z.Cside);
    
    // determine the center of mass
    Vector2 Wcenter = center();
    
    // determine shift to move the center of mass to the center of the screen
    Vector2 shift = new Vector2(Wcenter.x - width/2, Wcenter.y - height/2);

    // REMAKE EVERYTHING NOW WITH A SHIFT TO THE CENTER    
    Z = new Triangle(new Vector2((float)width/500 * 40* 3 - shift.x, (float)width/500 * 50* 3 - shift.y), new Vector2((float)width/500 * 40* 3 - shift.x, (float)width/500 * 80* 3 - shift.y), new Vector2((float)width/500 * 80* 3 - shift.x, (float)width/500 * 80* 3 - shift.y), this);
    A = new Quad(Z.Aside, this);
    B = new Quad(Z.Bside, this);
    C = new Quad(Z.Cside, this);
  }
  
  boolean isInside(Vector2 p)
  {
    return A.isInside(p) || B.isInside(p) || C.isInside(p);
  }
  
  float waterPourRate = 100;
  
  void draw()
  {
    A.draw();



    B.draw();
    C.draw();

    waterPourRate = 0.8 * max(abs(A.quadWater.currentWaterLevelY - B.quadWater.currentWaterLevelY), abs(A.quadWater.currentWaterLevelY - C.quadWater.currentWaterLevelY), abs(C.quadWater.currentWaterLevelY - B.quadWater.currentWaterLevelY));
    
    pourWater(A, B);
    pourWater(A, C);
    pourWater(B, C);
//    pourWater(B, A);
//    pourWater(C, B);
//    pourWater(C, A);
    

  
//    print("A: " + A.quadWater.targetWaterArea + " || B: " + B.quadWater.targetWaterArea + " C: " + C.quadWater.targetWaterArea + "\n");
//    print((A.quadWater.targetWaterArea + B.quadWater.targetWaterArea + C.quadWater.targetWaterArea)
//      + " vs actual: " + (A.area() + B.area() + C.area()) / 2);
  }  
  
  void pourWater(Quad A, Quad B)
  {
    float a_b = A.quadWater.currentWaterLevelY - B.quadWater.currentWaterLevelY;
    
    // if the water level is higher in A
    // and B isn't already full of water
    if(a_b <= 0 && !B.isWaterFull(a_b))
    {
      pourWaterFromMtoN(A, B);
    }
    
    if(a_b >= 0 && !A.isWaterFull(a_b))
    {
      pourWaterFromMtoN(B, A);
    }    
  }
  
  void pourWaterFromMtoN(Quad M, Quad N)
  {
    if (M.quadWater.targetWaterArea > waterPourRate)
    {
      M.quadWater.targetWaterArea = M.quadWater.targetWaterArea - waterPourRate;
      N.quadWater.targetWaterArea = N.quadWater.targetWaterArea + waterPourRate;    
    }
    else // remove all water
    {
      N.quadWater.targetWaterArea = N.quadWater.targetWaterArea + M.quadWater.targetWaterArea;
      M.quadWater.targetWaterArea = M.quadWater.targetWaterArea - M.quadWater.targetWaterArea;
    }
  }
  
  void Jiggle()
  {
    A.Jiggle();
    B.Jiggle();
    C.Jiggle(); 
  }
  
  Vector2 center()
  {
    Vector2 Acenter = A.center();
    Vector2 Bcenter = B.center();
    Vector2 Ccenter = C.center();
    float Aarea = A.area();
    float Barea = B.area();
    float Carea = C.area();
    float Totarea = Aarea + Barea + Carea;
    return new Vector2
    (
      (Acenter.x * Aarea + Bcenter.x * Barea + Ccenter.x * Carea) / Totarea,
      (Acenter.y * Aarea + Bcenter.y * Barea + Ccenter.y * Carea) / Totarea
    ); 
  }
}
//class Particle
//{
//  Vector2 Position;
//  Vector2 Velocity;
//  float Orientation;
//
//  Particle(Vector2 position, Vector2 velocity, float orientation)
//  {
//    Position = position;
//    Velocity = velocity;
//    Orientation = orientation;
//  }
//  
//  // clone
//  Particle(Particle x)
//  {
//    Position = new Vector2(x.Position.x, x.Position.y); 
//    Velocity = new Vector2(x.Velocity.x, x.Velocity.y); 
//    Orientation = x.Orientation;
//  }
//}
class Quad
{
  // the four sides of this quad
  Segment s1, s2, s3, s4;
  
  // the water contained within this quad
  QuadWater quadWater;
  
  // used for determining center of rotation
  Centroid centroid;
  
  int count = 0;
  
  Quad(Segment s)
  {
    this.s1 = s.clone();
    this.s2 = new Segment(s1.p2, this.rotate(s1.p1, s1.p2, -HALF_PI));
    this.s3 = new Segment(s2.p2, this.rotate(s2.p1, s2.p2, -HALF_PI));
    this.s4 = new Segment(s3.p2, s1.p1);
  }
  
  Quad(Segment s, Centroid centroid)
  {
    this.centroid = centroid;
    this.s1 = s.clone();
    this.s2 = new Segment(s1.p2, this.rotate(s1.p1, s1.p2, -HALF_PI), centroid);
    this.s3 = new Segment(s2.p2, this.rotate(s2.p1, s2.p2, -HALF_PI), centroid);
    this.s4 = new Segment(s3.p2, s1.p1, centroid);


    quadWater = new QuadWater(this);
  }

  void Jiggle()
  {
    quadWater.Jiggle();  
  }
  
  void draw()
  {
    quadFill();
    
     quadWater.Update();
     quadWater.Draw();
    
     
    
     stroke(#f00000);
     s1.draw();
     stroke(#f0f000);
     s2.draw();
     stroke(#f000f0);
     s3.draw();
     stroke(#f0f0f0);
     s4.draw();
  }
  
  void quadFill()
  {
    color black = 0; 
    fill(black);
    noStroke();
    beginShape(TRIANGLE_STRIP);
    vertex(s1.display_p1.x, s1.display_p1.y, 0);
    vertex(s2.display_p1.x, s2.display_p1.y, 0);
    vertex(s3.display_p1.x, s3.display_p1.y, 0); 
    
    vertex(s1.display_p1.x, s1.display_p1.y, 0);
    vertex(s3.display_p1.x, s3.display_p1.y, 0);
    vertex(s4.display_p1.x, s4.display_p1.y, 0); 
    endShape();
  }
    
  Vector2 center()
  {
    Vector2 s1Center = s1.center();
    Vector2 s2Center = s2.center();
    Vector2 s3Center = s3.center();
    Vector2 s4Center = s4.center();
    
    return new Vector2
    (
      (s1Center.x + s2Center.x + s3Center.x + s4Center.x)/4,
      (s1Center.y + s2Center.y + s3Center.y + s4Center.y)/4
    );
  }
  
  Vector2 displayCenter()
  {
    Vector2 s1Center = s1.displayCenter();
    Vector2 s2Center = s2.displayCenter();
    Vector2 s3Center = s3.displayCenter();
    Vector2 s4Center = s4.displayCenter();
    
    Vector2 dc = new Vector2
    (
      (s1Center.x + s2Center.x + s3Center.x + s4Center.x)/4,
      (s1Center.y + s2Center.y + s3Center.y + s4Center.y)/4
    );

    return dc;
  }
  
  float area()
  {
    float s1L = s1.len();
    return s1L * s1L;
  }
  
//  boolean isInside()
//  {
//    return A.isInside() || B.isInside() || C.isInside();
//  }
//  
  Segment intersectY(float y)
  {
    ArrayList intersections = new ArrayList();
    
    // look at each side.
    Vector2 intersection = this.s1.intersectY(y);
    if(intersection != null)
    {
      intersections.add(intersection);
    }
    
    intersection = this.s2.intersectY(y);
    if(intersection != null)
    {
      intersections.add(intersection);
    }
    
    intersection = this.s3.intersectY(y);
    if(intersection != null)
    {
      intersections.add(intersection);
    }
    
    intersection = this.s4.intersectY(y);
    if(intersection != null)
    {
      intersections.add(intersection);
    }
    
    
    if(intersections.size() < 1) return null;
    if(intersections.size() == 1) return  new Segment((Vector2)intersections.get(0), (Vector2)intersections.get(0), centroid);
    // TODO: account for intersection when more than two sides are involved
    return new Segment((Vector2)intersections.get(0), (Vector2)intersections.get(1), centroid);
    
  }
  
  void rotate(Vector2 origin, float radians)
  {
    s1.rotate(origin, radians);
    s2.rotate(origin, radians); 
    s3.rotate(origin, radians);
    s4.rotate(origin, radians);
  }
  
  Vector2 rotate(Vector2 point, Vector2 origin, float radians)
  {
    return new Vector2
    (
      cos(radians) * (point.x-origin.x) - sin(radians) * (point.y-origin.y) + origin.x,
      sin(radians) * (point.x-origin.x) + cos(radians) * (point.y-origin.y) + origin.y
    );
  }
  
  // http://www.emanueleferonato.com/2012/03/09/algorithm-to-determine-if-a-point-is-inside-a-square-with-mathematics-no-hit-test-involved/
  float triangleArea(Vector2 A, Vector2 B, Vector2 C)
  {
      return (C.x*B.y-B.x*C.y)-(C.x*A.y-A.x*C.y)+(B.x*A.y-A.x*B.y);
  }
  
  boolean isInside(Vector2 P)
  {
    //A:Point,B:Point,C:Point,D:Point,P:Point
    Vector2 A = s1.p1;
    Vector2 B = s2.p1;
    Vector2 C = s3.p1;
    Vector2 D = s4.p1;
    
    if (triangleArea(A,B,P)>0 || triangleArea(B,C,P)>0 || triangleArea(C,D,P)>0 || triangleArea(D,A,P)>0) {
        return false;
    }
    
    return true;
  }


  
  // the very topmost segment of the quad
  Segment quadTopSegment()
  {
    return intersectY(quadTopY());
  }
  
  // the very bottom segment of the quad
  Segment quadBottomSegment()
  {
    return intersectY(quadBottomY());
  }

  // the y for the very bottom of the quad
  float quadBottomY()
  {
    float bottomY;
    float[] corners = {s1.display_p1.y, s2.display_p1.y, s3.display_p1.y, s4.display_p1.y};
    bottomY = max(corners);
    
    return bottomY;
  }
  
  // the y for the very top of the quad
  float quadTopY()
  {
    float topY;
    float[] corners = {s1.display_p1.y, s2.display_p1.y, s3.display_p1.y, s4.display_p1.y};
    topY = min(corners);
    return topY;
  }
  
  boolean isWaterFull(float extra)
  {
    return quadWater.isWaterFull(extra); 
  }
}

class QuadWater
{
  WaterColumn[] columns = new WaterColumn[201];

  public float Tension = 0.0001;//0.025f;
  public float Dampening = 0;//0.025f;
  public float Spread = 0.005;//0.25f;

  float Scale() { return width / (columns.length - 1f); }
  
  Quad quad; // the quad that this water belongs to
  
  // the water level in the quad
  float currentWaterLevelY = -1, currentWaterArea = -1;
  float targetWaterArea;

  float rowHeight = 1; // number of pixels to change

  
  public QuadWater(Quad quad)//(GraphicsDevice device, Texture2D particleTexture)
  {
    this.quad = quad;
    for (int i = 0; i < columns.length; i++)
    {
      columns[i] = new WaterColumn(0, 0, 0); // TODO: add noise
      //columns[i] = new WaterColumn(0, random(-5.2, 5.2), 0); // TODO: add noise
    }

    // set initial area at 50%
    targetWaterArea = quad.area() * .5;
    currentWaterLevelY = quad.displayCenter().y;
    
    Jiggle();
  }
 
  // Returns the height of the water at a given x coordinate.
  public float GetHeight(float x)
  {
    if (x < 0 || x > height)
      return height/2;

    return columns[(int)(x / Scale())].Height;
  }

  private Vector2 FromPolar(float angle, float magnitude)
  {
    return new Vector2(magnitude * (float)cos(angle), magnitude * (float)sin(angle));
  }

  private float GetRandomFloat(float min, float max)
  {
    return random(min, max);
  }

  private Vector2 GetRandomVector2(float maxLength)
  {
    return FromPolar(GetRandomFloat(-PI, PI), GetRandomFloat(0, maxLength));
  }

  private float GetAngle(Vector2 vector)
  {
    return (float)atan2(vector.y, vector.x);
  }

  public void Jiggle()
  {
    for (int i = 0; i < columns.length; i++)
      columns[i].Speed = columns[i].Speed + random(-.54, .54);  
  }
  
  public void Update()
  {
    for (int i = 0; i < columns.length; i++)
      columns[i].Update(Dampening, Tension);

    float[] lDeltas = new float[columns.length];
    float[] rDeltas = new float[columns.length];
    
    // do some passes where columns pull on their neighbours
    for (int j = 0; j < 8; j++)
    {
      for (int i = 0; i < columns.length; i++)
      {
        if (i > 0)
        {
          lDeltas[i] = Spread * (columns[i].Height - columns[i - 1].Height);
          columns[i - 1].Speed += lDeltas[i];
        }
        if (i < columns.length - 1)
        {
          rDeltas[i] = Spread * (columns[i].Height - columns[i + 1].Height);
          columns[i + 1].Speed += rDeltas[i];
        }
      }

      for (int i = 0; i < columns.length; i++)
      {
        if (i > 0)
          columns[i - 1].Height += lDeltas[i];
        if (i < columns.length - 1)
          columns[i + 1].Height += rDeltas[i];
      }
    }
  }


  public void Draw()
  {    
    color lightBlue =  #66CCCC; // aqua

    noStroke();
    //stroke(#fffff0);
    
    // draw the water
    beginShape(TRIANGLE_STRIP);
    
    color midnightBlue = lightBlue;//#ADEAEA;//turquoise
    midnightBlue = #55AAAA;// #191970;
    
    float bottom = height;
    float scale = Scale();
    
    float quadWaterArea = 0;
    int numColumns = 0;

    // small waves when box is full or empty, big waves in the middle
    float waveHeightScalar = 2*(.5 - abs(.5 - currentWaterArea/quad.area()));
    console.log("waveHeightScalar: " + waveHeightScalar);
    
    for (int i = 1; i < columns.length; i++)
    {
      // x values of sides of the column
      float x_L = (i - 1) * scale;
      float x_R = i * scale;
      
      // bottoms of columns
      Vector2 p3 = getBottom(x_L);
      Vector2 p4 = getBottom(x_R);
      // && the top of the water is above the bottom of the quad
      if(p3 != null && p4 != null)
      {
        Vector2 quadTopAtP1X = getTop(x_L);
        Vector2 quadTopAtP2X = getTop(x_R);
        
        float height_L, height_R;
        
        // draw the waves;
        height_L = currentWaterLevelY + columns[i - 1].Height * waveHeightScalar;
        height_R = currentWaterLevelY + columns[i].Height * waveHeightScalar;
        
        if (height_L <= p3.y && height_R <= p4.y)
        { 
          Vector2 p1 = new Vector2(x_L, height_L);
          Vector2 p2 = new Vector2(x_R, height_R);
        
          if(quadTopAtP1X != null && quadTopAtP2X != null)
          {
            // if the water level is above the top of the quad, then only draw to the top of the quad                        
            p2.y = max(p2.y, quadTopAtP2X.y);
            p1.y = max(p1.y, quadTopAtP1X.y);

            AddVertex(p1, lightBlue);
            AddVertex(p2, lightBlue);
            AddVertex(p3, midnightBlue);
      
            AddVertex(p1, lightBlue);
            AddVertex(p3, midnightBlue);
            AddVertex(p4, midnightBlue);
            
            // keep track of how much area is being drawn
            quadWaterArea = quadWaterArea + triangleArea(p1, p2, p3) + triangleArea(p1, p3, p4);
          }
        }
      }
    }
    
    
    endShape();
        
    currentWaterArea = quadWaterArea;
    updateWaterHeight();
  }
  
  // Heron's formula http://www.mathsisfun.com/geometry/herons-formula.html 
  float triangleArea(Vector2 p1, Vector2 p2, Vector2 p3)
  {
    Segment s1 = new Segment(p1, p2);
    Segment s2 = new Segment(p2, p3);
    Segment s3 = new Segment(p3, p1);
    float s = (s1.len() + s2.len() + s3.len()) / 2;
    float A = sqrt(s * (s - s1.len()) * (s - s2.len()) * (s - s3.len()));
    return A;
  }
  
  Vector2 getTop(float x)
  {
    float y = 4 * height;
    
    Vector2 intercept_s1 = quad.s1.intersectX(x);
    Vector2 intercept_s2 = quad.s2.intersectX(x);
    Vector2 intercept_s3 = quad.s3.intersectX(x);
    Vector2 intercept_s4 = quad.s4.intersectX(x);
    
    if (intercept_s1 != null) y = min(intercept_s1.y, y);
    if (intercept_s2 != null) y = min(intercept_s2.y, y);
    if (intercept_s3 != null) y = min(intercept_s3.y, y);
    if (intercept_s4 != null) y = min(intercept_s4.y, y);
    
    if (y > 2 * height) return null;
    return new Vector2(x, y);
  }
  
  Vector2 getBottom(float x)
  {
    float y = -1;
    Vector2 intercept_s1 = quad.s1.intersectX(x);
    Vector2 intercept_s2 = quad.s2.intersectX(x);
    Vector2 intercept_s3 = quad.s3.intersectX(x);
    Vector2 intercept_s4 = quad.s4.intersectX(x);
    
    if (intercept_s1 != null) y = max(intercept_s1.y, y);
    if (intercept_s2 != null) y = max(intercept_s2.y, y);
    if (intercept_s3 != null) y = max(intercept_s3.y, y);
    if (intercept_s4 != null) y = max(intercept_s4.y, y);
    
    if (y < 0) return null;
    return new Vector2(x, y);
  }
  
  void AddVertex(Vector2 v, color c)
  {
    fill(c);
    vertex(v.x, v.y);
  }
  
  // given a certain amount of water, return the height of the water
  // update: values of currentWaterLevelY and currentWaterArea
  // return: currentWaterLevelY
  float updateWaterHeight()
  {
    int maxRowChange = 1000;

    Segment currentRow;
    float tolerance = 30;
    if (currentWaterArea < targetWaterArea - tolerance)
    {

      float _quadTopY = quad.quadTopY(); 
      
     if(currentWaterLevelY < _quadTopY) currentWaterLevelY = _quadTopY;
     
     int count = 0;
      while(currentWaterArea < targetWaterArea && currentWaterLevelY >= _quadTopY && count < maxRowChange)
      {
        count = count + 1;
        currentRow = quad.intersectY(currentWaterLevelY);   
        Segment newWaterLevel = quad.intersectY(currentWaterLevelY - rowHeight);
        currentWaterLevelY = currentWaterLevelY - rowHeight;
        if (currentRow != null && newWaterLevel != null)
        {
           currentWaterArea = currentWaterArea + triangleArea(currentRow.p1, currentRow.p2, newWaterLevel.p1) + triangleArea(currentRow.p1, newWaterLevel.p1, newWaterLevel.p2);;
        }
      }
    }
    else if (currentWaterArea > targetWaterArea + tolerance)
    {
     float _quadBottomY = quad.quadBottomY(); 
      
     if(currentWaterLevelY > _quadBottomY) currentWaterLevelY = _quadBottomY;
     
     int count = 0;
      while(currentWaterArea > targetWaterArea && currentWaterLevelY <= _quadBottomY && count < maxRowChange)
      {
        count = count + 1;
        currentRow = quad.intersectY(currentWaterLevelY);   
        Segment newWaterLevel = quad.intersectY(currentWaterLevelY + rowHeight);
        currentWaterLevelY = currentWaterLevelY + rowHeight;
        if (currentRow != null && newWaterLevel != null) // if one of the rows is null, assume no area changed
        {
           currentWaterArea = currentWaterArea - triangleArea(currentRow.p1, currentRow.p2, newWaterLevel.p1) - triangleArea(currentRow.p1, newWaterLevel.p1, newWaterLevel.p2);;
        }
      }
    }
    return currentWaterLevelY;
  }
  
  
  int tolerance = 0;
  // if the quad is full of water
  boolean isWaterFull(float extra)
  {
    return targetWaterArea >= quad.area() + extra - tolerance;
  }
  
}


class Segment
{
  Vector2 p1, p2;
  Vector2 display_p1 = new Vector2(0,0), display_p2 = new Vector2(0,0);
  Centroid centroid;
  
  Segment(Vector2 p1, Vector2 p2)
  {
    this.p1 = p1;
    this.p2 = p2;
  }
  
  // rotates around the centroid
  Segment(Vector2 p1, Vector2 p2, Centroid centroid)
  {
    this.p1 = p1;
    this.p2 = p2;
    this.centroid = centroid;
    
    // centroid might be null if first initialisation for finding the center of mass
    if (centroid != null)
    {
      Vector2 origin = centroid.center();
      this.display_p1.rotate(this.p1, origin, centroid._rotation);
      this.display_p2.rotate(this.p2, origin, centroid._rotation);
    }
  }
  
  void draw()
  {
    Vector2 origin = centroid.center();
    this.display_p1.rotate(this.p1, origin, centroid._rotation);
    this.display_p2.rotate(this.p2, origin, centroid._rotation);
    
    line(this.display_p1.x, this.display_p1.y, this.display_p2.x, this.display_p2.y);
  }
  
  void draw(boolean rotated)
  {
    if(!rotated)
    {      
      line(p1.x, p1.y, p2.x, p2.y);
    }
  }
  
  float len()
  {
    float dx = p1.x - p2.x;
    float dy = p1.y - p2.y;
    return abs(sqrt(dx * dx + dy * dy));
  }
  
  // if we know that the y is constant
  float lenX()
  {
    return abs(p1.x - p2.x);
  }
  
  Vector2 center()
  {
    return new Vector2((p1.x + p2.x) / 2, (p1.y + p2.y) / 2);
  }

  Vector2 displayCenter()
  {
    return new Vector2((display_p1.x + display_p2.x) / 2, (display_p1.y + display_p2.y) / 2);
  }

  
  void rotate(Vector2 origin, float radians)
  {
    p1.rotate(origin, radians);
    p2.rotate(origin, radians);
  }
  
  void translate(Vector2 shift)
  {
    p1.translate(shift);
    p2.translate(shift);
  }
  
  Segment clone()
  {
     return new Segment(p1.clone(), p2.clone(), centroid);
  }
  
  Vector2 intersectY(float y)
  {
    // both ends are above y, or both ends are below y
    if((display_p1.y > y && display_p2.y > y) || (display_p1.y < y && display_p2.y < y))
    {
      return null;
    }
    else if (display_p1.y == y && display_p2.y == y)
    {
      // return some intersecting point, not all of them
      return new Vector2(display_p1);
    }
    else
    { 
      // two point form of the line
      float x = (display_p2.x - display_p1.x) * (y - display_p1.y) / (display_p2.y - display_p1.y) + display_p1.x;
      return new Vector2(x, y);
    }
  }
  
  Vector2 intersectX(float x)
  {
    // both ends are left of x, or both ends are right of x
    if((display_p1.x > x && display_p2.x > x) || (display_p1.x < x && display_p2.x < x))
    {
      return null;
    }
    else if (display_p1.x == x && display_p2.x == x)
    {
      return new Vector2(x, max(display_p1.y, display_p2.y));
    }
    else
    { 
      // two point form of the line
      float y = (display_p2.y - display_p1.y) * (x - display_p1.x) / (display_p2.x - display_p1.x) + display_p1.y;
      return new Vector2(x, y);
    }
  }
  
  String toString()
  {
     return "Segment: " + display_p1.toString() + ", " + display_p2.toString(); 
  }
}
class Triangle
{
   Segment Aside, Bside, Cside;

   Triangle(Vector2 corner1, Vector2 corner2, Vector2 corner3)
   {
     console.log("Triangle_1() _scaleFactor: " + _scaleFactor);
      this.Aside = new Segment(corner1, corner2);
      this.Bside = new Segment(corner2, corner3);
      this.Cside = new Segment(corner3, corner1);
   }
   
   Triangle(Vector2 corner1, Vector2 corner2, Vector2 corner3, Centroid centroid)
   {
      console.log("Triangle_2() _scaleFactor: " + _scaleFactor);
      this.Aside = new Segment(corner1, corner2, centroid);
      this.Bside = new Segment(corner2, corner3, centroid);
      this.Cside = new Segment(corner3, corner1, centroid);
   }
   
   void draw()
   {
     Aside.draw();
     Bside.draw();
     Cside.draw();
   }
   
   void translate(Vector2 shift)
   {
     Aside.translate(shift);
     Bside.translate(shift);
     Cside.translate(shift);
   }
}

//class Vector2
//{
//  float x, y;
// 
//  Vector2(float x, float y)
//  {
//    this.x = x;
//    this.y = y;
//  } 
//}

class Vector2
{
  float x, y;

  Vector2(float x, float y)
  {
    this.x = x;
    this.y = y;
  } 

  Vector2(Vector2 v)
  {
    this.x = v.x;
    this.y = v.y;
  } 
  
  void draw()
  {
    point(this.x, this.y);
  }
  
  // changes the original point
  void rotate(Vector2 origin, float radians)
  {
     this.x = cos(radians) * (x-origin.x) - sin(radians) * (y-origin.y) + origin.x;
     this.y = sin(radians) * (x-origin.x) + cos(radians) * (y-origin.y) + origin.y;
  }
  
  // doesn't affect the original point
  void rotate(Vector2 p, Vector2 origin, float radians)
  {
     this.x = cos(radians) * (p.x-origin.x) - sin(radians) * (p.y-origin.y) + origin.x;
     this.y = sin(radians) * (p.x-origin.x) + cos(radians) * (p.y-origin.y) + origin.y;
  }
  
  // changes the original point
  void translate(Vector2 shift)
  {
    
     x = x + shift.x;
     y = y + shift.y;
  }
  
  Vector2 clone()
  {
    return new Vector2(x, y); 
  }
  
  String toString()
  {
    return "{" + x + ", " + y + "}"; 
  }
}

//
//class Water
//{
//  WaterColumn[] columns = new WaterColumn[201];
//
//  public float Tension = 0.025f;
//  public float Dampening = 0.025f;
//  public float Spread = 0.25f;
//
////  RenderTarget2D metaballTarget, particlesTarget;
////  SpriteBatch spriteBatch;
////  AlphaTestEffect alphaTest;
////  Texture2D particleTexture;
//
//  float Scale() { return width / (columns.length - 1f); }
//
////  ArrayList<Particle> particles = new ArrayList<Particle>();
//  
//  public Water()//(GraphicsDevice device, Texture2D particleTexture)
//  {
////    pb = new PrimitiveBatch(device);
////    this.particleTexture = particleTexture;
////    spriteBatch = new SpriteBatch(device);
////    metaballTarget = new RenderTarget2D(device, device.Viewport.Width, device.Viewport.Height);
////    particlesTarget = new RenderTarget2D(device, device.Viewport.Width, device.Viewport.Height);
////    alphaTest = new AlphaTestEffect(device);
////    alphaTest.ReferenceAlpha = 175;
//    
////    var view = device.Viewport;
////    alphaTest.Projection = Matrix.CreateTranslation(-0.5f, -0.5f, 0) *
////      Matrix.CreateOrthographicOffCenter(0, view.Width, view.Height, 0, 0, 1);
//
//    for (int i = 0; i < columns.length; i++)
//    {
//      columns[i] = new WaterColumn(height/2, height/2 + random(-height/20, height/20), 0);
//    }
//  }
//
//  // Returns the height of the water at a given x coordinate.
//  public float GetHeight(float x)
//  {
//    if (x < 0 || x > 800)
//      return height/2;
//
//    return columns[(int)(x / Scale())].Height;
//  }
//
////  void UpdateParticle(Particle particle)
////  {
////    const float Gravity = 0.3f;
////    particle.Velocity.Y += Gravity;
////    particle.Position += particle.Velocity;
////    particle.Orientation = GetAngle(particle.Velocity);
////  }
//
////  public void Splash(float xPosition, float speed)
////  {
////    int index = (int)MathHelper.Clamp(xPosition / Scale, 0, columns.Length - 1);
////    for (int i = Math.Max(0, index - 0); i < Math.Min(columns.Length - 1, index + 1); i++)
////      columns[index].Speed = speed;
////
////    CreateSplashParticles(xPosition, speed);
////  }
////
////  private void CreateSplashParticles(float xPosition, float speed)
////  {
////    float y = GetHeight(xPosition);
////
////    if (speed > 120)
////    {
////      for (int i = 0; i < speed / 8; i++)
////      {
////        Vector2 pos = new Vector2(xPosition, y) + GetRandomVector2(40);
////        Vector2 vel = FromPolar(MathHelper.ToRadians(GetRandomFloat(-150, -30)), GetRandomFloat(0, 0.5f * (float)Math.Sqrt(speed)));
////        CreateParticle(pos, vel);
////      }
////    }
////  }
//
////  private void CreateParticle(Vector2 pos, Vector2 velocity)
////  {
////    particles.Add(new Particle(pos, velocity, 0));
////  }
//
//  private Vector2 FromPolar(float angle, float magnitude)
//  {
//    return new Vector2(magnitude * (float)cos(angle), magnitude * (float)sin(angle));
//  }
//
//  private float GetRandomFloat(float min, float max)
//  {
//    return random(min, max);
//  }
//
//  private Vector2 GetRandomVector2(float maxLength)
//  {
//    return FromPolar(GetRandomFloat(-PI, PI), GetRandomFloat(0, maxLength));
//  }
//
//  private float GetAngle(Vector2 vector)
//  {
//    return (float)atan2(vector.y, vector.x);
//  }
//
//  public void Jiggle()
//  {
//    for (int i = 0; i < columns.length; i++)
//      columns[i].Speed = columns[i].Speed + random(-.24, .24);  
//  }
//  
//  public void Update()
//  {
//    for (int i = 0; i < columns.length; i++)
//      columns[i].Update(Dampening, Tension);
//
//    float[] lDeltas = new float[columns.length];
//    float[] rDeltas = new float[columns.length];
//    
//    // do some passes where columns pull on their neighbours
//    for (int j = 0; j < 8; j++)
//    {
//      for (int i = 0; i < columns.length; i++)
//      {
//        if (i > 0)
//        {
//          lDeltas[i] = Spread * (columns[i].Height - columns[i - 1].Height);
//          columns[i - 1].Speed += lDeltas[i];
//        }
//        if (i < columns.length - 1)
//        {
//          rDeltas[i] = Spread * (columns[i].Height - columns[i + 1].Height);
//          columns[i + 1].Speed += rDeltas[i];
//        }
//      }
//
//      for (int i = 0; i < columns.length; i++)
//      {
//        if (i > 0)
//          columns[i - 1].Height += lDeltas[i];
//        if (i < columns.length - 1)
//          columns[i + 1].Height += rDeltas[i];
//      }
//    }
//
////    for(int i = 0; i < particles.length; i++)
////    {
////      UpdateParticle(particles[i]);
////    }
//    
////    ArrayList newParticlesList = new ArrayList();
////    for(int i = 0; i < particles.length; i++)
////    {
////      Particle x = particles[i];
////
////      if(x.Position.X >= 0 && x.Position.X <= 800 && x.Position.Y - 5 <= GetHeight(x.Position.X))
////      {
////        newParticlesList.add(new Particle(x));
////      }
////    }
////    particles = newParticlesList;
//  }
//
////  public void DrawToRenderTargets()
////  {
////    GraphicsDevice device = spriteBatch.GraphicsDevice;
////    device.SetRenderTarget(metaballTarget);
////    device.Clear(Color.Transparent);
////
////    // draw particles to the metaball render target
////    spriteBatch.Begin(0, BlendState.Additive);
////    foreach (var particle in particles)
////    {
////      Vector2 origin = new Vector2(particleTexture.Width, particleTexture.Height) / 2f;
////      spriteBatch.Draw(particleTexture, particle.Position, null, Color.White, particle.Orientation, origin, 2f, 0, 0);
////    }
////    spriteBatch.End();
////
////    // draw a gradient above the water so the metaballs will fuse with the water's surface.
////    pb.Begin(PrimitiveType.TriangleList);
////
////    const float thickness = 20;
////    float scale = Scale;
////    for (int i = 1; i < columns.Length; i++)
////    {
////      Vector2 p1 = new Vector2((i - 1) * scale, columns[i - 1].Height);
////      Vector2 p2 = new Vector2(i * scale, columns[i].Height);
////      Vector2 p3 = new Vector2(p1.X, p1.Y - thickness);
////      Vector2 p4 = new Vector2(p2.X, p2.Y - thickness);
////
////      pb.AddVertex(p2, Color.White);
////      pb.AddVertex(p1, Color.White);
////      pb.AddVertex(p3, Color.Transparent);
////
////      pb.AddVertex(p3, Color.Transparent);
////      pb.AddVertex(p4, Color.Transparent);
////      pb.AddVertex(p2, Color.White);
////    }
////
////    pb.End();
////
////    // save the results in another render target (in particlesTarget)
////    device.SetRenderTarget(particlesTarget);
////    device.Clear(Color.Transparent);
////    spriteBatch.Begin(0, null, null, null, null, alphaTest);
////    spriteBatch.Draw(metaballTarget, Vector2.Zero, Color.White);
////    spriteBatch.End();
////    
////    // switch back to drawing to the backbuffer.
////    device.SetRenderTarget(null);
////  }
//
//  public void Draw()
//  {
//    color lightBlue =  #66CCCC; // aqua
//
//    // draw the particles 3 times to create a bevelling effect
////    spriteBatch.Begin();
////    spriteBatch.Draw(particlesTarget, -Vector2.One, new Color(0.8f, 0.8f, 1f));
////    spriteBatch.Draw(particlesTarget, Vector2.One, new Color(0f, 0f, 0.2f));
////    spriteBatch.Draw(particlesTarget, Vector2.Zero, lightBlue);
////    spriteBatch.End();
//
//    noStroke();
//    // draw the waves
//    beginShape(TRIANGLE_STRIP);
//    
//    color midnightBlue = lightBlue;//#ADEAEA;//turquoise
//    midnightBlue = #191970;
//    
//    float bottom = height;
//    float scale = Scale();
//    for (int i = 1; i < columns.length; i++)
//    {
//      Vector2 p1 = new Vector2((i - 1) * scale, columns[i - 1].Height);
//      Vector2 p2 = new Vector2(i * scale, columns[i].Height);
//      Vector2 p3 = new Vector2(p2.x, bottom);
//      Vector2 p4 = new Vector2(p1.x, bottom);
//
//      AddVertex(p1, lightBlue);
//      AddVertex(p2, lightBlue);
//      AddVertex(p3, midnightBlue);
//
//      AddVertex(p1, lightBlue);
//      AddVertex(p3, midnightBlue);
//      AddVertex(p4, midnightBlue);
//    }
//
//    endShape();
//  }
//  
//  void AddVertex(Vector2 v, color c)
//  {
//    fill(c);
//    vertex(v.x, v.y);
//  }
//}
//

class WaterColumn
{
  float TargetHeight;
  float Height;
  float Speed;
  
  WaterColumn(  float TargetHeight, float Height, float Speed)
  {
    this.TargetHeight = TargetHeight;
    this.Height = Height;
    this.Speed = Speed;
  }
  
  void Update(float dampening, float tension)
  {
    float x = TargetHeight - Height;
    Speed += tension * x - Speed * dampening;
    Height += Speed;
  }
}
class WaterLine
{
  Centroid centroid;
  
  WaterLine()
  { 
  }
  
  WaterLine(Centroid centroid)
  {
    this.centroid = centroid;
  }

  // does the water intersect any sides?
  
  void draw()
  {
    
    Vector2 cent = center();
    stroke(#f0f0f0);
    line(0, cent.y, centroid._scaleFactor * 130, cent.y);
    
    Segment waterA = centroid.A.intersectY(cent.y);
    if (waterA != null)
    {
      // waterA is not null
      stroke(#0000f0);
      waterA.draw(false);
    }

//    Segment waterB = centroid.B.intersectY(cent.y);
//    if (waterB != null)
//    {
//      // waterB is not null
//      stroke(#0000f0);
//      waterB.draw(false);
//    }
//    
//    Segment waterC = centroid.C.intersectY(cent.y);
//    if (waterC != null)
//    {
//      // waterC is not null
//      stroke(#0000f0);
//      waterC.draw(false);
//    }
  }
  
  Vector2 center()
  {
    Vector2 Acenter = centroid.A.center();
    Vector2 Bcenter = centroid.B.center();
    Vector2 Ccenter = centroid.C.center();
    float Aarea = centroid.A.area();
    float Barea = centroid.B.area();
    float Carea = centroid.C.area();
    float Totarea = Aarea + Barea + Carea;
    return new Vector2
    (
      (Acenter.x * Aarea + Bcenter.x * Barea + Ccenter.x * Carea) / Totarea,
      (Acenter.y * Aarea + Bcenter.y * Barea + Ccenter.y * Carea) / Totarea
    ); 
  }
}


