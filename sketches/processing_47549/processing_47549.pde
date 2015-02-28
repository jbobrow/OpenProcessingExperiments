

public class face {
  PVector[] vertices;
  PVector[] normals; 
  public face() {
    vertices=null;
  }
  public face(PVector[] vertices) {
    this.vertices=vertices;
  }
  public face(PVector[] vertices, PVector[] normals) {
    this.vertices=vertices;
    this.normals=normals;
  }
  public boolean isEqual(face f) {
    if(f.vertices.length!=vertices.length)
      return false;
    else {
      boolean isIn=false;
      for(int i=0;i<vertices.length;i++) {
        for(int j=0;j<f.vertices.length;j++) {
          isIn=isIn || (f.vertices[i].x==f.vertices[j].x && f.vertices[i].y==f.vertices[j].y && f.vertices[i].z==f.vertices[j].z);
        }
      }
      return isIn;
    }
  }
  public void plotFace() {
    beginShape();
    for(int i=0;i<vertices.length;i++) {
      vertex(vertices[i].x,vertices[i].y,vertices[i].z);
    }
    endShape(CLOSE);
  }
  public void plotPoints() {
    for(int i=0;i<vertices.length;i++)
      point(vertices[i].x,vertices[i].y,vertices[i].z);
  }
  public void plotNormal(float scalingFactor) {
    PVector c=centroid();
    PVector n=faceNormal();
    pushMatrix();
    translate(c.x,c.y,c.z);
    line(0,0,0,n.x*scalingFactor,n.y*scalingFactor,n.z*scalingFactor);
    popMatrix();
  }

  public boolean isContainedInBox(PVector c,float bSize) {
    boolean isContained=true;
    for(int i=0;i<vertices.length;i++) {
      isContained=isContained && (supNorm(c,vertices[i])<=bSize);
    }
    return isContained;
  }
  public float supNorm(PVector p, PVector q) {
    return max(abs(p.x-q.x),max(abs(p.y-q.y),abs(p.z-q.z)));
  }
  boolean lineFaceIntersection(PVector p, PVector d) {
    PVector b=PVector.sub(p,vertices[0]);
    PVector s0=PVector.sub(vertices[1],vertices[0]);
    PVector s1=PVector.sub(vertices[2],vertices[0]);
    PVector s2=PVector.mult(d,-1);

    float D=determinant(new float[][] {
      {
        s0.x,s1.x,s2.x
      }
      ,
      {
        s0.y,s1.y,s2.y
      }
      ,
      {
        s0.z,s1.z,s2.z
      }
    }
    );
    float Du=determinant(new float[][] {
      {
        b.x,s1.x,s2.x
      }
      ,
      {
        b.y,s1.y,s2.y
      }
      ,
      {
        b.z,s1.z,s2.z
      }
    }
    );
    float Dv=determinant(new float[][] {
      {
        s0.x,b.x,s2.x
      }
      ,
      {
        s0.y,b.y,s2.y
      }
      ,
      {
        s0.z,b.z,s2.z
      }
    }
    );
    float Dt=determinant(new float[][] {
      {
        s0.x,s1.x,b.x
      }
      ,
      {
        s0.y,s1.y,b.y
      }
      ,
      {
        s0.z,s1.z,b.z
      }
    }
    );
    if(D==0)
      return false;
    else {
      float t=Dt/D;
      float v=Dv/D;
      float u=Du/D;
      return u+v<=1 && u>=0 && u<=1 && v>=0 && v<=1 && t>=0;
    }
  }
  float determinant(float[][] m) {
    float Dx=m[1][1]*m[2][2]-m[1][2]*m[2][1];
    float Dy=m[1][0]*m[2][2]-m[2][0]*m[1][2];
    float Dz=m[1][0]*m[2][1]-m[1][1]*m[2][0];
    return m[0][0]*Dx-m[0][1]*Dy+m[0][2]*Dz;
  }
  public PVector centroid() {
    PVector c=new PVector(0,0,0);
    for(int i=0;i<vertices.length;i++)
      c=PVector.add(c,vertices[i]);
    c.div((float) vertices.length);
    return c;
  }
  public void setNormals(PVector[] normals) {
    this.normals=normals;
  }
  public PVector faceNormal() {
    if(normals==null) {
      PVector s0=PVector.sub(vertices[1],vertices[0]);
      PVector s1=PVector.sub(vertices[2],vertices[0]);
      PVector N=PVector.mult(s1,s0);
      N.normalize();
      return N;
    }
    else {
      PVector n=new PVector(0,0,0);
      for(int i=0;i<normals.length;i++) {
        n=PVector.add(n,normals[i]);
      }
      n.div((float) normals.length);
      return n;
    }
  }
}


