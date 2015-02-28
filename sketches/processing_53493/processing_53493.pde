
//this is part of toxi's "box fluid demo" modified for purposes of extracting vertex colors from volumetric color data

void drawFilledMesh() {
  noStroke();
  int num=mesh.getNumFaces();
  mesh.computeVertexNormals();
  beginShape(TRIANGLES);
  for (int i=0; i<num; i++) {
    Face f=mesh.faces.get(i);
    fill(colors[(int)map(f.a.x, -scs/2, scs/2, 0, dimX)][(int)map(f.a.y, -scs, scs, 0, dimY)][(int)map(f.a.z, -scs/2, scs/2, 0, dimZ)]);
    normal(f.a.normal);
    vertex(f.a);
    fill(colors[(int)map(f.b.x, -scs/2, scs/2, 0, dimX)][(int)map(f.b.y, -scs, scs, 0, dimY)][(int)map(f.b.z, -scs/2, scs/2, 0, dimZ)]);
    normal(f.b.normal);
    vertex(f.b);
    fill(colors[(int)map(f.c.x, -scs/2, scs/2, 0, dimX)][(int)map(f.c.y, -scs, scs, 0, dimY)][(int)map(f.c.z, -scs/2, scs/2, 0, dimZ)]);
    normal(f.c.normal);
    vertex(f.c);
  }
  endShape();
}


void normal(Vec3D v) {
  normal(v.x, v.y, v.z);
}

void vertex(Vec3D v) {
  vertex(v.x, v.y, v.z);
}

void vertex(Vec3D v, float _u, float _v) {
  vertex(v.x, v.y, v.z, _u, _v);
}


