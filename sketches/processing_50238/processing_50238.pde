
int num=10;
float[]AngleX=new float[num];
float[]AngleY=new float[num];

void setup() {
  size(600, 400, P3D);
  background(255);
  for (int i=0; i<num; i++) {
    AngleX[i]=random(360);
    AngleY[i]=random(360);
  }
  smooth();
}

void draw() {
  if (mousePressed) {
    background(255);
  }  
  translate(width/2, height/2);
  for (int i=0; i<num; i++) {
    AngleX[i]+=0.2;
    AngleY[i]+=0.2;
    rotateX(radians(AngleX[i]));
    rotateY(radians(AngleY[i]));
    stroke(0, 100);
    strokeWeight(2);
    point(150, 0);
  }
}


