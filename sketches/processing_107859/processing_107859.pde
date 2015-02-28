
float R=180, r=15, h0[]={120, 120}, phi=0;
float t[]={0,0}, t_inc[]={0,0};
int numPoints=360;

int numFigs=8;



void setup() {
  colorMode(HSB, 1.0, 1.0, 1.0);
  size(900, 900, P2D);
  frameRate(25);
  strokeWeight(3);
  t_inc[0]=TWO_PI/(float)frameRate/1250;
  t_inc[1]=TWO_PI/(float)frameRate/4045;
}

void draw() {
  background(0);
  phi=0;
  pushMatrix();
  translate(width/2, height/2);
  for(int i=0; i<numPoints; i++) {
    for(int k=0; k<2; k++) {
      t[k]+=t_inc[k];
      stroke(0.5+0.5*sin(t[1-k]), 1, 1);
      float h=h0[k]*cos(phi)-h0[k]*sin(t[k]);
      for(int j=0; j<numFigs; j++) {
        pushMatrix();
        rotate(TWO_PI/(float)numFigs*j);
        point((R-r)*cos(phi)+h*cos((R-r)/r*phi), 
              (R-r)*sin(phi)+h*sin((R-r)/r*phi));
        popMatrix();
      }
    }
    phi+=TWO_PI/(float)numPoints;   
  }
  popMatrix();
}
