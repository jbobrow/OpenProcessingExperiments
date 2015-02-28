
// a filled (non)-uniform rational b-spline surface
// (c) Alasdair Turner 2008
// note: the interpolation is calculated every frame,
// so this is rather slow
// the knots as given form a uniform b-spline, but 
// you can change them to make a non-uniform b-spline

// five by five grid 
float [] u_knots = { 
  0.0, 0.143, 0.286, 0.429, 0.571, 0.714, 0.857, 1.0 };
float [] v_knots = { 
  0.0, 0.167, 0.286, 0.429, 0.571, 0.714, 0.857, 1.0 };

PVector [][] ctrl_pts;

int u_ctrl_pts = 5;
int v_ctrl_pts = 5;

float u_spacing; 
float v_spacing;

void setup()
{
  size(400,400,P3D);

  ctrl_pts = new PVector[u_ctrl_pts][v_ctrl_pts];

  // set up control points in a regular grid on the xz plane with a random height:
  u_spacing = (width / u_ctrl_pts);
  v_spacing = (width / v_ctrl_pts);

  for (int i = 0; i < u_ctrl_pts; i++) {
    for (int j = 0; j < v_ctrl_pts; j++) {
      ctrl_pts[i][j] = new PVector( u_spacing * i, random(0, height), -v_spacing * j);
    }
  }
}

void draw()
{
  background(0);
  lights();
  translate(width/2,height/2,-width/2);
  rotateY(frameCount * 0.01);
  translate(-width/2,-height/2,width/2);
  
  int u_deg = u_knots.length - u_ctrl_pts - 1;
  int v_deg = v_knots.length - v_ctrl_pts - 1;

  // draw surface
  for (float u = u_knots[u_deg]; u <= u_knots[u_knots.length-u_deg-1] - 0.01; u += 0.01) {
    beginShape(QUAD_STRIP);
    for (float v = v_knots[v_deg]; v <= v_knots[v_knots.length-v_deg-1]; v += 0.01) {
      PVector pt_uv = new PVector();
      PVector pt_u1v = new PVector(); // u plus 0.01
      for (int i = 0; i < u_ctrl_pts; i++) {
        for (int j = 0; j < v_ctrl_pts; j++) {
          float basisv = basisn(v,j,v_deg,v_knots);
          float basisu = basisn(u,i,u_deg,u_knots);
          float basisu1 = basisn(u+0.01,i,u_deg,u_knots);
          PVector pk = PVector.mult( ctrl_pts[i][j], basisu * basisv);
          PVector pk1 = PVector.mult( ctrl_pts[i][j], basisu1 * basisv);
          pt_uv.add( pk );
          pt_u1v.add( pk1 );
        }
      }
      noStroke();
      fill( 255 );
      vertex( pt_uv.x, pt_uv.y, pt_uv.z );
      vertex( pt_u1v.x, pt_u1v.y, pt_u1v.z );
    }
    endShape();
  }
}
               
float basisn(float u, int k, int d, float [] knots)
{
  if (d == 0) {
    return basis0(u,k,knots);
  }
  else {
    float b1 = basisn(u,k,d-1,knots) * (u - knots[k]) / (knots[k+d] - knots[k]);
    float b2 = basisn(u,k+1,d-1,knots) * (knots[k+d+1] - u) / (knots[k+d+1] - knots[k+1]);
    return b1 + b2;
  }
}

float basis0(float u, int k, float [] knots)
{
  if (u >= knots[k] && u < knots[k+1]) {
    return 1;
  }
  else {
    return 0;
  }  
}

void mouseClicked()
{
  // randomise the control points
  for (int i = 0; i < u_ctrl_pts; i++) {
    for (int j = 0; j < v_ctrl_pts; j++) {
      ctrl_pts[i][j] = new PVector( u_spacing * i, random(0, height), -v_spacing * j);
    }
  }
}

