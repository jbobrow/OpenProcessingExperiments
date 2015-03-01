
float l=0;
float rad=0;
float theta;
float pi;

float Ax;
float Ay;
float Az;
     
float Bx;
float By;
float Bz;
     
float Cx;
float Cy;
float Cz;
     
float Dx;
float Dy;
float Dz;
    
void setup(){
  size(800,800,P3D);
  frameRate(2);
}
 
void draw(){
  translate(400,350,0);
 
float vecCDx;
float vecCDy;
float vecCDz;

float vecCBx;
float vecCBy;
float vecCBz;

float Crossx;
float Crossy;
float Crossz;

float MagCross,MagZvec;
float Zvecx=0,Zvecy=0,Zvecz=1;
float CrossDotZvec;
float Cos;

float brightness;
float t=0;
t+=1;
  rotateX(radians(60));
  rotateZ(radians(45));
  if(t%2==1&&rad>=0){
   
    theta=radians(rad);
    pi=radians(rad/5-90);
    
    Ax=l*cos(theta)*cos(pi)+l*cos(theta)*sin(pi);
    Ay=l*cos(theta)*sin(pi)-l*cos(theta)*cos(pi);
    Az=sqrt(2)*l*sin(theta);
     
    Bx=(200+(cos(theta)-1)*(200+l)/2)*cos(pi)+(l-(1-cos(theta))*(200+l)/2)*sin(pi);
    By=(200+(cos(theta)-1)*(200+l)/2)*sin(pi)+(-l+(1-cos(theta))*(200+l)/2)*cos(pi);
    Bz=(200+l)*sin(theta)/sqrt(2);
     
    Cx=200*cos(theta)*cos(pi)+200*cos(theta)*sin(pi);
    Cy=200*cos(theta)*sin(pi)-200*cos(theta)*cos(pi);
    Cz=200*sqrt(2)*sin(theta);
     
    Dx=(l+(cos(theta)-1)*(200+l)/2)*cos(pi)+(200-(1-cos(theta))*(200+l)/2)*sin(pi);
    Dy=(l+(cos(theta)-1)*(200+l)/2)*sin(pi)+(-200+(1-cos(theta))*(200+l)/2)*cos(pi);
    Dz=(200+l)*sin(theta)/sqrt(2);

vecCDx=Dx-Cx;
vecCDy=Dy-Cy;
vecCDz=Dz-Cz;

vecCBx=Bx-Cx;
vecCBy=By-Cy;
vecCBz=Bz-Cz;

Crossx=vecCBy*vecCDz-vecCBz*vecCDy;
Crossy=vecCBz*vecCDx-vecCBx*vecCDz;
Crossz=vecCBx*vecCDy-vecCBy*vecCDx;

MagCross=sqrt(Crossx*Crossx+Crossy*Crossy+Crossz*Crossz);
MagZvec=sqrt(Zvecx*Zvecx+Zvecy*Zvecy+Zvecz*Zvecz);
CrossDotZvec=Crossx*Zvecx+Crossy*Zvecy+Crossz*Zvecz;
Cos=CrossDotZvec/(MagCross*MagZvec);
brightness=abs(Cos);

fill(brightness*255,0,0);
beginShape();
vertex(Ax,Ay,Az);
vertex(Bx,By,Bz);
vertex(Cx,Cy,Cz);
vertex(Dx,Dy,Dz);
vertex(Ax,Ay,Az);
endShape();

l=200-99*(200-l)/100;
rad+=3;
}
}

