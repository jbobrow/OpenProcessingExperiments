
int Length=300;
float[] X=new float[Length];
float[] Y=new float[Length];
float[] Z=new float[Length];
float[] r=new float[Length];
float[] thetaX=new float[Length];
float[] thetaY=new float[Length];
float[] thetaZ=new float[Length];

void setup(){
  size(760,420,P3D);
  bg();
  colorMode(HSB,100);
  frameRate(30);
  //noStroke();
  background(0);
  for(int i=0;i<Length;i++){
    X[i]=random(width);
    Y[i]=random(-1000,0);
    Z[i]=random(-1000,1000);
    r[i]=random(1,10);
    thetaX[i]=random(0.001,0.1);
    thetaY[i]=random(0.001,0.1);
    thetaZ[i]=random(0.001,0.1);
  }
}

void draw(){
  //bg();
  background(0);
  directionalLight(51, 102, 126, 0, height, 0);
  directionalLight(10, 20, 30, 0, -height, 0);
  for(int i=0;i<Length;i++){
    pushMatrix();
    translate(X[i],Y[i],Z[i]);
    rotateX(thetaX[i]);
    rotateY(thetaY[i]);
    rotateZ(thetaZ[i]);
    box(r[i]);
    if(Y[i]>height+50){
      Y[i]=random(-100,0);
    }
    else{
      Y[i]+=random(0.5,3);
    }
    thetaX[i]+=random(0.001,0.1);
    thetaY[i]+=random(0.001,0.1);
    popMatrix();
  }
}

void bg(){
  PImage bg=loadImage("bg.jpg");
  image(bg,0,0,width,height);
}

