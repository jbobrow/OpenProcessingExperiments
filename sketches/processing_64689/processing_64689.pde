
class Poly {
  UVec3 v[];
  int col;

  Poly(UVec3 v1, UVec3 v2, UVec3 v3) {
    v=new UVec3[3];
    v[0]=v1;
    v[1]=v2;
    v[2]=v3;

    initColors();
  }

  public void initColors() {
    col=colors.getRandomColor();
    
//    if(random(100)>75) 
      col=colors.adjustBrightness(col,
        (random(100)>66 ? random(0.5,0.8) : random(1.5,2)));
  }
  
  public void draw() {
    fill(col);
    if(brightness(col)<100) stroke(255,200);
    else stroke(0,200);
    
    noStroke();
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
    UVec3 vv,vv2,vv3;
    Poly p[];
    
    // random center point
    if(subdiv==0) {
      p=new Poly[3];
      vv=calcRandomPoint();
      p[0]=new Poly(v[0], vv, v[1]);
      p[1]=new Poly(v[1], v[2], vv);
      p[2]=new Poly(v[2], v[0], vv);
      return p;
    }

    // mid-edge subdivision rule
    if(subdiv==1) {
      p=new Poly[4];
      int id=0;
      float randOffs=0.1;
      vv=UVec3.interpolate(v[id],v[((id++)+1)%3],
        random(-1,1)*randOffs+0.5); // mid-point offset
      vv2=UVec3.interpolate(v[id],v[((id++)+1)%3],
        random(-1,1)*randOffs+0.5); // mid-point offset
      vv3=UVec3.interpolate(v[id],v[(id+1)%3],
        random(-1,1)*randOffs+0.5); // mid-point offset
      p[0]=new Poly(v[0], vv, vv3);
      p[1]=new Poly(vv,v[1], vv2);
      p[2]=new Poly(v[2], vv2, vv3);
      p[3]=new Poly(vv, vv2, vv3);
      return p;
    }
    
    // halving strategy
    int id=(int)random(3);
    vv=UVec3.interpolate(v[id],v[(id+1)%3],0.5);
    p=new Poly[2];
    p[0]=new Poly(v[id], vv, v[(id+2)%3]);
    p[1]=new Poly(v[(id+1)%3], v[(id+2)%3], vv);
//    p[2]=new Poly(v[2], v[0], vv);
    return p;
  }
}


