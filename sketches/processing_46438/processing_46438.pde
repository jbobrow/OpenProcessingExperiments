
SimplexNoise simplex = new SimplexNoise();

class SphericalSpline
{
  ArrayList<Vec3D> unjitteredControls;
  ArrayList<Vec3D> unjitteredForwardTangents;
  float radius;
  int nControls;
  float xNoiseOff = random(1000);
  float yNoiseOff = random(1000);
  float zNoiseOff = random(1000);
  
  SphericalSpline(int n, float thetaRatio, float r, Matrix4x4 m)
  {
    radius = r;
    float handleTheta = max(0, min(thetaRatio * TWO_PI / n, PI / 2 - 0.1));
    nControls = n;
    setVectorArrays(thetaRatio, m);
  }
  
  private void setVectorArrays(float thetaRatio, Matrix4x4 matrix)
  {
    unjitteredControls = AngularSpread(nControls, 0, 1.0, matrix);
    float thetaHandles = thetaRatio * TWO_PI / nControls;
    float handleScale = 1 / cos(thetaHandles);
    unjitteredForwardTangents = AngularSpread(nControls, thetaHandles, handleScale, matrix);
  }
  
  private ArrayList<Vec3D> AngularSpread(int n, float thetaOffset, float fScale, Matrix4x4 matrix)
  {
    ArrayList<Vec3D> ptReturn = new ArrayList<Vec3D>(n);
    
    for (int i = 0; i < n; i++)
    {
      float theta = TWO_PI * i / n + thetaOffset;
      float xNorm = cos(theta) * fScale;
      float yNorm = sin(theta) * fScale;
      Vec3D v = new Vec3D(xNorm, yNorm, 0.0);
      ptReturn.add(matrix.applyTo(v));
    }
    return ptReturn;
  }
  
  private ArrayList<Vec3D> jitterAndScale(ArrayList<Vec3D> vectors, float scale, float wNoise, float jitter)
  {
    ArrayList<Vec3D> ptReturn = new ArrayList<Vec3D>(vectors.size());
    for(Vec3D vec : vectors)
    {
      ptReturn.add(vec.scale(scale).addSelf(new Vec3D(
        (float)simplex.noise(vec.x + xNoiseOff, vec.y + yNoiseOff, wNoise + zNoiseOff) * jitter,
        (float)simplex.noise(vec.x + xNoiseOff, vec.y + yNoiseOff, wNoise + zNoiseOff) * jitter,
        (float)simplex.noise(vec.x + xNoiseOff, vec.y + yNoiseOff, wNoise + zNoiseOff) * jitter)));
    }
    return ptReturn;
  }
  
  ArrayList<Vec3D> Spread(int n, float w, boolean fNormalize, float jitter)
  {
    ArrayList<Vec3D> jitteredControls = jitterAndScale(unjitteredControls, radius, w, jitter);
    ArrayList<Vec3D> jitteredForwardTangents = jitterAndScale(unjitteredForwardTangents, radius, w, jitter);
    
    ArrayList<Vec3D> backHandles = new ArrayList<Vec3D>(n);
    for (int i = 0; i < jitteredControls.size(); i++)
    {
      backHandles.add(jitteredControls.get(i).add(
        jitteredControls.get(i).sub(jitteredForwardTangents.get(i))));
    }
    
    ArrayList<SplineSegment3D> segs = new ArrayList<SplineSegment3D>(nControls);
    
   for (int iSeg = 0; iSeg < nControls; iSeg++)
    {
      int iNext = iSeg == nControls - 1 ? 0 : iSeg + 1;
      
      segs.add(new SplineSegment3D(
        jitteredControls.get(iSeg),
        jitteredControls.get(iNext),
        jitteredForwardTangents.get(iSeg),
        backHandles.get(iNext)));
    }
    
    Spline3D spline = new Spline3D(segs);
    ArrayList<Vec3D> retList = spline.Spread(n);
    
    if (fNormalize)
    {
      for (Vec3D vec : retList)
      {
        vec.normalizeTo(radius);
      }
    }
    
    return retList;
  }
}

