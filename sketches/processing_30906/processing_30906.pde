

int particles = 2000;

float[][] dust = new float[particles][3];
float[][] acc = new float[particles][3];

int numnod = 16;
int[][] nodes = new int[numnod][3];

float inc = 0.5;


int m = 700;
int c = m/2;


float camangy = -20*PI/180;
float camangx = 0;

int moudify = 0;
int moudifx = 0;


void setup() {
  size(640,480,P3D);
  
  for (int i=0; i<dust.length; i++) {
    
    float[] tmp = dust[i];
    
    float arad = random(360)*PI/180;
    float brad = random(360)*PI/180;
    
    float rad = random(c);
    
    tmp[0] = rad*sin(arad)*cos(brad);
    tmp[1] = rad*sin(arad)*sin(brad);
    tmp[2] = rad*cos(arad);
    
    
    if (i<numnod) {
      int[] n = nodes[i];
      
      n[0] = (int)random(m)-c;
      n[1] = (int)random(m)-c;
      n[2] = (int)random(m)-c;
    }
    
    
  }
  
  background(0);
  stroke(255);
  fill(0, 64); //for drawing trails
  
  frameRate(30);
}


void draw() {
  
  background(0);
  
  //uncomment these to draw trails
//  hint(DISABLE_DEPTH_TEST);
//  rect(0,0,width,height);
//  hint(ENABLE_DEPTH_TEST);
  
  translate(width/2,height/2,-300);
  
  
  rotateX(camangy);
  rotateY(camangx);
  
  camangx+=.01;
  
  beginShape(POINTS);
  
  for (int i=0; i<particles; i++) {
    float[] spec = dust[i];
    
    vertex(spec[0], spec[1], spec[2]);
    //point(spec[0], spec[1], spec[2]);
    
    float shrt = 50000;
    int idx = 0;
    int bstdist = 0;
    
    //nearest node only
    for (int j=0; j<numnod; j++) {
      int[] nod = nodes[j];
      //find nearest
      
      float a = spec[0]-nod[0];
      float b = spec[1]-nod[1];
      float c = spec[2]-nod[2];
      
      float ds = abs(a) + abs(b) + abs(c);
      
      if (ds < shrt) {
        idx = j;
        shrt = ds;
      }
      
    }
    
    float offs = (shrt<1) ? inc : inc/shrt;
    
    //move particles toward nearest node
    if (spec[0]-nodes[idx][0] < 0) acc[i][0]+=offs; else acc[i][0]-=offs;
    if (spec[1]-nodes[idx][1] < 0) acc[i][1]+=offs; else acc[i][1]-=offs;
    if (spec[2]-nodes[idx][2] < 0) acc[i][2]+=offs; else acc[i][2]-=offs;
    
    spec[0]+=acc[i][0];
    spec[1]+=acc[i][1];
    spec[2]+=acc[i][2];
    
    
  }
  endShape();
  
}

