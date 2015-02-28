
class SubLine {

  Vec3D a; //start point of the line 
  Vec3D b; //end point of the line

  ArrayList <Vec3D> nodes;

  SubLine(Vec3D _a, Vec3D _b) {

    a= _a;
    b = _b;


    nodes = new ArrayList <Vec3D> ();

    subDiv(sub_n);
    strokeWeight(0.5);
  }

//subdivide the line 
  void subDiv(int number){
    for (int i = 0; i <= number; i++) {

      float portion = map(i, 0, number, 0, 1);
      Vec3D v = vecOnPor(a, b, portion);
      nodes.add(v);
    }
  }

//define the subdivision
  Vec3D vecOnPor(Vec3D v1, Vec3D v2, float portion){

    Vec3D dif = v2.sub(v1);
    float d = dif.magnitude();

    dif.normalize();
    dif.scaleSelf(d*portion);

    dif.addSelf(v1);

    return dif;
  }
}


