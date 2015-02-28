
int num=50;
float[]X=new float[num];
float[]Y=new float[num];
float[]Z=new float[num];
float[]amX=new float[num];
float[]amY=new float[num];
float[]amZ=new float[num];
float[]anX=new float[num];
float[]anY=new float[num];
float an2Y;

void setup() {
  size(800, 600, P3D);
  for (int i=0; i<num; i++) {
    X[i]=random(-200, 200);
    Y[i]=random(-200, 200);
    Z[i]=random(-200, 200);
    amX[i]=random(0.1, 1);
    amY[i]=random(0.1, 1);
    amZ[i]=random(0.1, 1);
    anX[i]=random(360);
    anY[i]=random(360);
    an2Y=0;
  }
  smooth();
  textAlign(CENTER);
  textSize(20);
} 

void draw() {
  background(0);
  translate(width/2, height/2);
  an2Y+=0.5;
  if (an2Y>360) an2Y=0;
  rotateY(radians(an2Y));
  beginShape();
  for (int i=0; i<num; i++) {
    rotateX(radians(anX[i]));
    rotateY(radians(anY[i]));
    if (X[i]>200 || X[i]<-200) {
      amX[i]=-amX[i];
    }
    if (Y[i]>200 || Y[i]<-200) {
      amY[i]=-amY[i];
    }
    if (Z[i]>200 || Z[i]<-200) {
      amZ[i]=-amZ[i];
    }
    X[i]=X[i]+amX[i];
    Y[i]=Y[i]+amY[i];
    Z[i]=Z[i]+amZ[i];
    stroke(255, 100);
    noFill();
    curveVertex(X[i], Y[i], Z[i]);
  }
  endShape(CLOSE);
  for (int i=0; i<num; i++) {
    camera();
    text(an2Y, width/5, height/2);
  }
}  

void mouseClicked() {
  for (int i=0; i<num; i++) {
    X[i]=random(-200, 200);
    Y[i]=random(-200, 200);
    Z[i]=random(-200, 200);
    amX[i]=random(0.1, 1);
    amY[i]=random(0.1, 1);
    amZ[i]=random(0.1, 1);
    anX[i]=random(360);
    anY[i]=random(360);
    an2Y=0;
  }
}


