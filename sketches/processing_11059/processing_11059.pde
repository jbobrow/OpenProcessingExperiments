
//
//  Curve manipulation library
//
PVector[] curveResizeTo( PVector[] pts, int newSize)
{
  assert( newSize > pts.length);
  PVector[] r = new PVector[newSize];
  float numPtsAdd = (float)(newSize-3)/(float)(pts.length-3);
  float ptIdx= 0.;
  int cnt=0;
  r[cnt++]= pts[0];
  for (int i = 1; i < pts.length-2; i++) 
  {
    ptIdx += numPtsAdd;
    int numAddSeg = (int)floor(ptIdx);
    for (int j=0; j < numAddSeg; j++)
    {
      float t = (float)j/(float)(numAddSeg);
      r[cnt++] = curveCatmulRom( t,  pts[i-1],pts[i], pts[i+1], pts[i+2] );
    }
    ptIdx -= floor(ptIdx);
  }
  if ( ptIdx > 0.9f)
  {
    r[cnt++] =  pts[pts.length-2];
    ptIdx -= 1.0f;
  }
   r[cnt++]= pts[pts.length-2];
   r[cnt++]= pts[pts.length-1];
  assert( cnt == newSize);
  assert( ptIdx < 0.001f);
  return r;
}
PVector[] curveBlend( PVector[] pts1, PVector[] pts2, float t )
{
   if ( pts1.length > pts2.length)
   {
     pts2 = curveResizeTo( pts2, pts1.length);
   }
   if ( pts2.length > pts1.length)
   {
     pts1 = curveResizeTo( pts1, pts2.length);
   } 
   assert( pts1.length == pts2.length);
   PVector[] r = new PVector[pts1.length];
   for (int i =0; i < pts1.length;i++)
   {
     r[i] = new PVector(lerp(pts1[i].x,pts2[i].x,t),
                         lerp(pts1[i].y,pts2[i].y,t),
                         lerp(pts1[i].z,pts2[i].z,t));
   }
   return r;
}
  
PVector[] curveSortOnY( PVector[] pts)
{
  float maxY = -1000.0f;
   PVector[] res = new PVector[pts.length];
    for (int i = 0; i < pts.length; i++)
    {
      PVector minPt = null;
      float minY = 10000.0f;
   
      for (PVector p: pts) {
          if ( p.y<minY && p.y > maxY ){
             minPt = p;
             minY = p.y;
         }
      }      
      maxY =minY;
      res[i] = minPt;
    }
    return res;
}

PVector[] curveCalcNormals( PVector[] pts)
{
    assert( pts.length>=2);
    PVector[] normals = new PVector[pts.length];
    if ( pts.length<2)
      return normals;
     
     for (int i =1;i<pts.length-1;i++) // compute 2D normal
     {
        normals[i] = new PVector( (pts[i-1].y - pts[i+1].y),(pts[i-1].x - pts[i+1].x),0.0f);
        normals[i].normalize();
     }
     normals[0]= new PVector( (pts[0].y - pts[1].y),(pts[0].x - pts[1].x),0.0f);
     normals[0].normalize();
   
     int e = pts.length-1;
     
     normals[e]= new PVector((pts[e-1].y - pts[e].y),(pts[e-1].x - pts[e].x),0.0f);
     normals[e].normalize();
     return normals;
}
PVector lerp( PVector c1, PVector c2, float t )
{
  return new PVector( lerp(c1.x,c2.x,t), lerp(c1.y,c2.y,t),lerp(c1.z,c2.z,t));
}
PVector  curveCatmulRom( float t, PVector x1,PVector x2, PVector x3, PVector x4 )
{
   PVector p = new PVector();
   p.x = curveCatmulRom( t, x1.x, x2.x, x3.x, x4.x );
   p.y = curveCatmulRom( t, x1.y, x2.y, x3.y, x4.y );
   p.z = curveCatmulRom( t, x1.z, x2.z, x3.z, x4.z );
   return p;
}
float  curveCatmulRom( float t, float x1,float x2, float x3, float x4 )
{
    float t2 =t*t;
    float t3 = t*t2;
    return 1./2.*( (-t + 2.*t2 - t3)*x1  +
              (2 -5*t2 + 3 * t3)*x2 +
             (t+4*t2 -3*t3) *x3 +
             (-t2+t3)*x4 );
}
PVector[] curveSubdividePoints( PVector[] pts, int numSubdivs) {
   assert( pts.length>=4);
   assert( numSubdivs >=1);
   
   int numpoints = ((pts.length-3)*numSubdivs) +1;
   assert( numpoints >=2);
   PVector[] np = new PVector[ numpoints];
   int idx = 0;
  
   for (int i =1;i<pts.length-2;i++)
   {
     for (int j=0;j<numSubdivs;j++)
     {
       float t = (float)j/(float)numSubdivs;
       np[idx++]= curveCatmulRom(  t, pts[i-1],pts[i], pts[i+1], pts[i+2] );
     }
   }
   np[idx]= new PVector();
   np[idx++].set(pts[ pts.length-2]);
   assert( idx == numpoints);
   return np;
}

PVector[] curveUnpack( float[] pts)
{
  assert( pts.length >= 8);
  assert( pts.length%2 == 0);
  PVector[] r = new PVector[pts.length/2];
  for(int i=0; i < r.length; i++)
    r[i] = new PVector( pts[i*2], pts[i*2+1], 1.0f);
   
  return r;
}

