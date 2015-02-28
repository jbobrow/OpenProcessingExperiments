
//Calculates the intersection of two circles, 'a' and 'b', defined by the position of the center ('ax' and 'ay' in the case of 'a' circle) and 
//the radius ('ar', same case). You have to input the vectors to store the positions, here 'intersection_one' and 'intersection_two'
//Based on Paul Bourke's work, of course. ;)

static class CircleIntersector {
  
    static final float E = 1e-4;
  
    static boolean check(float d, float r1, float r2) 
    {
        return !( abs(d-r1-r2)<E || abs(d-abs(r1-r2))<E || (d == 0 && r1 == r2));   
    }
  
    static boolean intersect(float ax, float ay, float ar, float bx, float by, float br, PVector p_1, PVector p_2) 
    {
        float dx = bx-ax,
              dy = by-ay,
              d  = sqrt(dx*dx+dy*dy);
    
        if (check(d, ar, br)) {
            float tmp = ar*ar,
                  w = (tmp-br*br+d*d)/(2*d),
                  h = sqrt(tmp-w*w);
            tmp = w/d;
            float axis_x = ax+(dx*tmp), 
                  axis_y = ay+(dy*tmp);
            tmp = h/d;
            float offset_x = -dy *(tmp), 
                  offset_y =  dx *(tmp); 
                  p_1.x = axis_x+offset_x; 
                  p_1.y = axis_y+offset_y;
                  p_2.x = axis_x-offset_x; 
                  p_2.y = axis_y-offset_y;
             return true;
         } 
         return false;
    }  
}


//A trivial class to handle circles
class Circle 
{
   float x, y, r, d;
  
   Circle (float _x, float _y, float _r) 
   {
     x = _x;
     y = _y;
     r  = _r;
     d  = 2*r;
   } 

   void display() { ellipse (x, y, d, d); } 
   
   void setRadius(float nuR) { r = nuR; d = nuR*2; }
}


//A simple class to generate polygons
static class Polygon 
{        
    //Returns a regular polygon as an array of PVectors 
    static PVector[] create(int sides, float cx, float cy, float radius, float angle) 
    {
        float a = TWO_PI/sides;
        PVector[] vertices = new PVector[sides];
        for (int i=0; i<sides; i++) {
            float currentAngle = angle+(i*a);
            vertices [i] = new PVector (cx + cos(currentAngle)*radius, cy + sin(currentAngle)*radius);  
        }
        return vertices;
    }
}

