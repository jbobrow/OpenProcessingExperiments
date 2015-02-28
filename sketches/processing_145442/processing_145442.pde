
int crawlersCount = 100;
int trailLength = 5;
int speed = 50; // frame skip, actually

//values for size of thingy
float scaleX = 24.0;
float scaleY = 200;
float scaleZ = 20.0;

// Parameters of the attractor. With this values it becomes more interesting
float sigma = 10.0;
float r = 28.0;
float b = 8.0 / 3.0;

// actual time step
float dt = 0.001;

// just indexes
int X = 0;
int Y = 1;
int Z = 2;

float[] k1, k2, k3, k4;

int MAX_TRAIL = 20;
int MAX_CRAWLERS = 400;

// doesn't work with canvas :(
int smoothing = 0;

int explosion = 0;
float explosionForce = 40.0;

class Crawler {
  float x, y, z;
  PVector[] trail;
  int trailEnd;
  
  color c;
 
  Crawler() {
    x = random(-100, 100);
    y = random(-100, 100);
    z = random(-100, 100);
    //c = color(random(100, 200), random(100, 200), random(100, 200));
    c = color(255,0,0);
    
    trail = new PVector[MAX_TRAIL];
    int i;
    for(i=0; i<MAX_TRAIL; i++) {
      trail[i] = new PVector(x * scaleX + width / 2, y, -z * scaleZ + height);
    }
    trailEnd = 0;
  } 
  
  void awake() {
    x = random(-100, 100);
    y = random(-100, 100);
    z = random(-100, 100);
    c = color(random(100, 200), random(100, 200), random(100, 200));
    int i;
    for(i=0; i<MAX_TRAIL; i++) {
      trail[i] = new PVector(x * scaleX + width/9, y, -z * scaleZ + height);
    }
    trailEnd = 0;
  }
  
  // the Runge-Kutta method
  void step(int dummyStep) {
    k1[X] = dt * dx(x, y, z);
    k1[Y] = dt * dy(x, y, z);
    k1[Z] = dt * dz(x, y, z);
    
    k2[X] = dt * dx(x + k1[X] / 2.0, y + k1[Y] / 2.0, z + k1[Z] / 2.0);
    k2[Y] = dt * dy(x + k1[X] / 2.0, y + k1[Y] / 2.0, z + k1[Z] / 2.0);
    k2[Z] = dt * dz(x + k1[X] / 2.0, y + k1[Y] / 2.0, z + k1[Z] / 2.0);
    
    k3[X] = dt * dx(x + k2[X] / 2.0, y + k2[Y] / 2.0, z + k2[Z] / 2.0);
    k3[Y] = dt * dy(x + k2[X] / 2.0, y + k2[Y] / 2.0, z + k2[Z] / 2.0);
    k3[Z] = dt * dz(x + k2[X] / 2.0, y + k2[Y] / 2.0, z + k2[Z] / 2.0);
    
    k4[X] = dt * dx(x + k3[X], y + k3[Y], z + k3[Z]);
    k4[Y] = dt * dy(x + k3[X], y + k3[Y], z + k3[Z]);
    k4[Z] = dt * dz(x + k3[X], y + k3[Y], z + k3[Z]);
    
    x = x + (k1[X] + k2[X] + k3[X]) / 6.0;
    y = y + (k1[Y] + k2[Y] + k3[Y]) / 6.0;
    z = z + (k1[Z] + k2[Z] + k3[Z]) / 6.0;
    
    if(!dummyStep) {
      trailEnd--;
      if(trailEnd < 0) trailEnd = MAX_TRAIL - 1;
      trail[trailEnd].set(x * scaleX + width / 2, y, -z * scaleZ + height);
    }
  }
}

Crawler[] crawlers;

void setup() {
  size(900, 900);
  
  k1 = new float[3];
  k2 = new float[3];
  k3 = new float[3];
  k4 = new float[3];
  
  crawlers = new Crawler[MAX_CRAWLERS];
  int i;
  for(i=0; i<MAX_CRAWLERS; i++) {
    crawlers[i] = new Crawler(); 
  }
}

void draw() {
  background(0);
  int i, j;
  float px, py, pz;
  PVector v, pv;
  if(smoothing)
    smooth();
  else
    noSmooth();
  for(i=0; i<crawlersCount; i++) {
    
    for(j=0; j<speed; j++)
      crawlers[i].step(1);
    crawlers[i].step(0);
      
    // this is way faster than standard functions
    var c = document.getElementsByTagName("CANVAS")[0].getContext("2d");//document.getElementById("lorenze2").getContext("2d");
    c.strokeStyle = "#"+hex(crawlers[i].c, 6);
    for(j=0; j<trailLength-1; j++) {
      v = crawlers[i].trail[(crawlers[j].trailEnd + j) % MAX_TRAIL];
      pv = crawlers[i].trail[(crawlers[j].trailEnd + j + 1) % MAX_TRAIL];
      c.lineWidth = constrain(abs(v.y) / 5, 0.2, 8);
      c.beginPath();
      c.moveTo(pv.x, pv.z);
      c.lineTo(v.x, v.z);
      c.stroke();
    }
    
    if(explosion)
      explode();
  }
  
  textSize(10);
  fill(210);
  text("time step = "+speed+"; trail length = "+trailLength+"; smooth: "+smoothing+"; paticles: "+crawlersCount, 10, height - 15);
}

void keyReleased() {
  if(keyCode == UP && dt < 0.01) {
    dt += 0.0001;
  } 
  if(keyCode == DOWN && dt > 0.0001) {
    dt -= 0.0001;
  } 
  if(keyCode == RIGHT && speed < 100) {
    speed += 1; 
  }
  if(keyCode == LEFT && speed > 1) {
    speed -= 1; 
  }
  if(key == 't' && trailLength > 2) {
    trailLength --; 
  }
  if(key == 'T' && trailLength < MAX_TRAIL) {
    trailLength ++; 
  }
  if(key == 'c' && crawlersCount > 10) {
    crawlersCount -= 10; 
  }
  if(key == 'C' && crawlersCount < MAX_CRAWLERS) {
    int i;
    // there is a bug with awaking, but it's not critical
    for(i=crawlersCount; i<crawlersCount+10; i++)
      crawlers[i].awake();
    crawlersCount += 10; 
  }
  if(key == 's' && speed > 1) {
    speed -= 1; 
  }
  if(key == 'S' && speed < 100) {
    speed += 1; 
  }
  /*if(key == 'S' || key =='s')
    smoothing = !smoothing;*/
}

// just push particles away from cursor
void explode() {
  float mx = (mouseX - width / 2) / scaleX;
  float mz = -(mouseY - height) / scaleZ;
  float dx, dz, l;
  int i;
  for(i=0; i<crawlersCount; i++) {
    dx = crawlers[i].x - mx;
    dz = crawlers[i].z - mz;
    
    l = explosionForce * (sq(dx) + sq(dz));
    crawlers[i].x += dx / l;
    crawlers[i].z += dz / l;
  }
}

void mousePressed() {
   explosion = 1;
}

void mouseReleased() {
   explosion = 0;
}

// equations of the system 
float dx(float x, float y, float z) {
  return sigma * (y - x);
}

float dy(float x, float y, float z) {
  return -x * z + r * x - y;
}

float dz(float x, float y, float z) {
  return x * y - b * z;
}


