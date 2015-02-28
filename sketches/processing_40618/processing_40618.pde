
float rainbowRad=300; 
float rainbowCenterX=250;
float rainbowCenterY=300;
float rainbowPathX1;
float rainbowPathY1;
float rainbowPathX2;
float rainbowPathY2;
float bandSize=10;
float deltaA=.005;

float r;
float g;
float b;

float a=3*PI/2;
float t=6;


void setup() {
  size(500,500);
  background(126,189,255);
  frameRate(20);
}

void draw() {
  smooth();
  
  noStroke();
  
  float i;
  
  for (i=0; i<t; i=i+1) {
    
    rainbowRad=300-(bandSize*i);
    if(i<(t/3) || i>(2*t/3)) {
      r=255;
    }
    else{
      r=80;
    }
      if (i>=t/6 && i<=t/2) {
      g=255;
      }
      else{
        g=80;
      }
    if(i>t/3) {
      b=255;
    }
    else {
      b=80;
    }
    
    fill(r,g,b);
    rainbowPathX1=rainbowCenterX+rainbowRad*cos(a);
    rainbowPathY1=rainbowCenterY+rainbowRad*sin(a);
    a=a+.001;
    rainbowPathX2=rainbowCenterX-rainbowRad*cos(a);
    rainbowPathY2=rainbowCenterY+rainbowRad*sin(a);
    ellipse(rainbowPathX1, rainbowPathY1, bandSize, bandSize);
    ellipse(rainbowPathX2, rainbowPathY2, bandSize, bandSize);
  }
}

