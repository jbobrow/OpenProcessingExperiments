
//import processing.opengl.*;

Pos[][][]p=new Pos[5][5][5];

void setup(){
  size(750,650,P3D);
  background(255);
  for (int i=0;i<p.length;i++){
    for (int j=0;j<p.length;j++){
      for (int k=0;k<p.length;k++){
        p[i][j][k]=new Pos(i*40,j*40,k*40,255*i/4,255*j/4,255*k/4);
      }
    }
  }
}

void draw(){
  background(255);
  stroke(0);
  translate(width/2,height/2,0);
  rotateY(radians(mouseX));
  rotateX(radians(mouseY));
  for (int i=0;i<p.length;i++){
    for (int j=0;j<p.length;j++){
      for (int k=0;k<p.length;k++){
        p[i][j][k].show();
      }
    }
  }
}

class Pos{
  float x,y,z,r,g,b;

  Pos(float x_,float y_,float z_, color r_,color g_, color b_){
    x=x_;
    y=y_;
    z=z_;
    r=r_;
    g=g_;
    b=b_;
  }
  void show(){
    pushMatrix();
    fill(r,g,b);
    translate(x,y,z);
    box(30);
    popMatrix();
  }
}









