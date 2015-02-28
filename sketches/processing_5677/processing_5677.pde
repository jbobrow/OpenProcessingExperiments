
import damkjer.ocd.*;

import com.bulletphysics.*;
import com.bulletphysics.collision.dispatch.*;
import com.bulletphysics.collision.shapes.*;
import com.bulletphysics.collision.broadphase.*;
import com.bulletphysics.dynamics.*;
import com.bulletphysics.dynamics.constraintsolver.*;
import com.bulletphysics.linearmath.*;
import javax.vecmath.*;

//////////////////////////////////////////////////////////////
//Define Phyics Objects
//
//////////////////////////////////////////////////////////////
RigidBody groundRigidBody;
ArrayList gndRigidBodies = new ArrayList();
ArrayList fallRigidBodies = new ArrayList(); 
Iterator ite;
DynamicsWorld myWorld;
Transform myTransform;


//////////////////////////////////////////////////////////////
//Duomino Definations
//
//////////////////////////////////////////////////////////////
float groundY = -200;
float objW = 30.0;
float objH = 60.0;
float objD = 10.0;

/////////////////////////////////////////////////////////////
//Display Object
//
/////////////////////////////////////////////////////////////
Camera cam;

void setup(){
  size(400, 320, P3D);
  hint(ENABLE_DEPTH_SORT);
  background(248);

  cam = new Camera(this, 0, -100, 1000);

  int maxProxies = 1000;
  Vector3f worldAabbMin = new Vector3f(-10000,-10000,-10000);
  Vector3f worldAabbMax = new Vector3f(10000,10000,10000);




  CollisionConfiguration myCc = new DefaultCollisionConfiguration();
  BroadphaseInterface myBi = new AxisSweep3(worldAabbMin, worldAabbMax, maxProxies);
  CollisionDispatcher myCd = new CollisionDispatcher(myCc);

  ConstraintSolver myCs = new SequentialImpulseConstraintSolver();
  myWorld = new DiscreteDynamicsWorld(myCd, myBi, myCs, myCc);

  myWorld.setGravity(new Vector3f(0,10.0,0));


  CollisionShape groundShape = new StaticPlaneShape(new Vector3f(0,-1,0), 1); 
  myTransform = new Transform();
  myTransform.origin.set(new Vector3f(0,groundY,0)); 
  myTransform.setRotation(new Quat4f(0,0,0,1));
  DefaultMotionState groundMotionState = new DefaultMotionState(myTransform);
  RigidBodyConstructionInfo groundCI = new RigidBodyConstructionInfo(0, groundMotionState, groundShape, new Vector3f(0,0,0));
  RigidBody groundRigidBody = new RigidBody(groundCI);
  myWorld.addRigidBody(groundRigidBody);

  float i=0;
  float j=0;
  float jlen;
  float tmpx,tmpy;
  for(i=1;i<5;i++){
    jlen = int(7*i);
    for(j=0;j<jlen;j++){
      tmpx =  sin(j/jlen*TWO_PI+i*HALF_PI)*i*objW*1.5;
      tmpy = cos(j/jlen*TWO_PI+i*HALF_PI)*i*objW*1.5;
      addBox(tmpx,tmpy,-objH/2.0+groundY,j/jlen*TWO_PI+i*HALF_PI);       
    }
  }

  addBall(0,0,-800);

  cam.arc(-0.9);    
  cam.aim(0,0,0); 
  cam.zoom(0.2);
  cam.feed();

}

RigidBody ballRigidBody;
void addBall(float pX,float pY,float pZ){
  float myFallMass = 1.1; 
  Vector3f myFallInertia = new Vector3f(1,1,1);
  CollisionShape ballShape = new SphereShape(50.0);
  Transform ballTrans = new Transform(); 
  ballTrans.origin.set(new Vector3f(pX,pZ,pY));
  ballTrans.setRotation(new Quat4f(0,0,0,1));  

  DefaultMotionState fallMotionState = new DefaultMotionState(ballTrans); 
  ballShape.calculateLocalInertia(myFallMass, myFallInertia);
  RigidBodyConstructionInfo fallRigidBodyCI = new RigidBodyConstructionInfo(myFallMass, fallMotionState, ballShape, myFallInertia);
  ballRigidBody = new RigidBody(fallRigidBodyCI);
  myWorld.addRigidBody(ballRigidBody);
}

void addBox(float pX, float pY,float pZ,float quat3){
  CollisionShape fallShape = new BoxShape(new Vector3f(objW/2.0,objH/2.0,objD/2.0));
  myTransform = new Transform(); 
  myTransform.basis.rotY(quat3);
  myTransform.origin.set(new Vector3f(pX,pZ,pY)); 
  DefaultMotionState fallMotionState = new DefaultMotionState(myTransform);
  float myFallMass = 1.1; 
  Vector3f myFallInertia = new Vector3f(0,0,0);
  fallShape.calculateLocalInertia(myFallMass, myFallInertia);
  RigidBodyConstructionInfo fallRigidBodyCI = new RigidBodyConstructionInfo(myFallMass, fallMotionState, fallShape, myFallInertia);
  RigidBody fallRigidBody = new RigidBody(fallRigidBodyCI);
  myWorld.addRigidBody(fallRigidBody);

  fallRigidBodies.add(fallRigidBody);
}

void draw(){

  background(248); 
  
  lights();
  
  myWorld.stepSimulation(1.0/10.0,10,1.0/10.0);


  myTransform = new Transform();
  myTransform = ballRigidBody.getMotionState().getWorldTransform(myTransform);

  cam.circle(.01);
  cam.arc(.001);
  if(frameCount<300) cam.zoom(-0.002);
  cam.aim(myTransform.origin.x,myTransform.origin.y,myTransform.origin.z); 
  cam.feed();
    
  noStroke();  


  myTransform = new Transform();
  myTransform = ballRigidBody.getMotionState().getWorldTransform(myTransform);
  pushMatrix();
  translate(myTransform.origin.x,myTransform.origin.y,myTransform.origin.z);
  applyMatrix(myTransform.basis.m00, myTransform.basis.m01, myTransform.basis.m02, 0,myTransform.basis.m10, myTransform.basis.m11, myTransform.basis.m12, 0,myTransform.basis.m20, myTransform.basis.m21, myTransform.basis.m22, 0,0,  0,  0,  1);
  if(myTransform.origin.z!=-460.0){
    fill(204,26,41); 
  }
  else{
    fill(248,248,248); 
  }
  sphere(40);  
  popMatrix();

  ite = fallRigidBodies.iterator();
  while(ite.hasNext()) {
    RigidBody fallRigidBody = (RigidBody)ite.next();
    myTransform = new Transform();
    myTransform = fallRigidBody.getMotionState().getWorldTransform(myTransform);
    pushMatrix();
    translate(myTransform.origin.x,myTransform.origin.y,myTransform.origin.z);
    applyMatrix(myTransform.basis.m00, myTransform.basis.m01, myTransform.basis.m02, 0,myTransform.basis.m10, myTransform.basis.m11, myTransform.basis.m12, 0,myTransform.basis.m20, myTransform.basis.m21, myTransform.basis.m22, 0,0,  0,  0,  1);
    if(myTransform.basis.m11>.99){
      fill(248); 
    }
    else{
      fill(204,26,41); 
    }
    box(objW,objH,objD); 
    popMatrix();
  }
}














