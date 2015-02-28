
//Segment to Circle
//An example of an util class to calculate distances, closest points and intersections between line segments and circles
//Ale Gonzalez, 2014

int
  W = 700,
  H = 700,
  w = W/2,
  h = H/2,
  px    = 100, 
  py    = 100,
  rad   = 100,
  diam  = rad*2,
  mdiam = 10,
  sd = 0;

final boolean STUDY= true, SKETCH = false;
boolean mode = STUDY;

PVector[] segments;

void setup()
{
  size(W, H);
  noFill();
  stroke(0,25);
  background(-1);
  segments = new PVector[200];
}

void draw()
{
  if (mode==STUDY)
  {
      background(-1);
      stroke(0, 125);
      line(px, py, mouseX, mouseY);
      noFill();
      ellipse(w, h, diam, diam);
      noStroke();
      fill(0, 125);     
      PVector closest = LineToCircle.getClosestPointToCenter(px, py, mouseX, mouseY, w, h, rad);
      ellipse(closest.x, closest.y, mdiam, mdiam);
      noFill();
      stroke(#AF9E61);
      float d = 2*LineToCircle.distanceToCircle(px, py, mouseX, mouseY, w, h, rad);
      ellipse(closest.x, closest.y, d, d);
      PVector[] intPoints = LineToCircle.intersect(px, py, mouseX, mouseY, w, h, rad);
      if(intPoints != null) {
          fill(-1); 
          ellipse(intPoints[0].x, intPoints[0].y, mdiam, mdiam);
          if (intPoints[1] != null)
              ellipse(intPoints[1].x, intPoints[1].y, mdiam, mdiam);
      }
  }
  else if (mode==SKETCH) 
  {
      noFill();
      stroke  (0x25000000);
      for (int i=0; i<segments.length; i+=2) {
          sd = (pmouseY-mouseY) * 4;
          PVector[] intPoints = LineToCircle.intersect(segments[i].x, segments[i].y, segments[i+1].x, segments[i+1].y, mouseX, mouseY, sd);
          sd = mouseX-pmouseX;
          if(intPoints != null) { 
            ellipse(intPoints[0].x, intPoints[0].y, sd, sd);
              if (intPoints[1] != null)
            ellipse(intPoints[1].x, intPoints[1].y, sd, sd);
        }
      }
  }
}

void mouseDragged()
{
  px += mouseX-pmouseX;
  py += mouseY-pmouseY;  
}

void keyPressed()
{
  mode = !mode;  
  background(-1); 
  if (mode==SKETCH) for (int i=0; i<segments.length; i++) segments[i] = new PVector(random(W), random(H));
}

/**
 * A useful class to intersect lines and circles or to gest the closest point to a circle in a given segment 
 * 
 * @author      Ale GonzÃ�ï¿½Ã�Â¡lez
 */

static class LineToCircle
{
  
    static float distanceToCircle(float x1, float y1, float x2, float y2, float cx, float cy, float r)
    {
        PVector closest = getClosestPointToCenter(x1, y1, x2, y2, cx, cy, r);
        float d = abs(sqrt((closest.x - cx)*(closest.x - cx) + (closest.y - cy)*(closest.y - cy)) - r); 
        return d;
    }  
    
    static float distanceToCenter(float x1, float y1, float x2, float y2, float cx, float cy, float r)
    {
        PVector closest = getClosestPointToCenter(x1, y1, x2, y2, cx, cy, r);
        float d = sqrt((closest.x - cx)*(closest.x - cx) + (closest.y - cy)*(closest.y - cy));
        return d; 
    } 
    
    static float squaredDistanceToCircle(float x1, float y1, float x2, float y2, float cx, float cy, float r)
    {
        float d = distanceToCircle(x1, y1, x2, y2, cx, cy, r);
        return d*d;
    } 
    
    static float squaredDistanceToCenter(float x1, float y1, float x2, float y2, float cx, float cy, float r)
    {
        PVector closest = getClosestPointToCenter(x1, y1, x2, y2, cx, cy, r);
        float d = (closest.x - cx)*(closest.x - cx) + (closest.y - cy)*(closest.y - cy);
        return d; 
    } 
    
    static PVector getClosestPointToCenter(float x1, float y1, float x2, float y2, float cx, float cy, float r)
    {
        float 
          dx = x2-x1, 
          dy = y2-y1,
          sLength = sqrt(dx*dx + dy*dy),
          sx = dx/sLength,
          sy = dy/sLength,  
          pLength = (cx-x1)*sx + (cy-y1)*sy;  
          
        if (pLength < 0)       
            return new PVector(x1, y1); 
        else if (pLength > sLength) 
            return new PVector(x2, y2);
        
        return new PVector(x1 + sx*pLength, y1 + sy * pLength);        
    }
    
    static PVector[] intersect(float x1, float y1, float x2, float y2, float cx, float cy, float r)
    {
        float sqR = r*r;
        //Check if segment extremes are inside the circle
        boolean 
          oneInside = (cx-x1)*(cx-x1)+(cy-y1)*(cy-y1) < sqR,
          twoInside = (cx-x2)*(cx-x2)+(cy-y2)*(cy-y2) < sqR;
        
        //If segment is inside the circle there is no intersection
        if(oneInside && twoInside) return null;
    
        //Get a normalized vector (sx, sy) in the direction of the segment and its magnitude (sLength)
        float 
          dx = x2-x1, 
          dy = y2-y1,
          sLength = sqrt(dx*dx + dy*dy),
          sx = dx/sLength,
          sy = dy/sLength;    
  
        //Calculate the length of the projected line (pLength) connecting the origin 
        // of the segment (x1, y1) to the center of the circle (cx, cy) using dot product
        float pLength = (cx-x1)*sx + (cy-y1)*sy;
            
        //Check if closest point in the segment is one of the segment extremes and if there is intersection in that case  
        if ((pLength < 0 && !oneInside) || (pLength > sLength && !twoInside)) return null;
        
        //Else, closest point is between both extremes
        //If distance from this point to center is bigger than radius there is no intersection
        float 
          x = x1 + sx * pLength, 
          y = y1 + sy * pLength,
          d = sqR - ((x-cx)*(x-cx) + (y-cy)*(y-cy));        
        if (d < 0) return null;    
        
        //Calculate distance from this point to intersection points (applying Pythagoras theorem)
        d = sqrt(d);  
        //Calculate intersection points
        if (oneInside)
            return new PVector[]{new PVector(x+sx*d, y+sy*d), null};
        if (twoInside)
            return new PVector[]{new PVector(x-sx*d, y-sy*d), null};
        //else
            return new PVector[]{new PVector(x+sx*d, y+sy*d), new PVector(x-sx*d, y-sy*d)};
    }    
}



//Giving style to the canvas
parent.document.getElementById("appletAjaxContainer").setAttribute("style", "border: 5px white solid !important; padding: 0; box-shadow: 0 0 5px #000; margin: 10px 0;");

