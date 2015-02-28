
float[][] x;
float[][] v;
float[][] f;
int reducer = 5;
int rate = 5;
int xWidth;
int xHeight;
float k = 0.01;
float c = 0.001;
float depthOfFeild = 0.2;
void setup(){
  size(300,150,P3D);
  xWidth = width/2/reducer+1;
  xHeight = height/reducer+1;
  x = new float[xWidth][xHeight];
  v = new float[xWidth][xHeight];
  f = new float[xWidth][xHeight];
  for(int j=0;j<xHeight-1;j++){
    for(int i=0;i<xWidth-1;i++){
//      x[i][j] = height/4*cos((float)i/xWidth*2*TWO_PI)
//        *(1-cos((float)j/xHeight*TWO_PI));
      x[i][j] = 1f*(j-xHeight/2)/(xHeight/2)*height/4;
    }
  }
  noStroke();
}
void draw(){
  if(frameCount%60==0){println(frameRate);}
  background(0);
  for(int j=0;j<xHeight-1;j++){
    for(int i=0;i<xWidth-1;i++){
      fill(#FF0000,256.0-256.0
        *sqrt(abs(2.0*j/xHeight-1.0)));
      beginShape(TRIANGLES);
      int x1 = i*reducer;
      int x2 = (i+1)*reducer;
      int y1 = height/2+int(x[i][j]);
      int y2 = height/2+int(x[i+1][j]);
      int y3 = height/2+int(x[i][j+1]);
      int y4 = height/2+int(x[i+1][j+1]);
      int z1 = int((j-xHeight/2)*reducer*depthOfFeild);
      int z2 = int((j+1-xHeight/2)*reducer*depthOfFeild);
      vertex(x1+z1,y1);
      vertex(x1+z2,y3);
      vertex(x2+z2,y4);
      
      vertex(x1+z1,y1);
      vertex(x2+z1,y2);
      vertex(x2+z2,y4);
      
      vertex(x1-z1+width/2,y1);
      vertex(x1-z2+width/2,y3);
      vertex(x2-z2+width/2,y4);
      
      vertex(x1-z1+width/2,y1);
      vertex(x2-z1+width/2,y2);
      vertex(x2-z2+width/2,y4);
      endShape();
    }
  }
  for(int m=0;m<rate;m++){
    for(int i=0;i<xWidth-1;i++){
      for(int j=0;j<xHeight;j++){
        float F = k*(x[i+1][j]-x[i][j]);
        F += c*(v[i+1][j]-v[i][j]);
        f[i][j] += F;
        f[i+1][j] -= F;
      }
    }
    for(int i=0;i<xWidth;i++){
      for(int j=0;j<xHeight-1;j++){
        float F = k*(x[i][j+1]-x[i][j]);
        F += c*(v[i][j+1]-v[i][j]);
        f[i][j] += F;
        f[i][j+1] -= F;
      }
    }
    for(int i=0;i<xWidth;i++){
      for(int j=0;j<xHeight;j++){
        v[i][j]+=f[i][j];
        f[i][j]=0;
        v[i][j]*=0.999;
        x[i][j]+=v[i][j];
      }
    }
    for(int i=0;i<xWidth;i++){
      x[i][0]=-height/4;
      x[i][xHeight-1]=height/4;
      v[i][0]=0;
      v[i][xHeight-1]=0;
    }
  }
  if(mousePressed){
    for(int i=0;i<xWidth;i++){
      for(int j=0;j<xHeight;j++){
        PVector r = new PVector(i*reducer,j*reducer);
        r.sub(new PVector(mouseX,xHeight*2/3*reducer));
        float delta = (mouseY-height/2)-x[i][j];
        v[i][j] += 0.1*delta * exp(-0.01*sq(r.mag()));
      }
    }
  }
}

