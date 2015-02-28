
float x[],y[];
int num;

void setup() {
  size(900,400);
  
  num=100;
  x=new float[num];
  y=new float[num];
  
  for(int i=0; i<num; i++) {
    x[i]=random(width);
    y[i]=random(height);
  }
}

void draw() {
  background(200);

  // interpolate positions, moving each point towards the 
  // point ahead of it
  for(int i=num-1; i>0; i--) {
   x[i]=x[i]+(x[i-1]-x[i])*0.1; 
   y[i]=y[i]+(y[i-1]-y[i])*0.1; 
  }

  for(int i=1; i<num; i++) line(x[i],y[i], x[i/5],y[i/5]);
  for(int i=0; i<num; i++) ellipse(x[i],y[i], 10,10);
}

void mouseMoved() {
  for(int i=num-1; i>0; i--) {
   x[i]=x[i-1]; 
   y[i]=y[i-1]; 
  }
  x[0]=mouseX;
  y[0]=mouseY;
}               
