
float depth = 64;
int numCubes = 192;
float cubeSize = 16;
int pointSampling = 4;
float momentOfIniertia = sq(cubeSize)/6;
float spring = 0.02;
float damping = 0.01;
float grav = 0.02;
class cube{
  PVector loc;
  PVector vel;
  PVector force;
  orient ori;
  PVector angVel;
  PVector torque;
  cube(){
    loc = new PVector(
      random(cubeSize/2,width-cubeSize/2),
      random(cubeSize/2,height-cubeSize/2),
      random(cubeSize/2,depth-cubeSize/2));
    vel = new PVector();
    force = new PVector();
    ori = new orient();
    angVel = new PVector();
    torque = new PVector();
  }
  void applyForce(PVector F,PVector R){
    force.add(F);
    torque.add(PVector.sub(R,loc).cross(F));
  }
  boolean isInCube(PVector r){
    PVector R = ori.toOri(PVector.sub(r,loc));
    boolean val = false;
    if(abs(R.x)<cubeSize/2&&abs(R.y)<cubeSize/2
      &&abs(R.z)<cubeSize/2){val = true;}
    return val;
  }
  PVector forceField(PVector r){
    PVector R = ori.toOri(PVector.sub(r,loc));
    PVector F = new PVector();
    if(abs(R.x)>abs(R.y)&&abs(R.x)>abs(R.z)){
      if(R.x>0){F.x = spring*(cubeSize/2-R.x);
      }else{F.x = -spring*(R.x+cubeSize/2);}
    }else if(abs(R.y)>abs(R.z)){
      if(R.y>0){F.y = spring*(cubeSize/2-R.y);
      }else{F.y = -spring*(R.y+cubeSize/2);}
    }else{
      if(R.z>0){F.z = spring*(cubeSize/2-R.z);
      }else{F.z = -spring*(R.z+cubeSize/2);}
    }
    return ori.toWorld(F);
  }
  PVector totalVelAt(PVector R){
    return PVector.add(vel,angVel.cross(PVector.sub(R,loc)));
  }
  void collide(cube C){
    PVector dx = PVector.sub(C.loc,loc);
    if(dx.mag()<cubeSize*1.732){
      PVector Fsum = new PVector();
      int count = 0;
      for(int i=0;i<=pointSampling;i++){
        for(int j=0;j<=pointSampling;j++){
          for(int k=0;k<=pointSampling;k++){
            PVector R = PVector.add(loc,
              ori.toWorld(new PVector(
              i*cubeSize/pointSampling-cubeSize/2,
              j*cubeSize/pointSampling-cubeSize/2,
              k*cubeSize/pointSampling-cubeSize/2)));
            if(C.isInCube(R)){
              PVector F = PVector.add(
                C.forceField(R),PVector.mult(PVector.sub(
                C.totalVelAt(R),totalVelAt(R)),damping));
//              Fsum.add
              applyForce(F,R);
              F.mult(-1);
              C.applyForce(F,R);
            }
          }
        }
      }
    }
  }
  void update(){
    force.limit(8);
    vel.add(force);
    force = new PVector(0,grav,0);
    loc.add(vel);
    torque.limit(PI/6);
    angVel.add(PVector.mult(torque,1/momentOfIniertia));
    torque = new PVector();
    ori.spin(angVel);
  }
  boolean wallHit(){
    boolean val = false;
    if(loc.x<cubeSize*0.866){val=true;}
    if(loc.x>width-cubeSize*0.866){val=true;}
    if(loc.y<cubeSize*0.866){val=true;}
    if(loc.y>height-cubeSize*0.866){val=true;}
    if(loc.z<cubeSize*0.866){val=true;}
    if(loc.z>depth-cubeSize*0.866){val=true;}
    return val;
  }
  PVector wallFeild(PVector R){
    PVector F = new PVector();
    boolean stick = false;
    if(R.x<0){F.x=-R.x*spring;stick=true;}
    if(R.x>width){F.x=-(R.x-width)*spring;stick=true;}
    if(R.y<0){F.y=-R.y*spring;stick=true;}
    if(R.y>height){F.y=-(R.y-height)*spring;stick=true;}
    if(R.z<0){F.z=-R.z*spring;}
    if(R.z>depth){F.z=-(R.z-depth)*spring;}
    if(stick){F.sub(PVector.mult(totalVelAt(R),damping));}
    return F;
  }
  void walls(){
    if(wallHit()){
      for(int i=0;i<=pointSampling;i++){
        for(int j=0;j<=pointSampling;j++){
          for(int k=0;k<=pointSampling;k++){
            PVector R = PVector.add(loc,
              ori.toWorld(new PVector(
              i*cubeSize/pointSampling-cubeSize/2,
              j*cubeSize/pointSampling-cubeSize/2,
              k*cubeSize/pointSampling-cubeSize/2)));
            applyForce(wallFeild(R),R);
          }
        }
      }
    }
  }
}
cube[] cubes;
void setup(){
  size(400,300,P3D);
  ortho(-width/2, width/2, -height/2, height/2, -10, 10);
  cubes = new cube[numCubes];
  reset();
  noStroke();
  fill(#FF8800);
}
void reset(){
  for(int i=0;i<cubes.length;i++){
    cubes[i] = new cube();
  }
}
void draw(){
  background(#8800FF);
  directionalLight(255, 255, 255, -1, 1, -1);
  directionalLight(128, 128, 128, 1, -1, 1);
  for(int i=0;i<cubes.length;i++){
    for(int j=0;j<cubes.length;j++){
      cubes[i].collide(cubes[j]);
    }
  }
  float Esum = 0;
  for(int i=0;i<cubes.length;i++){
    cubes[i].walls();
    cubes[i].update();
    Esum += sq(cubes[i].vel.mag());
    PVector[][][] verts = new PVector[2][2][2];
    PVector[] verts2 = new PVector[8];
    for(int a=0;a<=1;a++){
      for(int b=0;b<=1;b++){
        for(int c=0;c<=1;c++){
          verts[a][b][c] = new PVector(a-0.5,b-0.5,c-0.5);
        }
      }
    }
    verts2[0] = verts[0][0][0];
    verts2[1] = verts[1][0][0];
    verts2[2] = verts[0][1][0];
    verts2[3] = verts[0][0][1];
    verts2[4] = verts[1][1][0];
    verts2[5] = verts[1][0][1];
    verts2[6] = verts[0][1][1];
    verts2[7] = verts[1][1][1];
    for(int j=0;j<8;j++){
      verts2[j].mult(cubeSize);
      verts2[j] = cubes[i].ori.toWorld(verts2[j]);
      verts2[j].add(cubes[i].loc);
    }
    verts[0][0][0] = verts2[0];
    verts[1][0][0] = verts2[1];
    verts[0][1][0] = verts2[2];
    verts[0][0][1] = verts2[3];
    verts[1][1][0] = verts2[4];
    verts[1][0][1] = verts2[5];
    verts[0][1][1] = verts2[6];
    verts[1][1][1] = verts2[7];
    int[] vertA = new int[6*2*3];
    int[] vertB = new int[6*2*3];
    int[] vertC = new int[6*2*3];
    
    vertA[0 ] =  1; vertB[0 ] =  1; vertC[0 ] =  1;
    vertA[1 ] =  1; vertB[1 ] = -1; vertC[1 ] =  1;
    vertA[2 ] =  1; vertB[2 ] =  1; vertC[2 ] = -1;
    
    vertA[3 ] =  1; vertB[3 ] = -1; vertC[3 ] = -1;
    vertA[4 ] =  1; vertB[4 ] = -1; vertC[4 ] =  1;
    vertA[5 ] =  1; vertB[5 ] =  1; vertC[5 ] = -1;
    
    vertA[6 ] = -1; vertB[6 ] =  1; vertC[6 ] =  1;
    vertA[7 ] = -1; vertB[7 ] = -1; vertC[7 ] =  1;
    vertA[8 ] = -1; vertB[8 ] =  1; vertC[8 ] = -1;
    
    vertA[9 ] = -1; vertB[9 ] = -1; vertC[9 ] = -1;
    vertA[10] = -1; vertB[10] = -1; vertC[10] =  1;
    vertA[11] = -1; vertB[11] =  1; vertC[11] = -1;
    
    vertA[12] =  1; vertB[12] =  1; vertC[12] =  1;
    vertA[13] =  1; vertB[13] =  1; vertC[13] = -1;
    vertA[14] = -1; vertB[14] =  1; vertC[14] =  1;
    
    vertA[15] = -1; vertB[15] =  1; vertC[15] = -1;
    vertA[16] =  1; vertB[16] =  1; vertC[16] = -1;
    vertA[17] = -1; vertB[17] =  1; vertC[17] =  1;
    
    vertA[18] =  1; vertB[18] = -1; vertC[18] =  1;
    vertA[19] =  1; vertB[19] = -1; vertC[19] = -1;
    vertA[20] = -1; vertB[20] = -1; vertC[20] =  1;
    
    vertA[21] = -1; vertB[21] = -1; vertC[21] = -1;
    vertA[22] =  1; vertB[22] = -1; vertC[22] = -1;
    vertA[23] = -1; vertB[23] = -1; vertC[23] =  1;
    
    vertA[24] =  1; vertB[24] =  1; vertC[24] =  1;
    vertA[25] = -1; vertB[25] =  1; vertC[25] =  1;
    vertA[26] =  1; vertB[26] = -1; vertC[26] =  1;
    
    vertA[27] = -1; vertB[27] = -1; vertC[27] =  1;
    vertA[28] = -1; vertB[28] =  1; vertC[28] =  1;
    vertA[29] =  1; vertB[29] = -1; vertC[29] =  1;
    
    vertA[30] =  1; vertB[30] =  1; vertC[30] = -1;
    vertA[31] = -1; vertB[31] =  1; vertC[31] = -1;
    vertA[32] =  1; vertB[32] = -1; vertC[32] = -1;
    
    vertA[33] = -1; vertB[33] = -1; vertC[33] = -1;
    vertA[34] = -1; vertB[34] =  1; vertC[34] = -1;
    vertA[35] =  1; vertB[35] = -1; vertC[35] = -1;
    
    for(int j=0;j<6*2*3;j++){
      if(vertA[j]==-1){vertA[j]=0;}
      if(vertB[j]==-1){vertB[j]=0;}
      if(vertC[j]==-1){vertC[j]=0;}
    }
    beginShape(TRIANGLES);
    for(int j=0;j<6*2*3;j++){
      vertex(verts[vertA[j]][vertB[j]][vertC[j]].x,
        verts[vertA[j]][vertB[j]][vertC[j]].y,
        -verts[vertA[j]][vertB[j]][vertC[j]].z);
    }
    endShape();
  }
  if(mousePressed){
    PVector mouse = new PVector(mouseX,mouseY);
    PVector pmouse = new PVector(pmouseX,pmouseY);
    PVector vmouse = PVector.sub(mouse,pmouse);
//    vmouse.mult(2);
    for(int i=0;i<cubes.length;i++){
      pmouse.z = cubes[i].loc.z;
      PVector dx = PVector.sub(cubes[i].loc,pmouse);
      if(dx.mag()<cubeSize/2){
        cubes[i].applyForce(PVector.mult(PVector.sub(
          vmouse,cubes[i].totalVelAt(pmouse)),1),pmouse);
      }
    }
  }
//  if(Esum>1000000){reset();}
}
void mouseDragged(){
}
void keyPressed(){
  if(key==' '){reset();}
}

