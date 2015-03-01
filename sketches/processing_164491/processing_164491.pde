


float depth = 256;// acompanies width and height
float cubeSize = 4;// spacing between test points for force fields
float density = 0.01/pow(cubeSize,3);// mass per unit volume
int pointSampling = round(cubeSize);// in case it was a float
float spring = 0.01;// cube surface
float spring2 = 0.3;// joint translation
float spring3 = 50;// joint rotation
float damping = 0.005;// cube surface
float damping2 = 0.1;// joint translation
float damping3 = 1;// joint rotation
float damping4 = 8;// global rotation
float grav = 0.01;// gravity
int iterationsPerFrame = 3;// speeds up the sim
float randVel = PI/32;// initialization of angular speed
cube[] cubes;// each cube is a body part
joint[] joints;// each joint constrains translation
hemisphere[] hemispheres;// each hemisphere constrains rotation
mouseJoint mouseGripper;// a way of holding onto the doll
void setup(){
  size(400,300,P3D);
  ortho(-width/2, width/2, -height/2, height/2, -10, 10);
  // initialize class arrays
  cubes = new cube[10];
  joints = new joint[9];
  hemispheres = new hemisphere[66];
  // make a person
  reset();
  // dont draw a wire frame
  noStroke();
  // color the boxes
  fill(#FF8800);
  mouseGripper = new mouseJoint();
}
void reset(){
  // used at setup() and keyPressed()
  // to initialize the rag doll
   
  // make some mody parts with size and location
  // coordinates taken from a bitmap picture of a body
  cube head = new cube(5.5,8,6,11,6,0);
  cube torso = new cube(10,18,6,11,20,0);
  cube Rarm = new cube(4,10,4,3,17,0);
  cube Larm = new cube(4,10,4,19,17,0);
  cube Rforearm = new cube(4,12,4,3,29,0);
  cube Lforearm = new cube(4,12,4,19,29,0);
  cube Rthigh = new cube(4.5,12,4.5,8,36,0);
  cube Lthigh = new cube(4.5,12,4.5,14,36,0);
  cube Rcalf = new cube(4,16,4,8,51,0);
  cube Lcalf = new cube(4,16,4,14,51,0);
  // place the body parts in an array so they can be reffered to
  cubes[0] = head;
  cubes[1] = torso;
  cubes[2] = Rarm;
  cubes[3] = Larm;
  cubes[4] = Rforearm;
  cubes[5] = Lforearm;
  cubes[6] = Rthigh;
  cubes[7] = Lthigh;
  cubes[8] = Rcalf;
  cubes[9] = Lcalf;
  // makes some translational joints
  // coordinates taken from the same bitmap picture of a body
  joint neck = new joint(torso,head,0,-10,1,0,4,1);
  joint Rshoulder = new joint(torso,Rarm,-8,-6,0,0,-3,0);
  joint Lshoulder = new joint(torso,Larm,8,-6,0,0,-3,0);
  joint Relbow = new joint(Rarm,Rforearm,0,8,0,0,-4,0);
  joint Lelbow = new joint(Larm,Lforearm,0,8,0,0,-4,0);
  joint Rhip = new joint(torso,Rthigh,-3,12,0,0,-4,0);
  joint Lhip = new joint(torso,Lthigh,3,12,0,0,-4,0);
  joint Rknee = new joint(Rthigh,Rcalf,0,9,0,0,-6,0);
  joint Lknee = new joint(Lthigh,Lcalf,0,9,0,0,-6,0);
  // place the joints in an array so they can be reffered to
  joints[0] = neck;
  joints[1] = Rshoulder;
  joints[2] = Lshoulder;
  joints[3] = Relbow;
  joints[4] = Lelbow;
  joints[5] = Rhip;
  joints[6] = Lhip;
  joints[7] = Rknee;
  joints[8] = Lknee;
  // Hemispheres make sure that the angular domain of a joit
  // is such that it can only ocupy a hemisphere.
  // This hemisphere has a two vectors which can never have an
  // angle between them greater than 90 degrees.
  // It took several revisions to ensure that the joint didn't
  // get knocked out of the socket, and to prevent typos.
  // For instance the head must remain in a cone on the torso.
  // The head must also remain pointed in a forward direcion.
  // The knee must rotate on a single axis i.e. a slot.
  // So it uses two hemispheres on oposite vectors.
  hemispheres[0] = new hemisphere(torso,head,2,-1,0,0,-1,0);
  hemispheres[1] = new hemisphere(torso,head,-2,-1,0,0,-1,0);
  hemispheres[2] = new hemisphere(torso,head,0,-1,1,0,-1,0);
  hemispheres[3] = new hemisphere(torso,head,0,-1,-1,0,-1,0);
  hemispheres[4] = new hemisphere(torso,head,1,0,-1,0,0,-1);
  hemispheres[5] = new hemisphere(torso,head,-1,0,-1,0,0,-1);
  hemispheres[6] = new hemisphere(Rarm,torso,0,0,1,-1,0,0);
  hemispheres[7] = new hemisphere(Rarm,torso,0,0,-1,-1,0,0);
  hemispheres[8] = new hemisphere(Rarm,torso,-1,0,0,-1,0,0);
  hemispheres[9] = new hemisphere(Rarm,torso,0,1,0,-1,0,0);
  hemispheres[10] = new hemisphere(torso,Rarm,0,1,-1,0,1,0);
  hemispheres[11] = new hemisphere(torso,Rarm,0,1,-1,1,0,0);
  hemispheres[12] = new hemisphere(Larm,torso,0,0,1,1,0,0);
  hemispheres[13] = new hemisphere(Larm,torso,0,0,-1,1,0,0);
  hemispheres[14] = new hemisphere(Larm,torso,1,0,0,1,0,0);
  hemispheres[15] = new hemisphere(Larm,torso,0,1,0,1,0,0);
  hemispheres[16] = new hemisphere(torso,Larm,0,1,-1,0,1,0);
  hemispheres[17] = new hemisphere(torso,Larm,0,1,-1,-1,0,0);
  hemispheres[18] = new hemisphere(Rarm,Rforearm,0,1,0,0,1,0);
  hemispheres[19] = new hemisphere(Rarm,Rforearm,0,0,-1,0,1,0);
  hemispheres[20] = new hemisphere(Rarm,Rforearm,1,0,-1,0,1,0);
  hemispheres[21] = new hemisphere(Rarm,Rforearm,-1,0,-1,0,1,0);
  hemispheres[22] = new hemisphere(Rarm,Rforearm,1,0,0,0,0,-1);
  hemispheres[23] = new hemisphere(Rarm,Rforearm,-1,0,0,0,0,-1);
  hemispheres[24] = new hemisphere(Rarm,Rforearm,0,0,-1,0,0,-1);
  hemispheres[25] = new hemisphere(Rarm,Rforearm,-1,0,0,-1,0,0);
  hemispheres[26] = new hemisphere(Larm,Lforearm,0,1,0,0,1,0);
  hemispheres[27] = new hemisphere(Larm,Lforearm,0,0,-1,0,1,0);
  hemispheres[28] = new hemisphere(Larm,Lforearm,-1,0,-1,0,1,0);
  hemispheres[29] = new hemisphere(Larm,Lforearm,1,0,-1,0,1,0);
  hemispheres[30] = new hemisphere(Larm,Lforearm,1,0,0,0,0,-1);
  hemispheres[31] = new hemisphere(Larm,Lforearm,-1,0,0,0,0,-1);
  hemispheres[32] = new hemisphere(Larm,Lforearm,0,0,-1,0,0,-1);
  hemispheres[33] = new hemisphere(Rarm,Rforearm,1,0,0,1,0,0);
  hemispheres[34] = new hemisphere(torso,Rthigh,-1,0,0,0,1,0);
  hemispheres[35] = new hemisphere(torso,Rthigh,0,1,0,0,1,0);
  hemispheres[36] = new hemisphere(torso,Rthigh,0,0,-1,0,1,0);
  hemispheres[37] = new hemisphere(torso,Rthigh,1,1,-1,0,1,0);
  hemispheres[38] = new hemisphere(torso,Rthigh,-1,0,0,0,0,1);
  hemispheres[39] = new hemisphere(torso,Rthigh,1,0,0,0,0,1);
  hemispheres[40] = new hemisphere(torso,Rthigh,0,0,1,0,0,1);
  hemispheres[41] = new hemisphere(torso,Rthigh,-1,0,0,-1,0,0);
  hemispheres[42] = new hemisphere(torso,Lthigh,1,0,0,0,1,0);
  hemispheres[43] = new hemisphere(torso,Lthigh,0,1,0,0,1,0);
  hemispheres[44] = new hemisphere(torso,Lthigh,0,0,-1,0,1,0);
  hemispheres[45] = new hemisphere(torso,Lthigh,-1,1,-1,0,1,0);
  hemispheres[46] = new hemisphere(torso,Lthigh,1,0,0,0,0,1);
  hemispheres[47] = new hemisphere(torso,Lthigh,-1,0,0,0,0,1);
  hemispheres[48] = new hemisphere(torso,Lthigh,0,0,1,0,0,1);
  hemispheres[49] = new hemisphere(torso,Lthigh,1,0,0,1,0,0);
  hemispheres[50] = new hemisphere(Rthigh,Rcalf,0,1,0,0,1,0);
  hemispheres[51] = new hemisphere(Rthigh,Rcalf,0,0,1,0,1,0);
  hemispheres[52] = new hemisphere(Rthigh,Rcalf,1,0,1,0,1,0);
  hemispheres[53] = new hemisphere(Rthigh,Rcalf,-1,0,1,0,1,0);
  hemispheres[54] = new hemisphere(Rthigh,Rcalf,1,0,0,0,0,1);
  hemispheres[55] = new hemisphere(Rthigh,Rcalf,-1,0,0,0,0,1);
  hemispheres[56] = new hemisphere(Rthigh,Rcalf,0,0,1,0,0,1);
  hemispheres[57] = new hemisphere(Rthigh,Rcalf,-1,0,0,-1,0,0);
  hemispheres[58] = new hemisphere(Lthigh,Lcalf,0,1,0,0,1,0);
  hemispheres[59] = new hemisphere(Lthigh,Lcalf,0,0,1,0,1,0);
  hemispheres[60] = new hemisphere(Lthigh,Lcalf,1,0,1,0,1,0);
  hemispheres[61] = new hemisphere(Lthigh,Lcalf,-1,0,1,0,1,0);
  hemispheres[62] = new hemisphere(Lthigh,Lcalf,1,0,0,0,0,1);
  hemispheres[63] = new hemisphere(Lthigh,Lcalf,-1,0,0,0,0,1);
  hemispheres[64] = new hemisphere(Lthigh,Lcalf,0,0,1,0,0,1);
  hemispheres[65] = new hemisphere(Lthigh,Lcalf,1,0,0,1,0,0);
  // Send the rag doll to the center of the screen.
  // This includes the z domain "depth".
  for(int i=0;i<cubes.length;i++){
    cubes[i].loc.add(width/2-11*cubeSize,
      height/2-24*cubeSize,depth/2);
  }
}
void draw(){
  // monitor the frame rate
  if(frameCount%60==0){println(frameRate);}
  // make the background blue purple
  background(#8800FF);
  // apply some lighting
  directionalLight(255, 255, 255, -1, 1, -1);
  directionalLight(128, 128, 128, 1, -1, 1);
  // multiple iterations per frame speeds up the simulation
  for(int m=0;m<iterationsPerFrame;m++){
    for(int i=0;i<cubes.length;i++){
      for(int j=0;j<cubes.length;j++){
        if(i!=j){// if cube is not its-slef
          // each cube reacts with the other
          // one vs other then other vs one
          cubes[i].collide(cubes[j]);
        }
      }
    }
    for(int i=0;i<joints.length;i++){
      // joints apply forces which constrain translation
      joints[i].update();
    }
    for(int i=0;i<hemispheres.length;i++){
      // hemispheres apply torques which constrain rotation
      hemispheres[i].update();
    }
    if(mousePressed){
      // mouseGripper applies a force which constrains translation
      mouseGripper.update();
    }
    for(int i=0;i<cubes.length;i++){
      // walls apply forces which keep the doll on screen
      cubes[i].walls();
      // cubes integrate forces to find velocities
      // cubes integrate velocities to find locations
      cubes[i].update();
    }
  }
  for(int i=0;i<cubes.length;i++){
    // vertecies drawn to the screen are referenced
    // both as a 3 index matrix and a 1 index array
    PVector[][][] verts = new PVector[2][2][2];
    PVector[] verts2 = new PVector[8];
    for(int a=0;a<=1;a++){
      for(int b=0;b<=1;b++){
        for(int c=0;c<=1;c++){
          // vertex components are initialized
          // to ether 0.5 or -0.5
          // to make a cube with a width of 1
          verts[a][b][c] = new PVector(a-0.5,b-0.5,c-0.5);
        }
      }
    }
    // verts are also refered to as an array
    verts2[0] = verts[0][0][0];
    verts2[1] = verts[1][0][0];
    verts2[2] = verts[0][1][0];
    verts2[3] = verts[0][0][1];
    verts2[4] = verts[1][1][0];
    verts2[5] = verts[1][0][1];
    verts2[6] = verts[0][1][1];
    verts2[7] = verts[1][1][1];
    for(int j=0;j<8;j++){
      // expand verts by cube size
      verts2[j].x *= cubes[i].size.x;
      verts2[j].y *= cubes[i].size.y;
      verts2[j].z *= cubes[i].size.z;
      // convert verts from object to world coordinates
      verts2[j] = cubes[i].ori.toWorld(verts2[j]);
      // translate verts by object location
      verts2[j].add(cubes[i].loc);
    }
    // i dont know why this isnt done automaticaly,
    // fill matrix values with array values
    verts[0][0][0] = verts2[0];
    verts[1][0][0] = verts2[1];
    verts[0][1][0] = verts2[2];
    verts[0][0][1] = verts2[3];
    verts[1][1][0] = verts2[4];
    verts[1][0][1] = verts2[5];
    verts[0][1][1] = verts2[6];
    verts[1][1][1] = verts2[7];
    // vertexes are referenced in a sequence which draws a cube
    int[] vertA = new int[6*2*3];// x component
    int[] vertB = new int[6*2*3];// y component
    int[] vertC = new int[6*2*3];// z component
     
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
      // matrix indexes are ether 0 or 1
      if(vertA[j]==-1){vertA[j]=0;}
      if(vertB[j]==-1){vertB[j]=0;}
      if(vertC[j]==-1){vertC[j]=0;}
    }
    beginShape(TRIANGLES);
    // there are 6 sides, 2 triangles per side
    // and 3 corners per triangle
    for(int j=0;j<6*2*3;j++){
      // there must be a better way to do this
      vertex(verts[vertA[j]][vertB[j]][vertC[j]].x,
        verts[vertA[j]][vertB[j]][vertC[j]].y,
        -verts[vertA[j]][vertB[j]][vertC[j]].z);
      // z axis is inverted for rendering purposes
    }
    endShape();
  }
}
void mousePressed(){
  // determine if the mouse grips the doll
  PVector mouse = new PVector(mouseX,mouseY);
  boolean done = false;
  // start testing a point at the back of the box
  mouse.z = depth;
  while(mouse.z>0&&done==false){
    for(int i=0;i<cubes.length;i++){
      // if the test point is inside the cube being tested
      if(cubes[i].isInCube(mouse)){
        // mouse gripper is reinitialized
        // using the cube as its target
        // and using the location on the cubes coordinates
        // as the point of constraint
        mouseGripper = new mouseJoint(cubes[i],
          cubes[i].ori.toOri(PVector.sub(mouse,cubes[i].loc)));
//        done = true;
// // alternative method for grabing from the back instead
      }
    }
    // incriment the depth of the tested point
    mouse.z -= cubeSize;
  }
}
void mouseReleased(){
  mouseGripper.nullify();// stop holding on
}
void keyPressed(){
  if(key==' '){reset();}// reinitializes the rag doll
}
class cube{
  // i first developed them as cubes
  // i later extended them to be rectangular prisims
  PVector loc;// location of center of mass
  PVector vel;// velocity at center of mass
  // a aplace to store relative velocity damping
  // without having to modify the velocity
  PVector force;// force sum
  orient ori;// a set of rotatable object coordinates
  // see SmallAngle.pde
  PVector angVel;// angular velocity vector
  PVector torque;// angular impulse vector
  PVector size;// width, height and depth of a rectangular prisim
  float mass;// gives each body part relative mass
  // principal components of the angular moment of inertia
  PVector momentOfIniertia;// typo, inertia not iniertia
  cube(float w,float h,float d,
       float x,float y,float z){
    // size width, height, depth
    // location x, y, z,
    loc = new PVector(x*cubeSize,y*cubeSize,z*cubeSize);
    vel = new PVector();// zero vectors are initialized
    force = new PVector();
    ori = new orient();// initialize orientation
    angVel = new PVector(
      random(-randVel,randVel),
      random(-randVel,randVel),
      random(-randVel,randVel));// randomize the angular velocity
    torque = new PVector();
    size = new PVector(w*cubeSize,h*cubeSize,d*cubeSize);
    // mass is proportional to volume and mass per unit volume
    mass = size.x*size.y*size.z*density;
    // principal moment of inertia
    // assumes zero products of inertia
    momentOfIniertia = new PVector(
      mass*(sq(size.y)+sq(size.z))/12f,
      mass*(sq(size.x)+sq(size.z))/12f,
      mass*(sq(size.x)+sq(size.y))/12f);
  }
  void applyForce(PVector F,PVector R){
    // forces induce torques
    force.add(F);
    // torque is the cross product of the moment arm and force
    torque.add(PVector.sub(R,loc).cross(F));
  }
  boolean isInCube(PVector r){
    // a test to deterimine whether a point is inside the cube
    // subtract center of gravity and rotate to object coordinates
    PVector R = ori.toOri(PVector.sub(r,loc));
    boolean val = false;// default answer is false
    // if point is inside domain for all axis then test is true
    if(abs(R.x)<size.x/2
      &&abs(R.y)<size.y/2
      &&abs(R.z)<size.z/2){val = true;}
    return val;
  }
  PVector forceField(PVector r){
    // subtract center of gravity and rotate to object coordinates
    PVector R = ori.toOri(PVector.sub(r,loc));
    // force field is the smalles force required to
    // expell the test point R from the box.
    // start with the positive x force
    float fpx = -spring*(R.x-size.x/2);
    PVector F = new PVector(fpx,0,0);
    float fnx = -spring*(R.x+size.x/2);
    // if the negative x force is less
    // set F to be in the negative x direction
    if(abs(fnx)<F.mag()){F=new PVector(fnx,0,0);}
    float fpy = -spring*(R.y-size.y/2);
    // if the positive y force is less
    // set F to be in the positive y direction
    if(abs(fpy)<F.mag()){F=new PVector(0,fpy,0);}
    float fny = -spring*(R.y+size.y/2);
    // repeat for the others...
    if(abs(fny)<F.mag()){F=new PVector(0,fny,0);}
    float fpz = -spring*(R.z-size.z/2);
    if(abs(fpz)<F.mag()){F=new PVector(0,0,fpz);}
    float fnz = -spring*(R.z+size.z/2);
    if(abs(fnz)<F.mag()){F=new PVector(0,0,fnz);}
    // restore rotation to world coordinates
    return ori.toWorld(F);
  }
  PVector[] testPoints(){
    // Provides an array of points
    // with which to test a force field.
    // Count the number of points in each direction.
    int a = ceil(size.x/pointSampling);
    int b = ceil(size.y/pointSampling);
    int c = ceil(size.z/pointSampling);
    // initialize an array to store the points in
    PVector[] tp = new PVector[
      (a+1)*(b+1)*(c+1)];
//      (a+1)*(b+1)*(c+1)-(a-1)*(b-1)*(c-1)];
// // alternate code to allow for a hollow box
    int index = 0;
    for(int i=0;i<=a;i++){
      for(int j=0;j<=b;j++){
        for(int k=0;k<=c;k++){
//          if(i==0||i==a||j==0||j==b||k==0||k==c){
// // alternate code to allow for a hollow box
            // ensure that points are on the surface of the box
            tp[index] = new PVector(
              size.x*(i*1f/a-0.5),
              size.y*(j*1f/b-0.5),
              size.z*(k*1f/c-0.5));
            // change from object to world coordinates
            // add center of object
            tp[index] = PVector.add(ori.toWorld(tp[index]),loc);
            index++;
        }
      }
    }
    return tp;
  }
  PVector totalVelAt(PVector R){
    // The velocity of a test point is due to both
    // rotation as well as translation.
    // Velocity of a surface is the cross product of
    // angular velocity and the arm being rotated.
    return PVector.add(vel,angVel.cross(PVector.sub(R,loc)));
  }
  void collide(cube C){
    // Handles collision detection and physics.
    // get the relative position
    PVector dx = PVector.sub(C.loc,loc);
    // if they are nowhere near each other dont collide
    if(dx.mag()<C.size.mag()/2+size.mag()/2){
      // get a list of points to test a force field
      PVector[] tp = testPoints();
      for(int i=0;i<tp.length;i++){
        PVector R = tp[i];
        // if the test point is inside the cube
        if(C.isInCube(R)){
          // the force which acts on the test point is
          // the force field plus
          // damping times relative velocity of the objects
          PVector F = PVector.add(
            C.forceField(R),PVector.mult(PVector.sub(
            C.totalVelAt(R),totalVelAt(R)),damping));
          // force is applied equal and opposite to both objects
          applyForce(F,R);
          F.mult(-1);
          C.applyForce(F,R);
        }
      }
    }
  }
  void update(){
    // acceleration is force devided by mass
    vel.add(PVector.mult(force,1f/mass));
    // reset force sum to zero, add gravitational force
    force = new PVector(0,grav*mass,0);
    // translation is proportional to velocity
    loc.add(vel);
    // I dont know if this is an acurate method.
    // Angular acceleration is simplified to the
    // two dimensional problem.
    // Coordinates are changed to object coords.
    torque = ori.toOri(torque);
    // angular acceleration is torque over moment
    torque.x /= momentOfIniertia.x;
    torque.y /= momentOfIniertia.y;
    torque.z /= momentOfIniertia.z;
    // Coordinates are changed to world coords.
    torque = ori.toWorld(torque);
    angVel.add(torque);// angular acceleration
    // if angular stability is comprimized, limit the solution
    angVel.limit(PI/16);// limit angular velocity
    torque = new PVector();// reset torque sum
    ori.spin(angVel);// rotates the object coordinate system
  }
  boolean wallHit(){
    // if the cube is close enough to the wall
    // for any of the corners to touch the wall
    // more testing is needed
    boolean val = false;
    float testL = size.mag()/2;
    if(loc.x<testL){val=true;}
    if(loc.x>width-testL){val=true;}
    if(loc.y<testL){val=true;}
    if(loc.y>height-testL){val=true;}
    if(loc.z<testL){val=true;}
    if(loc.z>depth-testL){val=true;}
    return val;
  }
  PVector wallFeild(PVector R){
    // a force field which pushes a point back
    PVector F = new PVector();
    boolean stick = false;// triggers wall damping
    if(R.x<0){F.x=-R.x*spring;stick=true;}
    if(R.x>width){F.x=-(R.x-width)*spring;stick=true;}
    if(R.y<0){F.y=-R.y*spring;stick=true;}
    if(R.y>height){F.y=-(R.y-height)*spring;stick=true;}
    if(R.z<0){F.z=-R.z*spring;}
    if(R.z>depth){F.z=-(R.z-depth)*spring;}
    // if stick calculate velocity damping
    if(stick){F.sub(PVector.mult(totalVelAt(R),damping));}
    return F;
  }
  void walls(){
    // initial test to see if other testing is needed
    if(wallHit()){
      // Note its not efficeint to call testPoints()
      // more than once per iteration because
      // it doesn't change.
      // get some points to test
      PVector[] tp = testPoints();
      for(int i=0;i<tp.length;i++){
        PVector R = tp[i];
        applyForce(wallFeild(R),R);// wall force field
      }
    }
  }
}
class joint{
  cube A;// first cube to connect
  cube B;// second cube to connect
  PVector r1;// location on cube A coordinates
  PVector r2;// location on cube B coordinates
  joint(cube Ao,cube Bo,
    float x1,float y1,float z1,
    float x2,float y2,float z2){
    A = Ao;
    B = Bo;
    r1 = new PVector(x1,y1,z1);
    r1.mult(cubeSize);
    r2 = new PVector(x2,y2,z2);
    r2.mult(cubeSize);
  }
  void update(){
    // applies a constraint force to both cubes
    // convert to world coordinates
    PVector R1 = PVector.add(A.loc,A.ori.toWorld(r1));
    PVector R2 = PVector.add(B.loc,B.ori.toWorld(r2));
    // calculate a vector wich points from cube A to cube B
    PVector dx = PVector.sub(R2,R1);
    // calculate spring force
    float F = dx.mag()*spring2;
    dx.normalize();// make dx a unit vector
    // calculate damping force
    float D = dx.dot(PVector.sub(
      B.totalVelAt(R2),A.totalVelAt(R1)))*damping2;
    dx.mult(F+D);// make the magnitude of dx a force sum
    // force is applied equal and opposite to both objects
    A.applyForce(dx,R1);
    dx.mult(-1);
    B.applyForce(dx,R2);
    // provide a torque wich opposes relative angular velocity
    PVector dAngVel = PVector.sub(B.angVel,A.angVel);
    dAngVel.mult(damping4);
    // torque is applied equal and opposite to both objects
    A.torque.add(dAngVel);
    B.torque.sub(dAngVel);
  }
}
class mouseJoint{
  // provides a method for holding onto a rag doll apendage
  boolean active;// if mousePressed, active = true
  cube held;// a reference to the object being grabbed
  PVector loc;// location of the joint on the object coordinates
  mouseJoint(cube h,PVector L){
    held = h;
    loc = L;
    active = true;
  }
  mouseJoint(){
    // allows it to be initialized without being activated
    active = false;
  }
  void nullify(){
    // executed at mouseReleased()
    active = false;
  }
  void update(){
    if(active){
      // get some information about the mouse
      PVector mouse = new PVector(mouseX,mouseY);
      PVector pmouse = new PVector(pmouseX,pmouseY);
      PVector vmouse = PVector.sub(mouse,pmouse);
      // time is relative to itteration rate not frame rate
      vmouse.mult(1f/iterationsPerFrame);
      // convert to world coordinates from object coordinates
      PVector R = PVector.add(held.loc,held.ori.toWorld(loc));
      mouse.z = R.z;// mouse doesn't have a z coordinate
      PVector dx = PVector.sub(mouse,R);
      float F = dx.mag()*0.05;// spring force of the mouse
      dx.normalize();// make dx a unit vector
      float D = dx.dot(PVector.sub(
        vmouse,held.totalVelAt(R)))*0.5;
      dx.mult(F+D);// make the magnitude of dx a force sum
      held.applyForce(dx,R);
    }
  }
}
class hemisphere{
  cube A;// first cube to connect
  cube B;// second cube to connect
  PVector r1;// a direction vector on A coordinates
  PVector r2;// a direction vector on B coordinates
  hemisphere(cube Ao,cube Bo,
    float x1,float y1,float z1,
    float x2,float y2,float z2){
    A = Ao;
    B = Bo;
    r1 = new PVector(x1,y1,z1);
    r1.normalize();
    r2 = new PVector(x2,y2,z2);
    r2.normalize();
  }
  void update(){
    PVector R1 = A.ori.toWorld(r1);// change to world coordintates
    PVector R2 = B.ori.toWorld(r2);
    float w = PVector.angleBetween(R1,R2);
    // angle free to roam inside the hemisphere
    if(w>PI/2){// but on the outside of that hemisphere...
      // get a unit vector perpendicular to both R1 and R2
      PVector T = R1.cross(R2);
      T.normalize();
      // to ensure stability of this joint
      // additional damping is provided
      // such that the damping only acts parallel to the torque
      PVector dAngVel = PVector.sub(B.angVel,A.angVel);
      float D = T.dot(dAngVel)*damping3;
      T.mult((w-PI/2)*spring3+D);// calculate spring force
      // torque is applied equal and opposite
      A.torque.add(T);
      B.torque.sub(T);
    }
  }

 
