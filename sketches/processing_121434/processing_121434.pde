


class Comp {
  Vec3D v1;
  Vec3D v2;
  Vec3D v3;

  //PApplet p5;

  //------------------------------------------------------

  Comp(Vec3D _v1, Vec3D _v2, Vec3D _v3) {
    this.v1= _v1;
    this.v2= _v2;
    this.v3= _v3;
  } 

  //------------------------------------------------------

  void run() {

    switch (cType) {
    case 0: 
      drawComponent(50);
      break;
    case 1: 
      drawPyramid(50);
      break;
    case 2:
      drawFace();
      break;
    }
  }

  //------------------------------------------------------

  void drawFace() {
    mesh.addFace(v1, v2, v3);
  }

  //------------------------------------------------------

  void drawPyramid(float sc) {
    Vec3D vPick= getPickPt(v1, v2, v3, sc);

    mesh.addFace(v1, v2, vPick);
    mesh.addFace(v2, v3, vPick);
    mesh.addFace(v3, v1, vPick);
  }

  //------------------------------------------------------

  void drawComponent(float sc) {

    Vec3D a= new Vec3D();
    a.addSelf(v2);
    a.subSelf(v1);
    a.scaleSelf(1/3f);
    a.addSelf(v1);

    Vec3D b = new Vec3D();
    b.addSelf(v2);
    b.subSelf(v1);
    b.scaleSelf(2/3f);
    b.addSelf(v1);

    Vec3D c = new Vec3D();
    c.addSelf(v3);
    c.subSelf(v2);
    c.scaleSelf(1/3f);
    c.addSelf(v2);

    Vec3D d = new Vec3D();
    d.addSelf(v3);
    d.subSelf(v2);
    d.scaleSelf(2/3f);
    d.addSelf(v2);

    Vec3D e= new Vec3D();
    e.addSelf(v1);
    e.subSelf(v3);
    e.scaleSelf(1/3f);
    e.addSelf(v3);

    Vec3D f= new Vec3D();
    f.addSelf(v1);
    f.subSelf(v3);
    f.scaleSelf(2/3f);
    f.addSelf(v3);

    Vec3D vPick= getPickPt(v1, v2, v3, sc);

    mesh.addFace(a, b, vPick);
    mesh.addFace(b, c, vPick);
    mesh.addFace(c, d, vPick);
    mesh.addFace(d, e, vPick);
    mesh.addFace(e, f, vPick);
    mesh.addFace(f, a, vPick);
  }

  //------------------------------------------------------

  Vec3D getPickPt(Vec3D a, Vec3D b, Vec3D c, float h) {
    Vec3D vPick= new Vec3D (0, 0, 0);
    vPick.addSelf(a);
    vPick.addSelf(b);
    vPick.addSelf(c);
    vPick.scaleSelf(1/3f);

    //Vec3D Dir= new Vec3D(0,0,h);
    Vec3D Dir= getNormalVector(a, b, c);
    Dir.scaleSelf(h);
    vPick.addSelf(Dir);

    return vPick;
  }

  //------------------------------------------------------

  Vec3D getNormalVector(Vec3D a, Vec3D b, Vec3D c) {
    Vec3D nor= new Vec3D (0, 0, 0);

    Vec3D dif1= new Vec3D(0, 0, 0);
    dif1.addSelf(b);
    dif1.subSelf(a);
    dif1.normalize();

    Vec3D dif2= new Vec3D(0, 0, 0);
    dif2.addSelf(c);
    dif2.subSelf(a);
    dif2.normalize();

    nor= dif1.cross(dif2);
    nor.normalize();

    return nor;
  }

  //------------------------------------------------------
}


