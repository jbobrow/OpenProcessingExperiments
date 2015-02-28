
void setup()
{
  size(512,512);
}

float factor;
float change=800000;

void draw() {
  background(0);
  factor=3.0+(frameCount/change);
  float c=1;
  ellipseMode(CENTER);
  float x,y;
  for (int n=0;n<900;n++) {
    float off=float(frameCount)/50.0;
    float nn=float(n);
    float r=c*sqrt(nn);
    float theta=off+(nn*degrees(factor));
    x=nn*sin(theta);
    y=nn*cos(theta); 
    float l=255-(nn/c);
    if (n%1==0) {
      pushMatrix();
      translate(256,256);
      translate(x,y);
      fill(l,0,255-l);
      float sz=30-(n/10);
      ellipse(0,0,sz,sz);
      popMatrix();
    }
  }
}


