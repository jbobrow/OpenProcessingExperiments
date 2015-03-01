
void setup(){
  size(600,600,P3D);
}

void Bezier( float x1, float y1,float z1, float x2, float y2, float z2)
{
  float[] x=new float[10];
  float[] y=new float[10];
  float[] z=new float[10];
  
  x[0]=x1;
  x[9]=x2;
  y[0]=y1;
  y[9]=y2;
  z[0]=z1;
  z[9]=z2;
  
  for(int i=1; i<=4; i+=1){
    x[9-2*i]=x[11-2*i]-2*(x[9]-x[0])/9;
    x[2*i]=x[2*i-2]+2*(x[9]-x[0])/9;
    y[9-2*i]=y[11-2*i]-2*(y[9]-y[0])/9;
    y[2*i]=y[2*i-2]+2*(y[9]-y[0])/9;
    z[9-2*i]=z[11-2*i]-2*(z[9]-z[0])/9;
    z[2*i]=z[2*i-2]+2*(z[9]-z[0])/9;
  }
  for(int i=1; i<=4; i+=1){
    x[9-2*i]+=10*mouseX;
    x[2*i]-=10*mouseX;
    y[9-2*i]+=10*mouseY;
    y[2*i]-=10*mouseY;
    z[9-2*i]+=10*mouseX;
    z[2*i]-=10*mouseX;
  }
  
  float[] T=new float[10];
  float[] t=new float[10];
  float t1;
  float T1;
    
    
  beginShape();
  for (t1=0; t1<=1; t1+=0.02){
    T1=1-t1;
  T[9]=1;
  t[0]=1;
  for (int i=1; i<=9; i+=1){
    T[9-i]=T[10-i]*T1;
    t[i]=t[i-1]*t1;
  }
  
   float X=0;
    float Y=0;
    float Z=0;
    for(int i=0;i<=9;i+=1){
     X+=x[i]*T[i]*t[i];
     Y+=y[i]*T[i]*t[i];
     Z+=z[i]*T[i]*t[i];
}
    vertex(X,Y,Z);
  }
  endShape();
  for(int i=0;i<=9;i+=1){
     strokeWeight(10);
     point(x[i],y[i],z[i]);
}
}

void draw(){
  background(255);
  Bezier(100,100,0,600,600,0);
}
