
//todo: mouselook
//todo: angular momentum
//todo: make the jump less floaty

class Player{
  PVector pos, face, vel, accel;
  int plotx, ploty;

  float height = 1*METER; //camera
  
  int ASSUME_FPS = 30;
  int updateinterval = 33;
  int lastupdate = -500;

  //in meters per frame, at 30 frames per second
  float SNEAKINC = .1*METER;
  float RUNINC   = .15*METER;
  float JUMP_FORWARD = 3*METER;  
  PVector JUMP_UP = new PVector (0,0,10*METER);
  PVector GRAV    = new PVector (0,0,-.045*METER);

  float TURNINTERVAL = HALF_PI/30;
  float FRIC = 1;
  float BADSLOPE = .1; //of 90 degrees
  float FLIGHTCONTROL = .575; //control of your forward movement when not grounded
  float MOMENTUM = .2;
  
  boolean grounded = false;  

//=======================================================================================  
  Player(float _x, float _y, float _z) { 
    pos = new PVector(_x,_y,_z);
    face = new PVector(1,1,0);
    vel = new PVector();
    accel = new PVector();
  } 
  
 //=======================================================================================  
  void update() {
    //the order of operations here is really important.
    accel.add(GRAV); //needs to be at the start or end of loop, before vel.add(accel); but after accel.mult(momentum)
    
    //dofriction();
    vel.add(accel); 
    
    vel.limit((grounded||keytoggle[KEYSNEAK])?15:30);
   
    PVector velthisframe = vel.get();    
    velthisframe.mult(ASSUME_FPS / frameRate );
    pos.add(velthisframe);
    
    accel.mult(MOMENTUM * ASSUME_FPS / frameRate );

    pushup(); //needs to be at the end, keeps you in the map
    
    plotx=floor(pos.x/PLOTM);
    ploty=floor(pos.y/PLOTM);
  }
  
//======================================================================================= 
  void repeatkeys(){
    float movespeed = (keytoggle[KEYSNEAK]?SNEAKINC:RUNINC) * (grounded?1:FLIGHTCONTROL );
    if (keys[KEYUP])    move( 0,  movespeed );
    if (keys[KEYDOWN])  move( PI, movespeed );
    if (keys[KEYRIGHT]) turn(-TURNINTERVAL);
    if (keys[KEYLEFT])  turn(TURNINTERVAL);
  }

//======================================================================================= 
  void move(float _movedir, float _vel) {
    PVector f = tovector( toradians(face)+_movedir );
    f.normalize();
    f.mult(_vel);     
    accel.add(f);
  }
  
//=======================================================================================  
  void turn(float _addx){
    float faceradians = toradians(face) -_addx;
    float z = face.z;
    face = tovector(faceradians,z);
  }

//=======================================================================================  
  void pushup(){
    float landheight = land(pos.x,  pos.y) + height;
    grounded = pos.z < landheight;   
    if (grounded)
      pos.z = landheight;
  }  
//=======================================================================================
  void dofriction(){ //not currently working
    PVector friction = vel.get();
    friction.normalize();
    friction.mult(-FRIC);
    accel.add(friction);
  }
  
//=======================================================================================  
  void jump(){
    if (!grounded) return;
    if (keys[KEYUP])    player.move(0,JUMP_FORWARD);
    if (keys[KEYDOWN])  player.move(PI,JUMP_FORWARD);
    accel.add(JUMP_UP);  
  }
  

//=======================================================================================  
  void cam3d() {
    hint(ENABLE_DEPTH_TEST);
                camera(pos.x,pos.y,pos.z, pos.x+face.x, pos.y+face.y, pos.z+face.z, 0,0,-1);
    pick.buffer.camera(pos.x,pos.y,pos.z, pos.x+face.x, pos.y+face.y, pos.z+face.z, 0,0,-1);
  }
  
}


