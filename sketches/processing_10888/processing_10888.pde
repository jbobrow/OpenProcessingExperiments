
//############################## Ellipse #####################
//Creates an ellipse and allows points to be projected onto it.
//
class Ellipse
{
  float x;
  float y;
  float z;
  
  float radius;
  
  float scaleX;
  float scaleY;
  float scaleZ;
  
  //############################## CONSTRUCTORS #####################
  //-----------------------------------------
  //Constructs the ellipse - based off a distored sphere.
  //XYZ is the center.
  //Radius is the overall scale.
  //scaleXYZ is the amount to scale the sphere by. 
  //-----------------------------------------
  public Ellipse(float _x, float _y, float _z, float _radius, float _scaleX, float _scaleY, float _scaleZ)
  {
    x = _x;
    y = _y;
    z = _z;
    radius = _radius;
    scaleX = _scaleX;
    scaleY = _scaleY;
    scaleZ = _scaleZ;
  }
  
  //############################## SETS #####################
  //-----------------------------------------  
  // Use to resize ellipse.
  // Adds the passed number to the scale of the ellise. 
  //-----------------------------------------
  public void addX(float _x){scaleX += _x;}
  public void addY(float _y){scaleY += _y;}
  public void addZ(float _z){scaleZ += _z;}
  
  
  
  //############################## GETS #####################
  
  //-----------------------------------------  
  // Returns the radius of the ellipse, and the scales. 
  //-----------------------------------------  
  public float getRadius(){ return radius;}
  public float getX(){ return scaleX;}
  public float getY(){ return scaleY;}
  public float getZ(){ return scaleZ;}
  
  
  
  //-----------------------------------------
  //Projects a point in xyz space onto the ellipse. 
  //
  //Does this by transforming the ellipse into a sphere - also do this to the coordinates of the points.
  //
  //The point is then pojected onto the sphere by projecting it towards the center of the sphere.
  //The projected point is therefore the distance of the radius along the vector that joins 
  //the center of the sphere with the original point.
  //
  //This is a fairly nieve way to do this, but since the points wont be far from the ellipse it does not matter.
  //
  //If the point goes below the base plane (y=0) it is reflected.
  //Returns the new xyz coordinates of the projected point. 
  //-----------------------------------------
  public float[] projectPoint(float pX, float pY, float pZ)
  {
    //first transform point from eliptical space into spherical space
    pX /= scaleX;
    pY /= scaleY;
    pZ /= scaleZ;
    
    //find the vector between the point and the center of the sphere.
    float vX = pX - x;
    float vY = pY - y;
    float vZ = pZ - z;
    
    //normalise the vector.
    float d = sqrt(vX * vX + vY * vY + vZ * vZ);
    float factor = 1/d;
    vX *= factor;
    vY *= factor;
    vZ *= factor;
    
    //scale the vector to the same length of the radius.
    vX *= radius;
    vY *= radius;
    vZ *= radius;
    
    //Point is at end of this vector when it starts from the center of the sphere. 
    float newX = x + vX;
    float newY = y + vY;
    float newZ = z + vZ;
    
    //scale point back into elliptical space
    newX *= scaleX;
    newY *= scaleY;
    newZ *= scaleZ;
    
    //Use this to make sure no points drop below the base plane
    if(newY > 0) newY = -newY;
    
    //return new point
    return new float[]{newX,newY, newZ};
  }
  
  
  //############################## DRAWING #####################
    
  //-----------------------------------------
  // Draws ellipse as a sphere.
  // Only works if xyz scale is 1.
  //-----------------------------------------
  public void draw()
  {
     pushMatrix(); 
      fill(204, 102, 0, 150);
      translate(x, y, z); 
      sphere(radius);
    popMatrix();
  }
}

