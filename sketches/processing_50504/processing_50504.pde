
float timeStep = 1;// seconds
float elementLength = 32;// meters
class node{
  PVector location;
  PVector velocity;
  PVector forceSum;
  float mass = 0;// requires summation from elements
  node(float x,float y,float z){
    location = new PVector(x,y,z);
    velocity = new PVector();
    forceSum = new PVector();
  }
  void update(){
    velocity.add(PVector.mult(forceSum,timeStep/mass));
    forceSum = new PVector();
    location.add(PVector.mult(velocity,timeStep));
//    velocity = new PVector();// nullify velocity i.e. daping=infinity
    velocity.mult(0.99);
  }
}
class material{
  float density;// kg/m^3
  float YoungsModulus;// pascals
  float PoissonsRatio;
  float[][] VoigtStiffness;
  material(float dens,float Young,float Poisson){
    density = dens;
    YoungsModulus = Young;
    PoissonsRatio = Poisson;
    VoigtStiffness = new float[6][6];
    VoigtStiffness[0][0] = 1-PoissonsRatio;
    VoigtStiffness[1][1] = 1-PoissonsRatio;
    VoigtStiffness[2][2] = 1-PoissonsRatio;
    VoigtStiffness[3][3] = (1-2*PoissonsRatio)/2;
    VoigtStiffness[4][4] = (1-2*PoissonsRatio)/2;
    VoigtStiffness[5][5] = (1-2*PoissonsRatio)/2;
    VoigtStiffness[1][0] = PoissonsRatio;
    VoigtStiffness[0][1] = PoissonsRatio;
    VoigtStiffness[2][0] = PoissonsRatio;
    VoigtStiffness[0][2] = PoissonsRatio;
    VoigtStiffness[2][1] = PoissonsRatio;
    VoigtStiffness[1][2] = PoissonsRatio;
    for(int i=0;i<6;i++){
      for(int j=0;j<6;j++){
        VoigtStiffness[i][j] *= YoungsModulus/
        ((1+PoissonsRatio)
        *(1-2*PoissonsRatio));
      }
    }
  }
}
class cubeElement{
  node[][][] corners;
  material properties;
  PVector[][][] grid;
  orientation orient;
  cubeElement(node n000,node n001,
              node n010,node n011,
              node n100,node n101,
              node n110,node n111,material mat){
    properties = mat;
    corners = new node[2][2][2];
    corners[0][0][0] = n000;
    corners[0][0][1] = n001;
    corners[0][1][0] = n010;
    corners[0][1][1] = n011;
    corners[1][0][0] = n100;
    corners[1][0][1] = n101;
    corners[1][1][0] = n110;
    corners[1][1][1] = n111;
    for(int i=0;i<2;i++){
      for(int j=0;j<2;j++){
        for(int k=0;k<2;k++){
          corners[i][j][k].mass += 
          properties.density*pow(elementLength/2,3);
        }
      }
    }
    orient = new orientation();
  }
  void update(){
    // calculate strain at each corner independantly
    // stress at each corner is enterpolated to center planes
    
    // there is a coordinate system for the cube
    float[][][][] cornerStrain = new float[2][2][2][6];
    // edges observe tension which is used at each corner
    for(int i=0;i<3;i++){
      orient.axis[i] = new PVector();
    }
    for(int j=0;j<2;j++){
      for(int k=0;k<2;k++){
        PVector edge = PVector.sub(corners[1][j][k].location,corners[0][j][k].location);
        orient.axis[0].add(edge);
        cornerStrain[0][j][k][0] = edge.mag()/elementLength-1;
        cornerStrain[1][j][k][0] = cornerStrain[0][j][k][0];
      }
    }
    for(int i=0;i<2;i++){
      for(int k=0;k<2;k++){
        PVector edge = PVector.sub(corners[i][1][k].location,corners[i][0][k].location);
        orient.axis[1].add(edge);
        cornerStrain[i][0][k][1] = edge.mag()/elementLength-1;
        cornerStrain[i][1][k][1] = cornerStrain[i][0][k][1];
      }
    }
    for(int i=0;i<2;i++){
      for(int j=0;j<2;j++){
        PVector edge = PVector.sub(corners[i][j][1].location,corners[i][j][0].location);
        orient.axis[2].add(edge);
        cornerStrain[i][j][0][2] = edge.mag()/elementLength-1;
        cornerStrain[i][j][1][2] = cornerStrain[i][j][0][2];
      }
    }
    orient.restore();
    // corners observe independant shear
    for(int i=0;i<2;i++){
      for(int j=0;j<2;j++){
        for(int k=0;k<2;k++){
          // corners are paired to opposites
          int io = (i+1)%2;
          int jo = (j+1)%2;
          int ko = (k+1)%2;
          // the sign of corner shear must be determined
          if((j==0&&k==0)||(j==1&&k==1)){
            cornerStrain[i][j][k][3] = PI/2-PVector.angleBetween(
            PVector.sub(corners[i][jo][k].location,corners[i][j][k].location),
            PVector.sub(corners[i][j][ko].location,corners[i][j][k].location));
          }else{
            cornerStrain[i][j][k][3] = PVector.angleBetween(
            PVector.sub(corners[i][jo][k].location,corners[i][j][k].location),
            PVector.sub(corners[i][j][ko].location,corners[i][j][k].location))-PI/2;
          }
          if((i==0&&k==0)||(i==1&&k==1)){
            cornerStrain[i][j][k][4] = PI/2-PVector.angleBetween(
            PVector.sub(corners[io][j][k].location,corners[i][j][k].location),
            PVector.sub(corners[i][j][ko].location,corners[i][j][k].location));
          }else{
            cornerStrain[i][j][k][4] = PVector.angleBetween(
            PVector.sub(corners[io][j][k].location,corners[i][j][k].location),
            PVector.sub(corners[i][j][ko].location,corners[i][j][k].location))-PI/2;
          }
          if((i==0&&j==0)||(i==1&&j==1)){
            cornerStrain[i][j][k][5] = PI/2-PVector.angleBetween(
            PVector.sub(corners[io][j][k].location,corners[i][j][k].location),
            PVector.sub(corners[i][jo][k].location,corners[i][j][k].location));
          }else{
            cornerStrain[i][j][k][5] = PVector.angleBetween(
            PVector.sub(corners[io][j][k].location,corners[i][j][k].location),
            PVector.sub(corners[i][jo][k].location,corners[i][j][k].location))-PI/2;
          }
        }
      }
    }
    float[][][][] cornerStress = new float[2][2][2][6];
    for(int i=0;i<2;i++){
      for(int j=0;j<2;j++){
        for(int k=0;k<2;k++){
          cornerStress[i][j][k] = VoigtStress(cornerStrain[i][j][k]);
        }
      }
    }
    // every edge reacts two nodes in shear and compression
    for(int j=0;j<2;j++){
      for(int k=0;k<2;k++){
        float[] VoigtA = cornerStress[0][j][k];
        float[] VoigtB = cornerStress[1][j][k];
        PVector tensorStressA = new PVector(VoigtA[0],VoigtA[5],VoigtA[4]);
        PVector tensorStressB = new PVector(VoigtB[0],VoigtB[5],VoigtB[4]);
        PVector reaction = PVector.mult(PVector.add(tensorStressA,tensorStressB),0.5);
        // reaction is a force and is in world coordinates
        reaction.mult(sq(elementLength/2));
        reaction = orient.toWorld(reaction);
        corners[0][j][k].forceSum.add(reaction);
        corners[1][j][k].forceSum.sub(reaction);
      }
    }
    for(int i=0;i<2;i++){
      for(int k=0;k<2;k++){
        float[] VoigtA = cornerStress[i][0][k];
        float[] VoigtB = cornerStress[i][1][k];
        PVector tensorStressA = new PVector(VoigtA[5],VoigtA[1],VoigtA[3]);
        PVector tensorStressB = new PVector(VoigtB[5],VoigtB[1],VoigtB[3]);
        PVector reaction = PVector.mult(PVector.add(tensorStressA,tensorStressB),0.5);
        // reaction is a force and is in world coordinates
        reaction.mult(sq(elementLength/2));
        reaction = orient.toWorld(reaction);
        corners[i][0][k].forceSum.add(reaction);
        corners[i][1][k].forceSum.sub(reaction);
      }
    }
    for(int i=0;i<2;i++){
      for(int j=0;j<2;j++){
        float[] VoigtA = cornerStress[i][j][0];
        float[] VoigtB = cornerStress[i][j][1];
        PVector tensorStressA = new PVector(VoigtA[4],VoigtA[3],VoigtA[2]);
        PVector tensorStressB = new PVector(VoigtB[4],VoigtB[3],VoigtB[2]);
        PVector reaction = PVector.mult(PVector.add(tensorStressA,tensorStressB),0.5);
        // reaction is a force and is in world coordinates
        reaction.mult(sq(elementLength/2));
        reaction = orient.toWorld(reaction);
        corners[i][j][0].forceSum.add(reaction);
        corners[i][j][1].forceSum.sub(reaction);
      }
    }
  }
  float[] VoigtStress(float[] VoigtStrain){
    float[] val = new float[6];
    for(int i=0;i<6;i++){
      val[i] = 0;
      for(int k=0;k<6;k++){
        val[i] += properties.VoigtStiffness[i][k]*VoigtStrain[k];
      }
    }
    return val;
  }
  float[] estimateStrain(PVector n000,PVector n001,
                         PVector n010,PVector n011,
                         PVector n100,PVector n101,
                         PVector n110,PVector n111){
    PVector[][][] vert = new PVector[2][2][2];
    vert[0][0][0] = n000;
    vert[0][0][1] = n001;
    vert[0][1][0] = n010;
    vert[0][1][1] = n011;
    vert[1][0][0] = n100;
    vert[1][0][1] = n101;
    vert[1][1][0] = n110;
    vert[1][1][1] = n111;
    float[] VoigtStrain = new float[6];
    // normal strain is estimated from edge length elongation
    for(int j=0;j<2;j++){
      for(int k=0;k<2;k++){
        VoigtStrain[0] += PVector.sub(vert[1][j][k],vert[0][j][k]).mag()/elementLength-1;//elementLength/2
      }
    }
    VoigtStrain[0] *= 0.25;
    for(int i=0;i<2;i++){
      for(int k=0;k<2;k++){
        VoigtStrain[1] += PVector.sub(vert[i][1][k],vert[i][0][k]).mag()/elementLength-1;
      }
    }
    VoigtStrain[1] *= 0.25;
    for(int i=0;i<2;i++){
      for(int j=0;j<2;j++){
        VoigtStrain[2] += PVector.sub(vert[i][j][1],vert[i][j][0]).mag()/elementLength-1;
      }
    }
    VoigtStrain[2] *= 0.25;
    // shear strain is estimated from angle between edges
    for(int i=0;i<2;i++){
      VoigtStrain[3] += PI/2-PVector.angleBetween(PVector.sub(
      vert[i][1][0],vert[i][0][0]),PVector.sub(vert[i][0][1],vert[i][0][0]));
      VoigtStrain[3] += PI/2-PVector.angleBetween(PVector.sub(
      vert[i][1][0],vert[i][1][1]),PVector.sub(vert[i][0][1],vert[i][1][1]));
      VoigtStrain[3] += PVector.angleBetween(PVector.sub(
      vert[i][0][0],vert[i][1][0]),PVector.sub(vert[i][1][1],vert[i][1][0]))-PI/2;
      VoigtStrain[3] += PVector.angleBetween(PVector.sub(
      vert[i][0][0],vert[i][0][1]),PVector.sub(vert[i][1][1],vert[i][0][1]))-PI/2;
    }
    VoigtStrain[3] *= 0.125;
    for(int i=0;i<2;i++){
      VoigtStrain[4] += PI/2-PVector.angleBetween(PVector.sub(
      vert[1][i][0],vert[0][i][0]),PVector.sub(vert[0][i][1],vert[0][i][0]));
      VoigtStrain[4] += PI/2-PVector.angleBetween(PVector.sub(
      vert[1][i][0],vert[1][i][1]),PVector.sub(vert[0][i][1],vert[1][i][1]));
      VoigtStrain[4] += PVector.angleBetween(PVector.sub(
      vert[0][i][0],vert[1][i][0]),PVector.sub(vert[1][i][1],vert[1][i][0]))-PI/2;
      VoigtStrain[4] += PVector.angleBetween(PVector.sub(
      vert[0][i][0],vert[0][i][1]),PVector.sub(vert[1][i][1],vert[0][i][1]))-PI/2;
    }
    VoigtStrain[4] *= 0.125;
    for(int i=0;i<2;i++){
      VoigtStrain[5] += PI/2-PVector.angleBetween(PVector.sub(
      vert[1][0][i],vert[0][0][i]),PVector.sub(vert[0][1][i],vert[0][0][i]));
      VoigtStrain[5] += PI/2-PVector.angleBetween(PVector.sub(
      vert[1][0][i],vert[1][1][i]),PVector.sub(vert[0][1][i],vert[1][1][i]));
      VoigtStrain[5] += PVector.angleBetween(PVector.sub(
      vert[0][0][i],vert[1][0][i]),PVector.sub(vert[1][1][i],vert[1][0][i]))-PI/2;
      VoigtStrain[5] += PVector.angleBetween(PVector.sub(
      vert[0][0][i],vert[0][1][i]),PVector.sub(vert[1][1][i],vert[0][1][i]))-PI/2;
    }
    VoigtStrain[5] *= 0.125;
    return VoigtStrain;
  }
}
class orientation {
  PVector[] axis;
  orientation() {
    axis = new PVector[3];
    axis[0] = new PVector(1, 0, 0);
    axis[1] = new PVector(0, 1, 0);
    axis[2] = new PVector(0, 0, 1);
  }
  void rotate(PVector w) {
    for (int i=0;i<3;i++) {
      spin(axis[i], w);
    }
  }
  void spin(PVector r, PVector w) {
    // this method rotates a vector 'r' about another vector 'w'
    // by an angle which is the magnitude of 'w'
    if ((w.x!=0||w.y!=0||w.z!=0)&&(r.x!=0||r.y!=0||r.z!=0)) {
      float w2 = tan(w.mag()/2)*2;
      w.normalize();
      w.mult(w2);
      PVector uw = w.get();
      uw.normalize();
      PVector ruw = PVector.mult(uw, r.dot(uw));
      r.sub(ruw);
      PVector s = PVector.mult(r.cross(w), 0.5);
      PVector m = PVector.add(r, s);
      m.normalize();
      m.mult(r.dot(m));
      r.add(PVector.mult(PVector.sub(m, r), 2));
      r.add(ruw);
    }
  }
  void restore(){
    // ensure unity and orthogonality of axis
    for(int i=0;i<3;i++){
      axis[i].normalize();
    }
    for(int m=0;m<20;m++){// perform method several times
      for(int i=0;i<3;i++){
        int j = (i+1)%3;// next axis
        PVector dx = PVector.sub(axis[j],axis[i]);
        float restore = (dx.mag()-sqrt(2))*0.4;// convergence factor
        dx.normalize();
        dx.mult(restore);
        axis[j].sub(dx);
        axis[i].add(dx);
      }
      for(int i=0;i<3;i++){
        axis[i].normalize();
      }
    }
  }
  float orthogonality(){
    // a measure of the effectiveness of restore()
    float val = 0;
    for(int i=0;i<3;i++){
      int j = (i+1)%3;// next axis
      val += axis[i].dot(axis[j]);
    }
    if(axis[0].cross(axis[1]).dot(axis[2])<0){val=-1;}
    return val;
  }
  PVector toOri(PVector r) {
    PVector val = new PVector();
    val.x = r.dot(axis[0]);
    val.y = r.dot(axis[1]);
    val.z = r.dot(axis[2]);
    return val;
  }
  PVector toWorld(PVector r) {
    PVector val = new PVector();
    val.x = axis[0].x * r.x + axis[1].x * r.y + axis[2].x * r.z;
    val.y = axis[0].y * r.x + axis[1].y * r.y + axis[2].y * r.z;
    val.z = axis[0].z * r.x + axis[1].z * r.y + axis[2].z * r.z;
    return val;
  }
}

