
class MyShape
{  
  
  Transform trnsfrm;
  Vector3f initPosition;
  CollisionShape collShape = null;
  float myMass,radius,w,h,d = 0.0;
  RigidBody myRigidBody;
  int typeOfShape;
  Box bx;
  Ellipsoid sf;
  Cone cn;
  
  //box
  MyShape(PApplet pa, Vector3f _initPosition, float _mass, float _w, float _h, float _d)
  {
    initPosition = _initPosition;
    myMass = _mass;
    w = _w;
    h = _h;
    d = _d;
    collShape = new BoxShape(new Vector3f(w/2,h/2,d/2));
    bx = new Box(pa, w,h,d, new PVector(), new PVector());
    trnsfrm = new Transform();
    trnsfrm.setIdentity();
    trnsfrm.origin.set(initPosition); 
    trnsfrm.setRotation(new Quat4f(0,0,0,1));
    myRigidBody = cRigidBody(myMass, trnsfrm, collShape);
//    myRigidBody.setFriction(2.0f);
//    myRigidBody.setDamping(0.05F, 0.85F);
     myRigidBody.setDeactivationTime(0.5f);
    //myRigidBody.setSleepingThresholds(0.6F, 2.5F);
    typeOfShape = 1;
  }

  //plane
  MyShape(Vector3f _initPosition, Vector3f planeNormal, float planeConstant)
  {
    initPosition = _initPosition;
    collShape = new StaticPlaneShape(planeNormal, planeConstant);
    trnsfrm = new Transform();
    trnsfrm.setIdentity();
    trnsfrm.origin.set(initPosition); 
    trnsfrm.setRotation(new Quat4f(0,0,0,1));
    myRigidBody = cRigidBody(0, trnsfrm, collShape);
    myRigidBody.setFriction(2.0f);
    typeOfShape = 2;
  }    
  //sphere
  MyShape(PApplet pa, Vector3f _initPosition, float _mass, float _radius)
  {
    initPosition = _initPosition;
    myMass = _mass;
    radius = _radius;
    collShape = new SphereShape(radius);
    sf = new Ellipsoid(pa, 10, 10, new PVector(), new PVector());
    sf.setRadius(radius);
    trnsfrm = new Transform();    
    trnsfrm.setIdentity();
    trnsfrm.origin.set(initPosition); 
    trnsfrm.setRotation(new Quat4f(0,0,0,1));
    myRigidBody = cRigidBody(myMass, trnsfrm, collShape);
    typeOfShape = 3;
  }
  //cone
  MyShape(PApplet pa, Vector3f _initPosition, float _mass, float _radius, float _height)
  {
    initPosition = _initPosition;
    myMass = _mass;
    radius = _radius;
    collShape = new ConeShape(radius, _height);
    cn = new Cone(pa, 10, new PVector(0,-PI,0), new PVector(0,-_height/2,0));
    cn.setSize(radius, radius, _height);
    trnsfrm = new Transform();
    trnsfrm.setIdentity();
    trnsfrm.origin.set(initPosition);
    trnsfrm.setRotation(new Quat4f(0,0,0,1));
    myRigidBody = cRigidBody(myMass, trnsfrm, collShape);
    typeOfShape = 4;
  }

  RigidBody cRigidBody(float ms, Transform startTransform, CollisionShape shape) {
    Vector3f localInertia = new Vector3f();
    localInertia.set(0.0f, 0.0f, 0.0f);
    shape.calculateLocalInertia(ms, localInertia);
    DefaultMotionState myMotionState = new DefaultMotionState(startTransform);
    RigidBodyConstructionInfo rbInfo = new RigidBodyConstructionInfo(ms, myMotionState, shape, localInertia);
    RigidBody body = new RigidBody(rbInfo);
    theWorld.addRigidBody(body);
    return body;
  }

 void addVel(Vector3f origin, Vector3f destination)
 {

    PVector dest = new PVector(destination.x,destination.y+.1f,destination.z);
    PVector orig = new PVector(origin.x,origin.y,origin.z);
    PVector dir = PVector.sub(dest,orig); // direction
    float a = PVector.angleBetween(dest,orig);
    float d = dest.dist(orig);
    println(d);

    dir.normalize();
    dir.mult(100.0);

    Transform tt = myRigidBody.getWorldTransform(trnsfrm);
    tt.setRotation(new Quat4f(orig.x, orig.y-d, orig.z, a));
    myRigidBody.setWorldTransform(tt);
    myRigidBody.setLinearVelocity(new Vector3f(dir.x,dir.y,dir.z));
    myRigidBody.setCenterOfMassTransform(tt);
 } 



 void render()
 {
      trnsfrm = myRigidBody.getMotionState().getWorldTransform(trnsfrm);    
      pushMatrix();
      translate(trnsfrm.origin.x,trnsfrm.origin.y,trnsfrm.origin.z);
      applyMatrix(trnsfrm.basis.m00, trnsfrm.basis.m01, trnsfrm.basis.m02, 0,
      trnsfrm.basis.m10, trnsfrm.basis.m11, trnsfrm.basis.m12, 0,
      trnsfrm.basis.m20, trnsfrm.basis.m21, trnsfrm.basis.m22, 0,
      0,  0,  0,  1);  
      noStroke();
      
       switch (typeOfShape) {
       case 1:
       bx.fill(200); 
       bx.draw();
       break;
       case 2:
//         pushMatrix();
//         rotateX(HALF_PI);
//         rectMode(CENTER);
//         noStroke();
//         fill(150);
//         rect(0,0,100,100);
//         popMatrix();
         pushMatrix();
         rotateX(HALF_PI);
         for(int x = -50; x < 50; x+=5){
          for(int z = -50; z < 50; z+=5){
          stroke(150);
          beginShape(LINES);
          vertex(x+5, z);
          vertex(x, z);
          vertex(x, z+5);
          vertex(x, z);
          endShape();
          }
         }
         popMatrix();
       break;
       case 3:
         sf.fill(#EA0C0C); 
         sf.draw(); 
       break;
       case 4:
         cn.fill(#434242); 
         cn.draw(); 
       break;
       }
       
      popMatrix();
 }



}


