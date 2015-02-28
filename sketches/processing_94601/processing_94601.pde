

class CubicCurve
{
  PVector getPoint(float t)
  {
    Matrix matrixT = new Matrix();
    matrixT.construct4x1(t*t*t, t*t, t, 1);
    
    PVector v = new PVector();
    v.x = getPoint(matrixT, m_matrixCurve, m_matrixX);
    v.y = getPoint(matrixT, m_matrixCurve, m_matrixY);
    return v;
  }
  
  float getPoint(Matrix t, Matrix curve, Matrix specialPoints)
  {
      Matrix calc = multiply(t, curve);
      Matrix result = multiply(calc, specialPoints);
      return result.m[0][0];
  }
  
  // Constructs a Bezier the regular way - using a start point, two control points, and an end point
  void constructBezier(PVector p_1, PVector p_c1, PVector p_c2, PVector p_2)
  {
    setBezierMatrix();
    
    m_matrixX.construct1x4( p_1.x,
                            p_c1.x,
                            p_c2.x,
                            p_2.x);

    m_matrixY.construct1x4( p_1.y,
                            p_c1.y,
                            p_c2.y,
                            p_2.y);
  }
  
  // Construct a Bezier using four known points on the curve at t = 0, t = t_a, t = t_b, and t = 1 respectively
  void constructBezier(PVector p_1, PVector p_a, PVector p_b, PVector p_2, float t_a, float t_b)
  {
    setBezierMatrix();
    
    PVector sol1 = constructBezier(p_1.x, p_a.x, p_b.x, p_2.x, t_a, t_b);
    PVector sol2 = constructBezier(p_1.y, p_a.y, p_b.y, p_2.y, t_a, t_b);

    m_matrixX.construct4x1(
                      p_1.x,
                      sol1.x,
                      sol1.y,
                      p_2.x);
    
    m_matrixY.construct4x1(
                      p_1.y,
                      sol2.x,
                      sol2.y,
                      p_2.y);
  }
  
  // Construct a Bezier using four known points on the curve at t = 0, t = t_a, t = t_b, and t = 1 respectively
  PVector constructBezier(float p_1, float p_a, float p_b, float p_2, float t_a, float t_b)
  {
    float s_a = 1 - t_a;
    float s_b = 1 - t_b;
    
    Matrix A = new Matrix();
    
    A.construct3x2(  3 * s_a * s_a * t_a,    3 * s_a * t_a * t_a,    p_a - (p_1 * s_a * s_a * s_a) - (p_2 * t_a * t_a * t_a),
                     3 * s_b * s_b * t_b,    3 * s_b * t_b * t_b,    p_b - (p_1 * s_b * s_b * s_b) - (p_2 * t_b * t_b * t_b));
    
    A.eliminate();
   
    return new PVector(A.m[2][0], A.m[2][1]);
  }
  
  // Constructs a Catmull-Rom spline
  void constructCatmullRom(PVector ptPrev, PVector ptStart, PVector ptEnd, PVector ptNext, float tightness)
  {
    setCatmullRomMatrix(tightness);
    
    m_matrixX.construct1x4( ptPrev.x,
                            ptStart.x,
                            ptEnd.x,
                            ptNext.x);

    m_matrixY.construct1x4( ptPrev.y,
                            ptStart.y,
                            ptEnd.y,
                            ptNext.y);
  }
  
  // Constructs a uniform cubic B-spline
  void constructBSpline(PVector ptPrev, PVector ptStart, PVector ptEnd, PVector ptNext, float tightness)
  {
    setBSplineMatrix();
    
    m_matrixX.construct1x4( ptPrev.x,
                            ptStart.x,
                            ptEnd.x,
                            ptNext.x);

    m_matrixY.construct1x4( ptPrev.y,
                            ptStart.y,
                            ptEnd.y,
                            ptNext.y);
  }

  void setBezierMatrix()
  {
    m_matrixCurve.construct4x4( -1,  3, -3, 1,
                                 3, -6,  3, 0,
                                -3,  3,  0, 0,
                                 1,  0,  0, 0);
  }
  
  void setCatmullRomMatrix(float tau)
  {
    m_matrixCurve.construct4x4( -tau, 2-tau,     tau-2,  tau,
                               2*tau, tau-3, 3-(2*tau), -tau,
                                -tau,     0,       tau, 0,
                                   0,     1,         0, 0);
  }

  void setBSplineMatrix()
  {
    m_matrixCurve.construct4x4(-1,  3, -3, 1,
                                3, -6,  3, 0,
                               -3,  0,  3, 0,
                                1,  4,  1, 0);
    
    m_matrixCurve.divideMatrix(6);
  }

  PVector getSpecialPoint(int n)
  {
    return new PVector(m_matrixX.m[n][0], m_matrixY.m[n][0]);
  }

  Matrix m_matrixCurve = new Matrix();
  Matrix m_matrixX = new Matrix();
  Matrix m_matrixY = new Matrix();
};



