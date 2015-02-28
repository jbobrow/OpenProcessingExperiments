
float [] x = new float[300];
float [] y = new float[300];
float [] xv = new float[300];
float [] yv = new float[300];
float speed;
float d;


 
void setup() {
  size(500, 500);
  smooth();
  
   for (int i=0; i<300; i++){
      x[i]=250;
      y[i]=250;
      speed=random(4-2);
      d=random(2*PI);
      xv[i]=cos(d)*speed;
      yv[i]=sin(d)*speed;
     
    }
    stroke(255);
    strokeWeight(5);
    }
    
void draw() {
  background(0);
   
  for (int i = 0; i < 300; i++) {
    point(x[i],y[i]);
    x[i]+=xv[i];
    y[i]+=yv[i];
    if (x[i]>500) {xv[i]=-xv[i];}
    if (x[i]<0) {xv[i]=-xv[i];}
    if (y[i]>500) {yv[i]=-yv[i];}
    if (y[i]<0) {yv[i]=-yv[i];}
  }
}
