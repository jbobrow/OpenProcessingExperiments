
class AABB
{
  Vector2 vOrg = new Vector2();
  Vector2 vExt = new Vector2();
  
  AABB( float x0, float y0, float x1, float y1 )
  {
      vOrg.setXY( x0, y0 );
      vExt.setXY( x1, y1 );
  }
  
  boolean Collide( Vector2 vPos, Vector2 vVel, float fRad )
  {
    // Create the sides in clockwise order
    Line2D sides[] = new Line2D[4];
    Line2D top     = sides[0] = new Line2D( vOrg.x - fRad, vOrg.y - fRad, vExt.x + fRad, vOrg.y - fRad );
    Line2D left    = sides[1] = new Line2D( vExt.x + fRad, vOrg.y - fRad, vExt.x + fRad, vExt.y + fRad );
    Line2D bottom  = sides[2] = new Line2D( vExt.x + fRad, vExt.y + fRad, vOrg.x - fRad, vExt.y + fRad );
    Line2D right   = sides[3] = new Line2D( vOrg.x - fRad, vExt.y + fRad, vOrg.x - fRad, vOrg.y - fRad );
    
    // Get the next position
    Vector2 vNext = vPos.add(vVel);
    
    // Trivially reject if the next position is not inside the extended bounds
    for( int i=0; i<sides.length; ++i )
      if( sides[i].PointInside(vNext) )
        return false;
    
    // Find which side to resolve the collision with
    int nSide = sides.length;
    for( int i=0; i<sides.length; ++i )
    {
      if( sides[i].PointInside(vPos) )
      {
        nSide = i;
        break;
      }
    }
    if( nSide == sides.length )
      return false;

    // Get the normal from the collision side
    Vector2 vNormal = sides[nSide].Normal();
    
    // Reverse the velocity vector
    vVel.mulMe(-1);
    
    // Calculate the half reflection vector
    //  we do this by projecting the reflected velocity onto the normal (normal * dot(normal, velocity))
    //   then subtracting the reflected velocity from that.
    Vector2 halfV = vNormal.mul( vNormal.dot(vVel) ).sub(vVel);
    
    // Adding two of these half vectors to the reversed velocity gives
    //  us a bounc reflection vector
    vVel.inc(halfV);
    vVel.inc(halfV);
    
    // Projecting the bounce velocity onto the tangent vector gives us a new
    //  sliding velocity
    vVel.setXY( sides[nSide].vDir.mul( sides[nSide].vDir.dot(vVel) ) );
    
    return true;
  }
}

