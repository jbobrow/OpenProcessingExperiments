
boolean pause = false; 
 
int maxWalkers = 200; 
int branchLimit = 4; 
int branchFreq = 50; // tree: 10   twisty: 7 
float VELCAP = 1;   //  tree: 1    twisty: 5 
float ACCEL = 0.5;    //  tree: 0.5  twisty: 2 
int ROOT_R = 40; 
int ROOT_G = 30; 
int ROOT_B = 0; 
 
float WEIGHT_MULT = 0.8; 
float WEIGHT_SUB = 1.5; 
float WEIGHT_DIV = 2; 
 
int numWalkers; 
int branchTimer; 
int branchCount; 
int coreX=0, coreY=0; 
 
 
 
class Angle{ 
  Angle(double deg) { 
    a = Math.toRadians(deg); 
  } 
  double a; // in radians 
  double getRadians() { 
    return a; 
  } 
  int getDegrees() { 
    return int( Math.round( Math.toDegrees(a) )); 
  } 
  void setRadians(double rad) { 
    a = rad; 
  } 
  void setDegrees(double deg) { 
    a = Math.toRadians(deg); 
  } 
} 
 
 
class Walker{ 
  float x, y, oldX, oldY; 
  float vx, vy; 
  Angle dir; 
  long dirX, dirY; // defines a direction to grow in 
  float weight; 
 
  Walker(float newx, float newy, Angle a, float w) { 
    //print( newx + ", " + newy + ", " + a.a + "n"); 
    x = newx; 
    y = newy; 
    dir = a; 
    dirX = Math.round( Math.sin( a.getRadians() ) * 3); 
    dirY = Math.round( Math.cos( a.getRadians() ) * 3); 
    //print( dirX + ", " + dirY ); 
    weight = w; 
  } 
 
  void render() { 
    stroke(ROOT_R*random(0.5,1), ROOT_G, ROOT_B); 
    strokeWeight( weight ); 
    line( int(oldX), int(oldY), int(x), int(y)); 
    point(int(x), int(y)); 
     
    // magic number alert! 
    stroke(200, random(120, 255), 0, (15 - weight) / 5 ); 
    strokeWeight( (15-weight)*random(4) ); 
    line( int(oldX), int(oldY), int(x), int(y)); 
  } 
 
  void walk() { 
    oldX = x; 
    oldY = y; 
    float ax = random(-ACCEL, ACCEL); 
    float ay = random(-ACCEL, ACCEL); 
    vx = constrain( vx+ax, -VELCAP, VELCAP); 
    vy = constrain( vy+ay, -VELCAP, VELCAP); 
    x += vx + dirX; 
    y += vy + dirY; 
    x = constrain( x, 0, width-1 ); 
    y = constrain( y, 0, height-1 ); 
  } 
} 
 
Walker[] myWalkers = new Walker[maxWalkers]; 
 
void setup() { 
  smooth(); 
  size(300, 750); 
  background(0); 
  loop(); 
  frameRate(30); 
  
  if (coreX == 0) coreX = round(random( 100, 500 )); 
  if (coreY == 0) coreY = round(random( 100, 500 )); 
 
  drawNew();   
} 
 
void drawNew() { 
  pause = false; 
  myWalkers = new Walker[maxWalkers];   
  numWalkers = 0; 
  branchCount = 0; 
  branchTimer = 0; 
 
  fill(0, 300); 
  noStroke(); 
  rect(0,0,width,height); 
 
  numWalkers = 0; 
  addWalker(0); 
  //addWalker(60); 
  //addWalker(120); 
  addWalker(180); 
  //addWalker(240); 
  //addWalker(300); 
   
   
} 
 
void draw() { 
/*  if (!pause){ 
    noStroke(); 
    fill(255,1); 
    rect(0,0,width,height); 
  } 
  */ 
   
  branchTimer++; 
  int count = numWalkers; 
   
  boolean branch = false; 
  if (branchTimer % branchFreq == 0) { 
    branch = true; 
    branchCount++; 
  } 
 
  for (int x=0; x < count; x++) 
  { 
    if (pause != true) { 
      myWalkers[x].walk(); 
      myWalkers[x].render(); 
    } 
     
    //if ( int(random(0,25)) == 1 ) 
    if (branch) 
    { 
      int degreeChange = int( random( -40, 40 ) ); 
      addWalker(myWalkers[x].x, myWalkers[x].y,  
                (myWalkers[x].dir.getDegrees() + degreeChange)); 
      myWalkers[x].weight = weightCalc(); 
    }         
  } 
 
  if ( branchCount > branchLimit ) { 
    pause = true; 
  } 
} 
 
void addWalker( int degrees ) { 
  addWalker(coreX, coreY, degrees); 
} 
 
void addWalker( float x, float y, int degrees) { 
  if (numWalkers == maxWalkers){ 
    return; 
  } 
  float weight = weightCalc(); 
  //print (branchCount + ", " + weight + "n"); 
  myWalkers[numWalkers] = new Walker(x, y, new Angle(degrees), weight); 
  numWalkers++; 
} 
 
float weightCalc() { 
  return pow(2, (branchLimit - (branchCount * WEIGHT_MULT) - WEIGHT_SUB) / WEIGHT_DIV ); 
} 
 
void mousePressed() { 
  coreX = mouseX; 
  coreY = mouseY; 
  drawNew(); 
} 

