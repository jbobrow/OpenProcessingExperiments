
//Calculates the intersection point between two line segments
//Port of Paul Bourke's C implementation of a basic algebra method

static class LineIntersector {
  
  //Epsilon value to perform accurate floating-point arithmetics
  static final float e = 1e-5;

  //Check intersection and calculates intersection point, storing it in a reference passed to the method
  static boolean intersect (float a_x1, float a_y1, float a_x2, float a_y2, 
                            float b_x1, float b_y1, float b_x2, float b_y2, 
                            PVector p) 
  { 
    //Check if lines are parallel
    float d  = ( (b_y2 - b_y1) * (a_x2 - a_x1) ) - ( (b_x2 - b_x1) * (a_y2 - a_y1) );
    if ( abs(d)<e ) return false;    
    
    //Check if lines intersect
    float na, nb, ma, mb;
    na = ( (b_x2 - b_x1) * (a_y1 - b_y1) ) - ( (b_y2 - b_y1) * (a_x1 - b_x1) );
    nb = ( (a_x2 - a_x1) * (a_y1 - b_y1) ) - ( (a_y2 - a_y1) * (a_x1 - b_x1) );
    ma = na/d;
    mb = nb/d;
    if ( ma<0 || ma>1 || mb<0 || mb>1) return false;
    p.x = a_x1 + ( ma * (a_x2 - a_x1));
    p.y = a_y1 + ( ma * (a_y2 - a_y1));
    return true;
  }

  //We know both lines intersect, so don't check anything, only calculate the intersection point
  static PVector simpleIntersect (float a_x1, float a_y1, float a_x2, float a_y2, 
                                  float b_x1, float b_y1, float b_x2, float b_y2) 
  { 
    float 
    na = ( (b_x2 - b_x1) * (a_y1 - b_y1) ) - ( (b_y2 - b_y1) * (a_x1 - b_x1) ),
    d  = ( (b_y2 - b_y1) * (a_x2 - a_x1) ) - ( (b_x2 - b_x1) * (a_y2 - a_y1) ),
    ma = na/d;
    return new PVector (a_x1 + ( ma * (a_x2 - a_x1)), a_y1 + ( ma * (a_y2 - a_y1)));
  }
}


