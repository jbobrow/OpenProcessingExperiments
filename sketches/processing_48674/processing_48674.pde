
/* 
 Igoumeninja 15/5/2008
 Aris Bezas
 Spirals project
 processing v1.0
 */
 
int dim = 50,counter;
float theta = 283.8,u,v;
float R=100,N=58,H=60,P=4,L=4,K=14,R2=90;//float R=3,N=5.6,H=6,P=4.5,L=1.4,K=4,R2=9;
float[] W = new float[dim];
float[] Fx = new float[dim];
float[] Fy = new float[dim];
float[] Fz = new float[dim];

void setup() {
  size(900,450,P3D);
  background(255);
  frameRate(30);
}

void draw()  {
  for (int i = 0; i < dim; i++)  {
    u = u + .001;
    v = v + .002;
    W[i] = pow((u/(2*PI)*R),0.9);
    Fx[i] = W[i]*cos(N*u)*(1+cos(v));
    Fy[i] = W[i]*sin(N*u)*(1+cos(v));
    Fz[i] = W[i]*(sin(v)+L*pow((sin(v/2)),K))  + H*pow((u/(2*PI)),P);
  }
    
  translate(width/2,height/4);
  rotateZ(theta/2);
  rotateY(theta);
  rotateX(PI/4);
  fill(100,0,23,10);
  stroke(100,0,43,10);
  beginShape(LINES);
    for (int i = 0; i < dim-1; i++)  {
      vertex(Fx[i],Fy[i],Fz[i]);
    }
  endShape(CLOSE);
  if (u > 180)  {
    v = u = 0;
    background(255);
  }

}

                                                                                                                                
