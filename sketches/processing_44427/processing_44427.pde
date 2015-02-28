
/*Día 1 del hackpact de arte generativo
 Por Eduardo H Obieta
 http://artegenerativo.laad.com.mx 
 
 */

float rota[];
float pos1[];
float pos2[];
float vel[];

float blx[];
float bly[];
int n = 50;

void setup() {
  size(800, 600,P3D);
  background(0);
  smooth();

  vel = new float[n];
  pos1= new float[n];
  pos2= new float[n];
  rota= new float[n];
  blx = new float[n];
  bly = new float[n];

  for (int i=0;i<n;i++) {
    vel[i] = random(0.02);
    pos1[i]= random(width/2);
    pos2[i]= random(height/2);
  }
}

void draw() {
  translate(width/2, height/2);
  stroke(255);
  rotateZ(millis()*0.002);
for (int i=0;i<n;i++) {

    rotate(-rota[i]);

    blx[i]=noise(pos1[i])*300;
    bly[i]=noise(pos2[i])*300;

    point(blx[i], bly[i]);

    rota[i]+= 0.001;
    pos1[i]+=vel[i];
    pos2[i]+=vel[i];
  }
}

