
void setup() { 


  size(600, 600, P3D);
} 
////////////////////////////////////////////////////////////////////////////////////////////////////////////


void Catmullrom( float x1, float y1, float z1, float x2, float y2, float z2) 
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

  for (int i=1; i<=4; i+=1) { 
    x[9-2*i]=x[11-2*i]-2*(x[9]-x[0])/9; 
    x[2*i]=x[2*i-2]+2*(x[9]-x[0])/9; 
    y[9-2*i]=y[11-2*i]-2*(y[9]-y[0])/9; 
    y[2*i]=y[2*i-2]+2*(y[9]-y[0])/9; 
    z[9-2*i]=z[11-2*i]-2*(z[9]-z[0])/9; 
    z[2*i]=z[2*i-2]+2*(z[9]-z[0])/9;
  } 


  for (int i=1; i<=4; i+=1) { 
    x[9-2*i]+=mouseX; 
    x[2*i]-=mouseX; 
    y[9-2*i]-=mouseY; 
    y[2*i]+=mouseY;
  } 



  for (int i=0; i<=6; i+=1) {
    beginShape(); 
    for (float t1=0; t1<=1; t1+=0.02) { 
      float t2=t1*t1;
      float t3=t2*t1;

      float X=0; 
      float Y=0; 
      float Z=0; 

      X=(-.5*x[i] + 1.5*x[i+1]  -1.5*x[i+2] + .5*x[i+3])*t3 + (x[i] -2.5*x[i+1] +2*x[i+2] -.5*x[i+3])*t2 + (-.5*x[i] + .5*x[i+2])*t1 + x[i+1];
      Y=(-.5*y[i] + 1.5*y[i+1]  -1.5*y[i+2] + .5*y[i+3])*t3 + (y[i] -2.5*y[i+1] +2*y[i+2] -.5*y[i+3])*t2 + (-.5*y[i] + .5*y[i+2])*t1 + y[i+1]; 
      Z=(-.5*z[i] + 1.5*z[i+1]  -1.5*z[i+2] + .5*z[i+3])*t3 + (z[i] -2.5*z[i+1] +2*z[i+2] -.5*z[i+3])*t2 + (-.5*z[i] + .5*z[i+2])*t1 + z[i+1];  
      vertex(X, Y, Z);

    } 
    endShape();
  }
  
  for (int i=0; i<=6; i+=1) {
  for (float t1=0; t1<=1; t1+=0.02) { 
      float t2=t1*t1;
      float t3=t2*t1;

      float X=0; 
      float Y=0; 
      float Z=0; 

      X=(-.5*x[i] + 1.5*x[i+1]  -1.5*x[i+2] + .5*x[i+3])*t3 + (x[i] -2.5*x[i+1] +2*x[i+2] -.5*x[i+3])*t2 + (-.5*x[i] + .5*x[i+2])*t1 + x[i+1];
      Y=(-.5*y[i] + 1.5*y[i+1]  -1.5*y[i+2] + .5*y[i+3])*t3 + (y[i] -2.5*y[i+1] +2*y[i+2] -.5*y[i+3])*t2 + (-.5*y[i] + .5*y[i+2])*t1 + y[i+1]; 
      Z=(-.5*z[i] + 1.5*z[i+1]  -1.5*z[i+2] + .5*z[i+3])*t3 + (z[i] -2.5*z[i+1] +2*z[i+2] -.5*z[i+3])*t2 + (-.5*z[i] + .5*z[i+2])*t1 + z[i+1];  

      translate(X,Y,Z);
      sphere(10);
    
    }
}
}
////////////////////////////////////////////////////////////////////////////////////////
void draw() { 


  background(255); 


  Catmullrom(0, 0, 0, 600, 600, 0);
} 

