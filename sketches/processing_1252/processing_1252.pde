


class Bete {
  int N=20;
  float[] x = new float[N];
  float[] y = new float[N];
  float[] A = new float[N];
  float[] R = new float[N];
  float[] v = new float[N];
  color couleur;
  float xb,yb;
  float v0;
  float O0;
  float a=random(1,10);


  
  Bete() {
    couleur=color(0,0,random(0,100));
    x[0]=random(0,width);
    y[0]=random(0,height);
    R[0]=random(3,10);
    A[0]=random(0,2*PI);
    v[0]=0;
    v0=random(1,3);
    O0=random(0.1,1);
    for(int i=1;i<N;i++) {
      A[i]=A[0];
      R[i]=R[0]*exp(-2*float(i)/(N));
      x[i]=x[i-1]+cos(A[i])*1;
      y[i]=y[i-1]+sin(A[i])*1;
      v[i]=0;
    }
  }
    
  void bouger() {
    xb=xc;
    yb=yc;
    xb=mouseX;
    yb=mouseY;
    for(int i=0;i<N;i++) {
      A[i]=angle(xb,yb,x[i],y[i]);
      if(i==0) A[i]+=O0*sin(millis()/(100*a));
      float s=sqrt((xb-x[i])*(xb-x[i])+(yb-y[i])*(yb-y[i]));
      if(s>1) {
        v[i]=v0*(1-exp(1-s));
      }
      else v[i]=0;
      x[i]+=v[i]*cos(A[i]);
      y[i]+=v[i]*sin(A[i]);
      xb=x[i];
      yb=y[i];      
    }    
  
  }
  void dessiner() {
    for(int i=0;i<N;i++) {
      fill(couleur);
      pushMatrix();
      translate(x[i],y[i]);
      ellipse(0,0,R[i],R[i]);
      popMatrix();
    }
  }
  void reinit() {
    x[0]=random(0,width);
    y[0]=random(0,height);
    
    
    v[0]=0;
    v0=random(1,3);
    O0=random(0.1,1);
    for(int i=1;i<N;i++) {
      A[i]=A[0];
      x[i]=x[i-1]+cos(A[i])*1;
      y[i]=y[i-1]+sin(A[i])*1;
      v[i]=0;
    }
  }  
}

