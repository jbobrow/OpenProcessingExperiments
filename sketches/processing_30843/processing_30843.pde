
 
float y1=0;
float t=0;
float v, T, m, w, k,L=400,z, Tn, An, Fn;

void setup() {
  size(400, 200);
  smooth();
  stroke(178,74,61);
  fill(178,74,61);
  v=650;
}

void draw() {
  background(255,219,158);
    for(int x=0; x < L; x++) {
      y1=0;
      for (int n=1; n< 10;n++){  
      k=(3.14*n)/L;
      w=v*k;
      An=-(2/(L*L))*((sin(k*L)-cos(k*L))/(k*k));
      Fn=((1/w*w*w)*(2*w*cos(t*w)-sin(w*(t+1))+sin(w*(t-1))));
      Tn=((2/(L*L))*((sin(k*L)-cos(k*L))/(k*k)))*Fn;
      y1+=11-0.5*(An*cos(w*t) + Tn)*sin(k*x);      
  }
  ellipse(x,y1,2,2); 
 } 
  t = t + 0.01;
}

