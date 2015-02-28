
class Poly {
  UVec3 v[];
  int col;

  Poly(UVec3 v1, UVec3 v2, UVec3 v3) {
    v=new UVec3[3];
    v[0]=v1;
    v[1]=v2;
    v[2]=v3;

    col=color(random(50, 100)+(random(100)>50?185:0));
    if(random(100)>80)
      col=UColorTool.interpolate(random(1),"00FFFF","003366");
    else if(random(100)>80)
      col=UColorTool.interpolate(random(1),"FF6600","FFCC00");
  }

  public void draw() {
    fill(col);
    beginShape(TRIANGLES);
    vertex(v[0].x, v[0].y);
    vertex(v[1].x, v[1].y);
    vertex(v[2].x, v[2].y);
    endShape();
  }

  // calculate random point in triangle, tending towards the
  // center of the triangle surface
  public UVec3 calcRandomPoint() {
    UVec3 vv=UVec3.interpolate(v[1], v[2], UUtil.rnd.random(0.33f, 0.66f));
    vv=UVec3.interpolate(v[0], vv, UUtil.rnd.random(0.33f, 0.66f));
    return vv;
  }

  // subdivide Poly by calculating a random point in the triangle
  // face and using it to produce three new Poly instances
  public Poly[] subdivide() {
    UVec3 vv=calcRandomPoint();
    Poly p[]=new Poly[3];
    p[0]=new Poly(v[0], v[1], vv);
    p[1]=new Poly(v[1], v[2], vv);
    p[2]=new Poly(v[2], v[0], vv);
    return p;
  }
}


