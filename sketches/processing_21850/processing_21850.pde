


class Face {


  Vec3D a;
  Vec3D b;
  Vec3D c;

  Face(Vec3D _a,Vec3D _b,Vec3D _c) {
    a = _a;
    b = _b;
    c = _c;
  }


  void run() {

    float period = 1000;
    float amplitude = 4;
    int ite = int(amplitude * cos(TWO_PI * frameCount / period))+4;


    iterate(a,b,c, ite);
  }


  void iterate(Vec3D v1, Vec3D v2,Vec3D v3,int gens) {



    //Vec3D cen = calcCentroid(v1,v2,v3);

    Vec3D cen = calcCentroid2(v1,v2,v3);


    Vec3D nor = calcNormal(v1,v2,v3);

    float len = calcLen(v1,v2,v3);

    Vec3D dispPt = drawVector(cen, nor, len/30);


    if( gens == 0) {
      display(v1, v2, v3);
    }

    if( gens > 0) {

      iterate(v1, v2, dispPt, gens-1); 
      iterate(v2, v3, dispPt, gens-1); 
      iterate(v3, v1, dispPt, gens-1);
    }
  }



  float calcLen(Vec3D v1, Vec3D v2, Vec3D v3) {

    float len = 0;

    Vec3D dif1 = v1.sub(v2);
    Vec3D dif2 = v2.sub(v3);
    Vec3D dif3 = v3.sub(v1);

    float m1 = dif1.magnitude();
    float m2 = dif2.magnitude();
    float m3 = dif3.magnitude();

    len = m1 + m2 + m3;


    return len;
  }




  Vec3D drawVector (Vec3D p, Vec3D v, float sca) {

    Vec3D vec = v.copy();
    vec.normalize();
    vec.scaleSelf(sca);

    vec.addSelf(p);

    stroke(255,0,0);
    //vLine(p,vec);

    return vec;
  }

  void vLine(Vec3D v1, Vec3D v2) {
    line(v1.x,v1.y, v1.z,v2.x,v2.y,v2.z );
  }


  Vec3D calcCentroid2(Vec3D v1, Vec3D v2, Vec3D v3) {

    Vec3D md1 = mdPt(v1,v2);
    Vec3D md2 = mdPt(v2,v3);
    Vec3D md3 = mdPt(v3,v1);

    //vLine(v1, md2);

    Vec3D sub1 = md1.sub(v3);
    //float m1 = sub1.magnitude();
    //sub1.normalize();
    sub1.scaleSelf(1);
    sub1.addSelf(md1);

    Vec3D sub2 = md2.sub(v1);
    sub2.scaleSelf(1);
    sub2.addSelf(md2);

    Vec3D sub3 = md3.sub(v2);
    sub3.scaleSelf(1);
    sub3.addSelf(md3);


    Vec3D sum  = new Vec3D();
    sum.addSelf(sub1);
    sum.addSelf(sub2);
    sum.addSelf(sub3);

    sum.scaleSelf(1.0/3.0);

    //vPt(sum);

    return sum;
  }

  Vec3D mdPt(Vec3D v1, Vec3D v2) {

    Vec3D md1 = v2.sub(v1);
    md1.scaleSelf(1.0/2);
    md1.addSelf(v1);

    //stroke(0,0,255);
    //strokeWeight(5);
    //vPt(md1);

    return md1;
  }

  Vec3D calcNormal(Vec3D v1, Vec3D v2, Vec3D v3) {

    Vec3D dif1 = v1.sub(v2);
    dif1.normalize();
    Vec3D dif2 = v1.sub(v3);
    dif2.normalize();

    Vec3D cros = dif1.cross(dif2);
    cros.normalize();

    return cros;
  }



  Vec3D calcCentroid(Vec3D v1, Vec3D v2, Vec3D v3) {
    Vec3D sum = v1.add(v2);
    sum.addSelf(v3);

    sum.scaleSelf(1.0/3.0);

    stroke(255,0,0);
    // strokeWeight(5);
    //vPt(sum);

    return sum;
  }


  void display(Vec3D v1, Vec3D v2, Vec3D v3) {

    stroke(255,90);
    fill(0,255,170,80);
    beginShape();
    vex(v1);
    vex(v2);
    vex(v3);
    vex(v1);
    endShape();
  }

  void vPt(Vec3D v) {
    point(v.x,v.y,v.z);
  }

  void vex(Vec3D v) {
    vertex(v.x,v.y,v.z);
  }
}


