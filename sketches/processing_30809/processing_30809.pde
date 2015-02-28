
import miny.render.BB.*;

//  We do an interpolation across a triangle of the elevation and moisture defined for the vertices, 
//   and compute the corresponding biome for each pixel.
//  Noise can be added to disturb the distribution
public class BiomeTriangle extends Drawable
{
  float fallout;
  miny.render.BB.AABB bb;
  PVector p0, p1, p2;
  PVector u, v;
  float bary0, bary1, bary2;
  float uv, uu, vv, den;
  float e0, e1, e2, m0, m1, m2, c0, c1, c2;
  boolean water, ocean;
  float noiseDist, noiseScale;
  public BiomeTriangle(float fallout, PVector p0, PVector p1, PVector p2, 
    float e0, float e1, float e2, 
    float m0, float m1, float m2, 
    boolean water, boolean ocean,
    boolean c0, boolean c1, boolean c2,
    float noiseDist, float noiseScale)
  { 
     this.fallout=fallout; 
     this.p0=p0; this.p1=p1; this.p2=p2;
     this.e0=e0; this.e1=e1; this.e2=e2;
     this.m0=m0; this.m1=m1; this.m2=m2;
     this.water=water;
     this.ocean=ocean;
     this.c0=c0?1:0; this.c1=c1?1:0; this.c2=c2?1:0;
     this.noiseDist=noiseDist; this.noiseScale=noiseScale;
    
     float xmin, xmax, ymin, ymax;
     xmin = xmax = p0.x;
     ymin = ymax = p0.y;
     if(p1.x < xmin) xmin = p1.x; if(p1.x > xmax) xmax = p1.x;
     if(p1.y < ymin) ymin = p1.y; if(p1.y > ymax) ymax = p1.y;
     if(p2.x < xmin) xmin = p2.x; if(p2.x > xmax) xmax = p2.x;
     if(p2.y < ymin) ymin = p2.y; if(p2.y > ymax) ymax = p2.y;
     
     bb = new miny.render.BB.AABB(xmin-fallout, ymin-fallout, xmax+fallout, ymax+fallout);
     
     u = PVector.sub(p1, p0); v = PVector.sub(p2, p0);
     uu = u.dot(u); vv = v.dot(v); uv = u.dot(v);
     den = uv * uv - uu * vv;
  }
  
  public BoundingBox getBoundingBox() { return bb; } 
  
  // Test if the point is inside the triangle
  boolean getBarycentricCoordinates(PVector p)
  {
    if(abs(den) < 1e-10) return false;
    PVector w = PVector.sub(p, p0);
    float wu = w.dot(u), wv = w.dot(v);
	
    bary2 = (uv * wu - uu * wv) / den;
    if(bary2 < 0 || bary2 > 1) return false;
    bary1 = (uv * wv - vv * wu) / den;
    if(bary1 < 0 || (bary2 + bary1) > 1) return false;
    
    bary0 = 1.0 - bary2 - bary1;
    
    return true;
  }
  
  // Find the closest vertex or edge
  float distanceFromEdges(PVector p)
  {    
    // First edge : p0-p1
    PVector ve = PVector.sub(p1, p0);
    PVector vp = PVector.sub(p, p0);
    float r = ve.dot(vp) / ve.dot(ve);
    r = constrain(r, 0.0, 1.0);
    PVector tp = PVector.add(p0, PVector.mult(ve, r));
    
    float d = PVector.sub(tp, p).mag();
    bary0 = 1.0-r; bary1 = r; bary2 = 0;

    // Second edge : p0-p2
    ve = PVector.sub(p2, p0);
    r = ve.dot(vp) / ve.dot(ve);
    r = constrain(r, 0.0, 1.0);
    tp = PVector.add(p0, PVector.mult(ve, r));
    
    float td = PVector.sub(tp, p).mag();
    if(td < d) {
      d = td;
      bary0 = 1.0-r; bary1 = 0; bary2 = r;
    }
    
    // Third edge : p1-p2
    ve = PVector.sub(p2, p1);
    vp = PVector.sub(p, p1);
    r = ve.dot(vp) / ve.dot(ve);
    r = constrain(r, 0.0, 1.0);
    tp = PVector.add(p1, PVector.mult(ve, r));
    
    td = PVector.sub(tp, p).mag();
    if(td < d) {
      d = td;
      bary0 = 0; bary1 = 1.0-r; bary2 = r;
    }
    
    return d;
  }
  
  float interpolate(float v0, float v1, float v2) {
    return v0 * bary0 + v1 * bary1 + v2 * bary2;
  }
  
  public color getColor(float x, float y)
  {
    PVector p = new PVector(x, y);
    float d = 0;
    if(!getBarycentricCoordinates(p))
      d = distanceFromEdges(p);
      
    float elevation = interpolate(e0, e1, e2);
    float moisture = interpolate(m0, m1, m2);
    float coast = interpolate(c0, c1, c2);
    // *= 1 + ...
    elevation += noiseDist * (noise(0, y*noiseScale, x*noiseScale) * 2 - 1);
    moisture += noiseDist * (noise(x*noiseScale, 0, y*noiseScale) * 2 - 1);
    coast += noiseDist * (noise(x*noiseScale, y*noiseScale, 0) * 2 - 1);
    color c = map.biomesColor[getBiome(elevation, moisture, water, ocean, coast>0.7)];     
    return RenderUtils.multAlpha(c, 1-RenderUtils.smoothstep(d, 0, fallout));
  }
}


