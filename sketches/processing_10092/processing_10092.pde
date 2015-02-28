
// begun by trying to draw a fermat spiral.
// didn't quite get there, but i liked the results on the way
// steven kay, may 2010

// interesting values
float[] scales=new float[]{1.61803399,PI,PI/2,PI/3,PI/6,PI/9,PI/4,2,3,4,5,-1.61803399};

// which one we show
int ix=0; 

void setup() {
  size(512,512,P3D);
}

void mousePressed() {
  // click to cycle through the various presets
  ix=((ix+1)%scales.length);
}

void draw() {
  //background(0);
  noStroke();
  float c=1.2; // spacing
  ellipseMode(CENTER);
  for (int n=0;n<800;n++) {
    float off=float(frameCount)/20.0;
    float nn=float(n);
    float r=c*sqrt(nn);
    float theta=off+(nn*degrees(scales[ix]));
    float x=nn*sin(theta);
    float y=nn*cos(theta);
    float luma=255-(nn/c);
    fill(luma,0,255-luma);
    pushMatrix();
    translate(256,256);
    translate(x,y);
    ellipse(0,0,20,20);
    popMatrix();
  } 
  //filter(BLUR,1);
}

