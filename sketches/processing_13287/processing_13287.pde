
float gravity = 0.001;
float fricLimit = 0.003;
class Wheel{
  PVector X;
  PVector V;
  PVector F;
  Wheel(PVector xo){
    X = xo;
    V = new PVector();
    F = new PVector();
  }
  void iterate(PVector forward,float speed){
    float k = 0.1;
    float c = 0.15;
    float mu = 0.18;
    int b = floor(X.x);
    int a = floor(X.y);
    if((data[a][b]>X.z)||
       (data[a+1][b]>X.z)||
       (data[a][b+1]>X.z)||
       (data[a+1][b+1]>X.z)){
      PVector ref = new PVector(b+1,a,data[a][b+1]);
      PVector ref2 = new PVector(b,a+1,data[a+1][b]);
      PVector ref3;
      PVector n;
      if((X.x-b)+(X.y-a)<1){
        ref3 = new PVector(b,a,data[a][b]);
        n = PVector.sub(ref2,ref3)
            .cross(PVector.sub(ref,ref3));
      }else{
        ref3 = new PVector(b+1,a+1,data[a+1][b+1]);
        n = PVector.sub(ref,ref3)
            .cross(PVector.sub(ref2,ref3));
      }
      n.normalize();
      PVector dx = PVector.sub(X,ref);
      if(n.dot(dx)>0){
        PVector dxn = PVector.mult(n,n.dot(dx)*k);
        PVector dvn = PVector.mult(n,n.dot(V));
        F.sub(PVector.add(dxn,PVector.mult(dvn,c)));
        PVector forwardt = PVector.sub(forward,
                     PVector.mult(n,n.dot(forward)));
        PVector dvt = PVector.sub(V,dvn);
        if(mousePressed||abs(dpad.y)>0.0001){
          dvt.sub(PVector.mult(forwardt,speed));
        }else{
          dvt.sub(PVector.mult(forwardt,forwardt.dot(V)*0.98));
        }
        PVector fric = PVector.mult(dvt,mu);
  //      if(fric.mag()>fricLimit){
  //        fric = PVector.mult(fric,fricLimit/fric.mag());
  //      }
        if(fric.mag()>F.mag()*0.8){
          fric = PVector.mult(fric,F.mag()*0.8/fric.mag());
        }
        F.sub(fric);
      }
    }
    F.add(bound(X));
    V.add(F);
    V.add(new PVector(0,0,-gravity));
    F = new PVector();
    X.add(V);
  }
  void iterate(){
    float k = 0.1;
    float c = 0.15;
    float mu = 0.18;
    int b = floor(X.x);
    int a = floor(X.y);
    PVector ref = new PVector(b+1,a,data[a][b+1]);
    PVector ref2 = new PVector(b,a+1,data[a+1][b]);
    PVector ref3;
    PVector n;
    if((X.x-b)+(X.y-a)<1){
      ref3 = new PVector(b,a,data[a][b]);
      n = PVector.sub(ref2,ref3)
          .cross(PVector.sub(ref,ref3));
    }else{
      ref3 = new PVector(b+1,a+1,data[a+1][b+1]);
      n = PVector.sub(ref,ref3)
          .cross(PVector.sub(ref2,ref3));
    }
    n.normalize();
    PVector dx = PVector.sub(X,ref);
    if(n.dot(dx)>0){
      PVector dxn = PVector.mult(n,n.dot(dx)*k);
      PVector dvn = PVector.mult(n,n.dot(V));
      F.sub(PVector.add(dxn,PVector.mult(dvn,c)));
      PVector dvt = PVector.sub(V,dvn);
      PVector fric = PVector.mult(dvt,mu);
      if(fric.mag()>fricLimit){
        fric = PVector.mult(fric,fricLimit/fric.mag());
      }
      F.sub(fric);
    }
    F.add(bound(X));
    V.add(PVector.mult(F,3));
//    V.add(F);
    V.add(new PVector(0,0,-gravity));
    F = new PVector();
    X.add(V);
  }
  void draw(){
    PVector upVb = oriToWorld(new PVector(
                   0,0,car.wheelRad*1.7),car.ori);
    upVb.add(X);
    pushMatrix();
    translate(upVb.x*scaleFactor,
              upVb.y*scaleFactor,upVb.z*scaleFactor);
    sphere(car.wheelRad*2*scaleFactor);
    popMatrix();
  }
}
Car car;
PVector wheelSpan = new PVector(0.75,1.5,0.4);
PVector bodySpan = new PVector(0.6,1.2,0.2);
class Car{
  PVector X;
  PVector V;
  PVector F;
  PVector T;
  PVector W;
  Orient ori;
  float wheelRad = 0.07;
  Wheel[] wheel;
  PVector[] wheelR;
  float speed;
  float steerAngle;
  Car(PVector xo){
    X = xo;
    V = new PVector();
    F = new PVector();
    T = new PVector();
    W = new PVector();
    ori = new Orient();
    // +x left, +y forward, +z up
    wheel = new Wheel[8];
    wheelR = new PVector[8];
    // front right wheel
    wheelR[0] = new PVector(-wheelSpan.x/2,
                            wheelSpan.y/2,
                            -wheelSpan.z);
    wheel[0] = new Wheel(PVector.add(wheelR[0],xo));
    // front left wheel
    wheelR[1] = new PVector(wheelSpan.x/2,
                            wheelSpan.y/2,
                            -wheelSpan.z);
    wheel[1] = new Wheel(PVector.add(wheelR[1],xo));
    // rear right wheel
    wheelR[2] = new PVector(-wheelSpan.x/2,
                            -wheelSpan.y/2,
                            -wheelSpan.z);
    wheel[2] = new Wheel(PVector.add(wheelR[2],xo));
    // rear left wheel
    wheelR[3] = new PVector(wheelSpan.x/2,
                            -wheelSpan.y/2,
                            -wheelSpan.z);
    wheel[3] = new Wheel(PVector.add(wheelR[3],xo));
    // wheels on roof
    wheelR[4] = new PVector(-bodySpan.x/3,
                            bodySpan.y/3,
                            bodySpan.z);
    wheel[4] = new Wheel(PVector.add(wheelR[4],xo));
    wheelR[5] = new PVector(bodySpan.x/3,
                            bodySpan.y/3,
                            bodySpan.z);
    wheel[5] = new Wheel(PVector.add(wheelR[5],xo));
    wheelR[6] = new PVector(-bodySpan.x/3,
                            -bodySpan.y/3,
                            bodySpan.z);
    wheel[6] = new Wheel(PVector.add(wheelR[6],xo));
    wheelR[7] = new PVector(bodySpan.x/3,
                            -bodySpan.y/3,
                            bodySpan.z);
    wheel[7] = new Wheel(PVector.add(wheelR[7],xo));
  }
  void iterate(){
    for(int i=0;i<4;i++){
      wheelReactor(wheel[i],wheelR[i]);
    }
    for(int i=4;i<8;i++){
      wheelReactor(wheel[i],wheelR[i]);
    }
    float speedBlend = 0.02;
    if(dpad.mag()<0.0001){
      if(mousePressed){
        steerAngle = ((float) mouseX / width - 0.5) * PI/2;
        speed += ((((float) mouseY / height - 0.67) *
                        -0.2)-speed)*speedBlend;
      }else{
        steerAngle *= 0.99;
        speed += (0.0-speed)*speedBlend;
      }
    }else{
      steerAngle = dpad.x;
      speed += (dpad.y-speed)*speedBlend;
    }
    PVector steerV = new PVector(-sin(steerAngle),
                                 cos(steerAngle),0);
    for(int i=0;i<2;i++){
      wheel[i].iterate(oriToWorld(
                       steerV,car.ori),speed);
    }
    for(int i=2;i<4;i++){
      wheel[i].iterate(oriToWorld(
                       new PVector(0,1,0),car.ori),speed);
    }
    for(int i=4;i<8;i++){
      wheel[i].iterate();
    }
    if(keyPressed&&key==' '){
      // flip car
      PVector upV = new PVector(0,0,1);
      PVector upVb = oriToWorld(upV,ori);
      if (PVector.angleBetween(upV,upVb) > PI/4){
        float Tpull = 0.01 * (
          PVector.angleBetween(upV,upVb) - PI/4);
        if(str(Tpull).equals("NaN")){
          Tpull = 0;
        }
        PVector dir = upVb.cross(upV);
        dir.normalize();
        T.add(PVector.mult(dir,Tpull));
      }
    }
    F.add(bound(X));
    V.add(PVector.mult(F,0.2));
    V.add(F);
    V.add(new PVector(0,0,-gravity));
    F = new PVector();
    X.add(V);
    W.add(PVector.mult(T,1.0));
    T = new PVector();
    W.mult(0.99);
    ori.spin(W);
  }
  void draw(){
    fill(255);
    PVector[] nodes = new PVector[16];
    int[] hood = new int[16];
//    nodes[0] = new PVector(bodySpan.x/2,bodySpan.y/2,bodySpan.z/2);
//    nodes[1] = new PVector(bodySpan.x/2,bodySpan.y/2,-bodySpan.z/2);
//    nodes[2] = new PVector(-bodySpan.x/2,bodySpan.y/2,bodySpan.z/2);
//    nodes[3] = new PVector(-bodySpan.x/2,bodySpan.y/2,-bodySpan.z/2);
//    nodes[4] = new PVector(-bodySpan.x/2,-bodySpan.y/2,bodySpan.z/2);
//    nodes[5] = new PVector(-bodySpan.x/2,-bodySpan.y/2,-bodySpan.z/2);
//    nodes[6] = new PVector(bodySpan.x/2,-bodySpan.y/2,bodySpan.z/2);
//    nodes[7] = new PVector(bodySpan.x/2,-bodySpan.y/2,-bodySpan.z/2);
    nodes[0] = new PVector(0.24,-0.18,0.225);
    nodes[1] = new PVector(-0.24,-0.18,0.225);
    nodes[2] = new PVector(0.36,-0.18,0.045);
    nodes[3] = new PVector(-0.36,-0.18,0.045);
    nodes[4] = new PVector(0.36,-0.9,0.045);
    nodes[5] = new PVector(-0.36,-0.9,0.045);
    nodes[6] = new PVector(0.36,-0.9,-0.225);
    nodes[7] = new PVector(-0.36,-0.9,-0.225);
    nodes[8] = new PVector(0.36,0.9,-0.225);
    nodes[9] = new PVector(-0.36,0.9,-0.225);
    nodes[10] = new PVector(0.36,0.9,-0.045);
    nodes[11] = new PVector(-0.36,0.9,-0.045);
    nodes[12] = new PVector(0.36,0.42,0.045);
    nodes[13] = new PVector(-0.36,0.42,0.045);
    nodes[14] = new PVector(0.24,0.18,0.225);
    nodes[15] = new PVector(-0.24,0.18,0.225);
    hood[0] = 7;
    hood[1] = 9;
    hood[2] = 5;
    hood[3] = 11;
    hood[4] = 3;
    hood[5] = 13;
    hood[6] = 1;
    hood[7] = 15;
    hood[8] = 0;
    hood[9] = 14;
    hood[10] = 2;
    hood[11] = 12;
    hood[12] = 4;
    hood[13] = 10;
    hood[14] = 6;
    hood[15] = 8;
    for(int i=0;i<nodes.length;i++){
      nodes[i] = oriToWorld(nodes[i],ori);
      nodes[i].add(X);
      nodes[i].mult(scaleFactor);
    }
//    beginShape(TRIANGLE_STRIP);
//    for(int i=0;i<8;i++){
//      vertex(nodes[i].x,nodes[i].y,nodes[i].z);
//    }
//    vertex(nodes[0].x,nodes[0].y,nodes[0].z);
//    vertex(nodes[1].x,nodes[1].y,nodes[1].z);
//    endShape();
//    beginShape(TRIANGLE_STRIP);
//    vertex(nodes[0].x,nodes[0].y,nodes[0].z);
//    vertex(nodes[2].x,nodes[2].y,nodes[2].z);
//    vertex(nodes[6].x,nodes[6].y,nodes[6].z);
//    vertex(nodes[4].x,nodes[4].y,nodes[4].z);
//    endShape();
//    beginShape(TRIANGLE_STRIP);
//    vertex(nodes[1].x,nodes[1].y,nodes[1].z);
//    vertex(nodes[3].x,nodes[3].y,nodes[3].z);
//    vertex(nodes[7].x,nodes[7].y,nodes[7].z);
//    vertex(nodes[5].x,nodes[5].y,nodes[5].z);
//    endShape();
    beginShape(TRIANGLE_STRIP);
    for(int i=0;i<nodes.length;i++){
      vertex(nodes[i].x,nodes[i].y,nodes[i].z);
    }
    endShape();
    beginShape(TRIANGLE_STRIP);
    for(int i=0;i<nodes.length;i++){
      vertex(nodes[hood[i]].x,nodes[hood[i]].y,nodes[hood[i]].z);
    }
    endShape();
    for(int i=0;i<4;i++){
      wheel[i].draw();
    }
  }
  void cam(){
    PVector camV = PVector.add(oriToWorld(
                       new PVector(0,-5,2),car.ori),car.X);
    camV.z = car.X.z + 2;
    int b = floor(camV.x);
    int a = floor(camV.y);
    float aa = data[a][b];
    float ca = data[a][b+1];
    float ba = aa + (ca - aa) * (camV.x - (float)b);
    float ac = data[a+1][b];
    float cc = data[a+1][b+1];
    float bc = ac + (cc - ac) * (camV.x - (float)b);
    float bb = ba + (bc - ba) * (camV.y - (float)a);
    if(camV.z<bb+1){camV.z=bb+1;}
    camX = PVector.add(
             PVector.add(camX,PVector.mult(
               PVector.sub(camV,camX),0.05)),
                 V);
    camera(camX.x*scaleFactor, 
           camX.y*scaleFactor, 
           camX.z*scaleFactor, // eyeX, eyeY, eyeZ
           car.X.x*scaleFactor,
           car.X.y*scaleFactor, 
           car.X.z*scaleFactor, // centerX, centerY, centerZ
           0.0, 0.0, -1.0); // upX, upY, upZ
  }
}
void wheelReactor(Wheel weel, PVector offset){
  float k1 = 0.2;
  float k2 = 0.03;
  float c1 = 0.05;
  float c2 = 0.03;
  PVector dx1o = PVector.sub(weel.X,car.X);
  PVector dx1 = worldToOri(dx1o,car.ori);
  PVector comp1 = PVector.sub(dx1,offset);
  comp1.x *= -k1;
  comp1.y *= -k1;
  comp1.z *= -k2;
  comp1.x -= PVector.mult(PVector.sub(PVector.sub(
  worldToOri(weel.V,car.ori),
  worldToOri(car.V,car.ori)),
  worldToOri(car.W,car.ori).cross(dx1)),c1).x;
  comp1.y -= PVector.mult(PVector.sub(PVector.sub(
  worldToOri(weel.V,car.ori),
  worldToOri(car.V,car.ori)),
  worldToOri(car.W,car.ori).cross(dx1)),c1).y;
  comp1.z -= PVector.mult(PVector.sub(PVector.sub(
  worldToOri(weel.V,car.ori),
  worldToOri(car.V,car.ori)),
  worldToOri(car.W,car.ori).cross(dx1)),c2).z;
  PVector comp1o = oriToWorld(comp1,car.ori);
  weel.F.add(comp1o);
  car.F.sub(comp1o);
  car.T.sub(dx1o.cross(comp1o));
}
void wheelReactor2(Wheel weel, PVector offset){
  float k1 = 0.03;
  float k2 = k1;
  float c1 = 0.03;
  float c2 = c1;
  PVector dx1o = PVector.sub(weel.X,car.X);
  PVector dx1 = worldToOri(dx1o,car.ori);
  PVector comp1 = PVector.sub(dx1,offset);
  comp1.x *= -k1;
  comp1.y *= -k1;
  comp1.z *= -k2;
  comp1.x -= PVector.mult(PVector.sub(PVector.sub(
  worldToOri(weel.V,car.ori),
  worldToOri(car.V,car.ori)),
  worldToOri(car.W,car.ori).cross(dx1)),c1).x;
  comp1.y -= PVector.mult(PVector.sub(PVector.sub(
  worldToOri(weel.V,car.ori),
  worldToOri(car.V,car.ori)),
  worldToOri(car.W,car.ori).cross(dx1)),c1).y;
  comp1.z -= PVector.mult(PVector.sub(PVector.sub(
  worldToOri(weel.V,car.ori),
  worldToOri(car.V,car.ori)),
  worldToOri(car.W,car.ori).cross(dx1)),c2).z;
  PVector comp1o = oriToWorld(comp1,car.ori);
  weel.F.add(comp1o);
  car.F.sub(comp1o);
  car.T.sub(dx1o.cross(comp1o));
}

