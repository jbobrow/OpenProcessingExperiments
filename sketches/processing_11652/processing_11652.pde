
//harmonograph
// http://en.wikipedia.org/wiki/Harmonograph

boolean rainbow_color = true;
//boolean rainbow_color = false;
int sd = 1233; // random seed value
float base_damp = 0.0005;

float[] damping = new float[4];
//damping = {0, 0, 0, 0};

float a1 = 190;              // amplitude as you like
float f1 = 1.001;            //keep frequencies around 1
float p1 = radians(34);
float d1;

float a2 = 180;
float f2 = 1.001;
float p2 = radians(33);
float d2;

float a3 = 190;
float f3 = 1.004;
float p3 = radians(34+90);
float d3;

float a4 = 17;
float f4 = 1.000;
float p4 = radians(43+90);
float d4;

int dim = 950;
int xdim = dim;
int ydim = dim;

String fname = "harmonograph_" + year() + month() + day() + hour() + minute() + second();
PrintWriter log;

float mo(float t, float a1, float f1, float p1, float d1, float a2, float f2, float p2, float d2) {
  return a1*sin(t*f1+p1)*exp(-1*d1*t) + a2*sin(t*f2+p2)*exp(-1*d2*t);
}

void setup() {
  size(xdim,ydim, P2D);
  background(0);
  if (rainbow_color) {
    colorMode(HSB, 100);
  } 
  else {
    stroke(255,0,0);
  }
  frameRate(200);
  randomSeed(sd);
  d1 = base_damp + random(1)/1000;
  d2 = base_damp + random(1)/1000;
  d3 = base_damp + random(1)/1000;
  d4 = base_damp + random(1)/1000;

  println("random seed        : " + sd);
  println("dimensions (x, y)  : " + xdim + ", " + ydim);
  println("damping constants  : " + d1 + ", " + d2 + ", " + d3 + ", " + d4);
  println("amplitudes (pixels): " + a1 + ", " + a2 + ", " + a3 + ", " + a4);
  println("phases    (radians): " + p1 + ", " + p2 + ", " + p3 + ", " + p4);
  println("frequency (radians): " + f1 + ", " + f2 + ", " + f3 + ", " + f4);

  println("click mouse in window to save figure at anytime.");
}

float t = 0;

void mousePressed() {
  save(fname + ".png");
  println("total time (arb)   : " + t);
  println(fname + ".png created.");
  println(fname + ".txt created.");
  log = createWriter(fname + ".txt");
  log.println("random seed        : " + sd);
  log.println("dimensions (x, y)  : " + xdim + ", " + ydim);
  log.println("damping constants  : " + d1 + ", " + d2 + ", " + d3 + ", " + d4);
  log.println("amplitudes (pixels): " + a1 + ", " + a2 + ", " + a3 + ", " + a4);
  log.println("phases    (radians): " + p1 + ", " + p2 + ", " + p3 + ", " + p4);
  log.println("frequency (radians): " + f1 + ", " + f2 + ", " + f3 + ", " + f4);
  log.println("total time (arb)   : " + t);
  log.flush();
  log.close();
  println("exiting.");
  exit();
}


void draw() {
  translate(xdim/2, ydim/2);
  float drift = 0;
  for (int i=0; i<100; i=i+1) {
    float newx = mo(t, a1, f1, p1, d1, a2, f2, p2, d2);
    float newy = mo(t, a3, f3, p3, d3, a4, f4, p4, d4);
    if (rainbow_color) {
      stroke(t%100,100,90);
    }
    point(newx, newy);
    t = t + 0.01;
    drift = drift + sqrt( sq(newx)+sq(newy));
  }
  if ( drift/100 < 10) {
    println("stopping loop.");
    println("total time (arb)   : " + t);
    println("click mouse to save figure and exit.");
    noLoop();
    //    exit();
  }
}


