
// Interpolate and smooth a list of points using a bezier spline

class BezierCurve
{
  public int nbSteps;  // Subdivision level
  protected Vector<PVector> points;  // Points off the bezier spline
  private float[] binomials;  // For precomputation
  
  BezierCurve()
  {
    points = new Vector<PVector>();
    nbSteps = 4;  // 4 points will be created between each pair of control points
  }
  
  // Computation of binomial coefficients using the Pascal's triangle
  private void prepareBinomials(int n) {
    if(binomials!=null && binomials.length == n+1) return;
    binomials = new float[n+1];
    binomials[0] = 1;
    for(int i=1; i<=n; i++)
    {
      binomials[i] = 1;
      for(int j = i-1; j>0; j--)
        binomials[j] += binomials[j-1];
    }
  }
  
  // Bernstein basis polynomials (could also store these if we wanted to squeeze more fps)
  private float bernstein(int i, int n, float t) { 
    return binomials[i] * pow(t, i) * pow(1-t, n-i); 
  }
  
  Vector<PVector> getPoints() { return points; }
  
  void update(Vector<PVector> controlPts)
  {
    int nbControlPts = controlPts.size();
    prepareBinomials(nbControlPts-1);
    
    // Updating the size of the array (yep, this is ugly, I am a C++ developper and have no idea how to do that)
    int nbPoints = (nbControlPts - 1) * nbSteps + 1;
    while(nbPoints > points.size()) points.add(new PVector());
    while(nbPoints < points.size()) points.remove(points.size() - 1);
    
    // Computation of the bezier curve
    float s = 1.0 / (float)(nbPoints - 1);
    for(int i=0; i<nbPoints; i++) {
      float t = i * s;
      float x = 0, y = 0;
      for(int j=0; j<nbControlPts; j++) {
        PVector tp = controlPts.get(j);
        float f = bernstein(j, nbControlPts-1, t);
        x += f * tp.x; y += f * tp.y;
      }
      PVector p = points.get(i);
      p.set(x, y, 0);
    }
  }
}

