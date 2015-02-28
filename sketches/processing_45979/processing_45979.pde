
/*
Hackpact Arte Generativo 2011
 Dia 12
 
 Martin Zumaya Hernandez
 */

PVector pos[];
PVector pos_a[];
PVector vel[];
int N = 20000;
float dt = 0.1;
float XX = 250;
float YY = XX;
float x = 0;
float y = 0;
float ang = 0;

void setup() {
 
  size(700, 500, P3D);
  
  colorMode(HSB);
  noCursor();

  pos = new PVector[N];
  pos_a = new PVector[N];
  vel = new PVector[N];

  for ( int i = 0; i < N; i++) {
    pos[i] = new PVector(XX*noise(XX),XX*noise(XX),0);
    pos_a[i] = new PVector(XX*noise(XX),XX*noise(XX),0);
    vel[i] = new PVector(0, 0, 5);
  }
}

void draw() {

  background(0); 
  lights();

  camera(100+mouseX,100*sin(ang),100*cos(ang),
  0.0, 0.0, 0.0, 
  0.0, 0.0, 1.0);

  for ( int i = 0; i < N; i++) {
    
    stroke(160-(pos[i].mag())/10, 200, 200, 200);  

   rotateZ(ang);

    point(pos[i].x, pos[i].y, pos[i].z);
    point(pos_a[i].x, pos_a[i].y, pos_a[i].z);
        
    point(pos[i].x, pos[i].y, -pos[i].z);
    point(pos_a[i].x, pos_a[i].y, -pos_a[i].z);
    
    pos[i].z += (vel[i].z+random(1))*dt;
    pos_a[i].z += (vel[i].z+random(1))*dt;
  }

  float xr = XX*noise(-XX, XX);
  float yr = YY*noise(-YY, YY);

  float xr1 = random(-XX, XX);
  float yr1 = random(-YY, YY);

  for ( int i = 0; i < N; i ++) {
    if ( pos[i].mag() >= 300 ) {
      pos[i].set(xr, yr, 0);
    } 
    if ( pos_a[i].mag() >= 300 ) {
      pos_a[i].set(xr1, yr1, 0);
    }
  }

  ang += 0.01;
}

void keyPressed() {

  if ( key == ' ') {
    saveFrame("  dia12#.png");
  }
}


