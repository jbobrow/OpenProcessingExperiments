
/**

  Aurora by Kof, 2013
 
 
 ,dPYb,                  ,dPYb,
 IP'`Yb                  IP'`Yb
 I8  8I                  I8  8I
 I8  8bgg,               I8  8'
 I8 dP" "8    ,ggggg,    I8 dP
 I8d8bggP"   dP"  "Y8ggg I8dP
 I8P' "Yb,  i8'    ,8I   I8P
 ,d8    `Yb,,d8,   ,d8'  ,d8b,_
 88P      Y8P"Y8888P"    PI8"8888
                         I8 `8,
                         I8  `8,
                         I8   8I
                         I8   8I
                         I8, ,8'
                         "Y8P'
 */


boolean HELPERS = false;

PMatrix3D cam;
float R;
PVector helperPoint;



float X, Y, rotx, roty;
PVector x, y, d;


ArrayList traces;

////////////////////////////////////////////////////


boolean DRAWING = false;
int INTERVAL = 200;
float SPEED = 10000.0;
float SKIP = 0;

float SMOOTH_ROT = 30.0;

boolean ROTATING = false;
float ROTATION_Y = 0;
float ROTATION_X = 0;
float TARGET_ROTATION_Y = 0;
float TARGET_ROTATION_X = 0;
float ROT_START_X = 0;
float ROT_START_Y = 0;

void setup() {
  size(512, 512, P3D);
  // magic here
  R = sqrt(width*width+height*height)/1.92;
  cam = new PMatrix3D();

  traces = new ArrayList();


  ROT_START_X = 0;
  ROT_START_Y = 0;

  noSmooth();

  colorMode(HSB, 255);
  background(0);
}

void calcCoords() {

  x = cam.mult(new PVector(1, 0, 0), new PVector(0, 0, 0));
  y = cam.mult(new PVector(0, 1, 0), new PVector(0, 0, 0));
  d = x.cross(y); 
  d.normalize(); 
  d.mult(R);
}


void draw() {
  resetMatrix();

  tint(255, 12);
  blend(g, 0, 0, width, height, -4, -4, width+6, height+6, BLEND);


  if (frameCount%INTERVAL==0 && !DRAWING) {
    Trace tmp = new Trace(); 
    traces.add(tmp);
    tmp.start();

    ROTATING = true;
    TARGET_ROTATION_Y = ROTATION_Y;
    TARGET_ROTATION_X = ROTATION_X;
    ROT_START_X = X-width/2;
    ROT_START_Y = Y-height/2;

    DRAWING = true;

    SKIP += 3000.0;
  }
  else if (frameCount%INTERVAL==0 && DRAWING) {
    try {
      Trace tmp = (Trace)traces.get(traces.size()-1);
      tmp.stop();
    }
    catch(Exception e) {
      ;
    } 

    DRAWING = false;
  }




  X = width*noise(frameCount/SPEED+SKIP, 0)-width/2;
  Y = height*noise(0, frameCount/SPEED+SKIP)-height/2;

  ROTATING = true;


  if (ROTATING) {
    TARGET_ROTATION_Y = -radians(X-ROT_START_X)/400.0;
    TARGET_ROTATION_X = radians(Y-ROT_START_Y)/400.0;
  }

  TARGET_ROTATION_X *= 0.9;
  TARGET_ROTATION_Y *= 0.9;

  ROTATION_X += (TARGET_ROTATION_X-ROTATION_X) / SMOOTH_ROT;
  ROTATION_Y += (TARGET_ROTATION_Y-ROTATION_Y) / SMOOTH_ROT;


  calcCoords();
  cam.rotateX(ROTATION_X);
  cam.rotateY(ROTATION_Y);

  helperPoint = new PVector(x.cross(y).x*R/2.0, x.cross(y).y*R/2.0, x.cross(y).z*R/2.0);

  if (HELPERS) {
    float siz = 100.0;
    line(helperPoint.x-siz, helperPoint.y, helperPoint.z, helperPoint.x+siz, helperPoint.y, helperPoint.z);
    line(helperPoint.x, helperPoint.y-siz, helperPoint.z, helperPoint.x, helperPoint.y+siz, helperPoint.z);
    line(helperPoint.x, helperPoint.y, helperPoint.z-siz, helperPoint.x, helperPoint.y, helperPoint.z+siz);
  };

  camera( d.x, d.y, d.z, 0, 0, 0, y.x, y.y, y.z);

  if (HELPERS) {
    stroke(#ff0000);
    line(0, 0, 0, x.x*200, x.y*200, x.z*200);
    stroke(#00ff00);
    line(0, 0, 0, y.x*200, y.y*200, y.z*200);
    stroke(#0000ff);
    line(0, 0, 0, d.x/R+100, d.y/R, d.z/R);
    line(0, 0, 0, d.x/R, d.y/R+100, d.z/R);
    line(0, 0, 0, d.x/R, d.y/R, d.z/R+100);
  }

  for (int i = 0 ; i < traces.size();i++) {
    Trace t  = (Trace)traces.get(i);
    t.drawShape();
  }

  noFill();
  stroke(255, 120);
}


