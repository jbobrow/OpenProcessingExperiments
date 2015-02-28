
int num=1000;
float[]X=new float[num];
float[]Y=new float[num];
float[]AnX=new float[num];
float[]AnY=new float[num];
float es;

void setup() {
  size(800, 600, P3D);
  for (int i=0; i<num; i++) {
    X[i]=random(-200, 200);
    Y[i]=random(-200, 200);
    AnX[i]=random(360);
    AnY[i]=random(360);
  }
}

void draw() {
  background(0);
  translate(width/2, height/2);
  camera(30.0, mouseY, 220.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0); 
  for (int i=0; i<num; i++) {
    AnX[i]+=0.05;
    AnY[i]+=0.05;
    rotateX(radians(AnX[i]));
    rotateY(radians(AnY[i]));
    noStroke();
    fill(255);
    es=random(5);
    ellipse(0+X[i], 0+Y[i], es, es);
  }
}



