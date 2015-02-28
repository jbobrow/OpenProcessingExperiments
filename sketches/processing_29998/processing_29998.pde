
 
float y1=100;
float t=0;
float k,A,L=400;
int n=2;

void setup() {
  size(400, 200);
  smooth();
  stroke(180,56,35);
  fill(180,56,35);
  k=(3.14)*n/L;
}

void draw() {
  background(242,242,242);
 for(int i=0; i < L; i++) {
  A=(80/n)*sin(k*i);
  y1=100-A*sin(16*t);
  ellipse(i,y1,5,5);
  }  
  t = t + 0.01;
}
                    
