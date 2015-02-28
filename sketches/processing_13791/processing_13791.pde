
import remixlab.proscene.*;
Scene scene;
int nX=50;
int nY=50;
PVector[] points;
void setup(){
  size(600,450,P3D);
  scene=new Scene(this);
  points=new PVector[nX*nY];
  setPoints();

}
void draw(){
  stroke(0,255,0);
  noFill();
  for(int j=0;j<nY;j++){
    plotThetaCurve(width/4,j);
  }
  stroke(255,0,0);
  for(int i=0;i<nX;i++){
    plotPhiCurve(width/4,i);
  }
}
void setPoints(){
  for(int i=0;i<nX;i++){
    for(int j=0;j<nY;j++){
      float lambdaTheta=(float) i / (float) (nX-1);
      float lambdaPhi=(float) j / (float) (nY-1);
      float theta=TWO_PI*lambdaTheta;
      float phi=PI*lambdaPhi;
      float x=rFunction(theta,phi)*cos(theta)*sin(phi);
      float y=rFunction(theta,phi)*sin(theta)*sin(phi);
      float z=rFunction(theta,phi)*cos(phi);
      points[ix(i,j)]=new PVector(x,y,z);
    }
  }
}
void plotPoints(float a){
  for(int i=0;i<points.length;i++){
    point(points[i].x*(a/2),points[i].y*(a/2),points[i].z*(a/2));
  }
}
void plotThetaCurve(float a,int j){
  beginShape();
  for(int i=0;i<nX;i++){
    if(i==0)
      curveVertex(points[ix(i,j)].x*(a/2),points[ix(i,j)].y*(a/2),points[ix(i,j)].z*(a/2));
    else if(i==nX-1)
      curveVertex(points[ix(i,j)].x*(a/2),points[ix(i,j)].y*(a/2),points[ix(i,j)].z*(a/2)); 
    curveVertex(points[ix(i,j)].x*(a/2),points[ix(i,j)].y*(a/2),points[ix(i,j)].z*(a/2));
  }
  endShape();
}
void plotPhiCurve(float a, int i){
  beginShape();
  for(int j=0;j<nY;j++){
    if(j==0)
      curveVertex(points[ix(i,j)].x*(a/2),points[ix(i,j)].y*(a/2),points[ix(i,j)].z*(a/2));
    else if(j==nY-1)
      curveVertex(points[ix(i,j)].x*(a/2),points[ix(i,j)].y*(a/2),points[ix(i,j)].z*(a/2));
    curveVertex(points[ix(i,j)].x*(a/2),points[ix(i,j)].y*(a/2),points[ix(i,j)].z*(a/2));
  }
  endShape();
}
int ix(int i, int j){
  return i+j*nX;
}
float rFunction(float theta, float phi){
  if(theta<phi)
    return phi/PI;
  else
    return theta/TWO_PI; 
  //return exp(-theta/TWO_PI)*cos(phi);
}


