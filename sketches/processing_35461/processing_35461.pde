
//ringconstrain v1.0 by stanley_formo and PO CHEN, columbia GSAPP nov 2006
//Algorithmic advanced design class Columbia GSAPP nov 2006. Mentor; Toru Hasegawa and Mark Collins

int N =2; 
Circle[] CircleNumber = new Circle[550]; //Circle[] CircleAdd = new Circle[2];

float scaleFactor = 5;
float speedFactor = 0.05;

//////////////////////////////////////////////////////////////
void setup() { 
  size(450, 450); 
  background(255); 
  stroke(200);
  noFill();
  smooth();
  // CircleNumber = new Circle[5];
  for (int i=0; i<CircleNumber.length; i++) {
    CircleNumber[i] = new Circle(i, i-1, (sin(radians(i*30))+1.5)*scaleFactor, speedFactor);
  }
}
//////////////////////////////////////////////////////////////
void draw() {
  background(255);
  // for(int i=1;i<=N;i++){
  CircleNumber[N].map();
  //}
  //N = N+1; 
  //CircleNumber = expand(CircleNumber, N);
  if ((frameCount%25) ==0) N++;
}

void mousePressed() {
  N = N+1; 
  // CircleNumber = expand(CircleNumber, N);

  saveFrame("screen-0014.jpg");
}
//////////////////////////////////////////////////////////////
class Circle {

  float x = width/2; 
  float y = height/2; 
  float radius;  
  float angle; 
  float sumAngle;
  int Parent;
  int me;
  float sp;
  int lock=0;
  int myFill= 20;

  Circle(int myName, int myParent, float intRadius, float speed) {

    angle = 0;
    Parent = myParent;
    radius = intRadius;
    me = myName;
    sp = speed;
  }

  void map() {
    sumAngle=0;
    if (me > 0) {
      CircleNumber[me-1].map();
      sumAngle = CircleNumber[Parent].sumAngle + angle;
      float dx = cos(radians(sumAngle))*(radius + CircleNumber[Parent].radius);
      float dy = sin(radians(sumAngle))*(radius + CircleNumber[Parent].radius); 
      x = CircleNumber[Parent].x + dx;
      y = CircleNumber[Parent].y + dy;
      int lockCheck = checkOverlap();
      if (lockCheck ==1) {
        lock = 1;
        for (int i = 0; i<me;i++) {        // This loop is to lock the circles that are between two locked circles to avoid unwanted collisions.
          CircleNumber[i].lock = 1;
        }
        // CircleNumber[Parent].lock = lock;
        myFill = 60;
      }
      if (lock==0) {
        angle = angle + sp;
      }
    }
    stroke(20); 
    fill((angle/3), 0, 0, myFill);          // This is to see which circles are detecting intersection.
    ellipse(x, y, 2*radius, 2*radius);
  }

  int checkOverlap() {
    int isLocked=0;
    for (int i=0; i <= N; i++) {
      if ((i != (me+1)) && (i != me) && (i != (me-1))) {      // This is where you were having a few issues of what it was checking against.
        float distance = dist(CircleNumber[i].x, CircleNumber[i].y, x, y);
        if (distance <= (radius + CircleNumber[i].radius)) {
          isLocked = 1;
          // print (i+" is locked\n");
          i=N;      // By making i=N, it will stop the escape the loop.
        }
      }
    }
    return (isLocked);
  }
}

// Guys, it looks good.  Try playing around with the levers of how you draw the string of circles (right now is a sin wave scaled)
// also the speed.  But I think it is making an intersting pattern in terms of coloring the different conditions alone.  So it might
// be worth playing around with how you color code the circles.  The isosurface looks good, its good to see you guys have a handle on it.
// Try using more images and making it more volumetric.


