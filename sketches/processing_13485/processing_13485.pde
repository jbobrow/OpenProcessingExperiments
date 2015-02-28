
// spiral electron animation, version 2
// processingjs version
//
// keep watching! This sketch evolves quite slowly over time :)
// The phase shifts gradually, which changes the number of spiral arms
// and their direction of rotation.
//
// steven kay, June 2010
 
PFont caption;
 
void setup() {
  size(512,512);
}
 
float factor;
float factor_change_rate=800000.0;
float factor_change_rate_2=200000.0;
 
void draw() {
  background(0);
  //noStroke();
  stroke(0);
  factor=3.0+(3.0*sin(frameCount/factor_change_rate));
  float c=1.2; // size
  ellipseMode(CENTER);
  float x,y;
  for (int n=0;n<800;n++) {
    float off=float(frameCount)/20.0;
    float nn=float(n);
    float r=c*sqrt(nn);
    float theta=off+(nn*degrees(factor));
    x=nn*sin(theta);
    y=nn*cos(theta); 
    float z=nn*sin((((float)frameCount)/factor_change_rate_2)*theta);
    float luma=255-(nn/c);
    if (n%1==0) {
    pushMatrix();
    translate(256,256);
    translate(x,y,z);
    fill(luma,0,255-luma);
    float sz=30-(n/10);
    ellipse(0,0,sz,sz);
    popMatrix();
    }
     
  }
  
}

                
                                                                
