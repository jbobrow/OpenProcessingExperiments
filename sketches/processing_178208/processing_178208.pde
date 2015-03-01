
void setup() {
  size(600, 600, P3D);
}

void CatmullRom(float x, float y1, float y2, float z) {
  float[] leftx=new float[7];
  float[] rightx=new float[7];
  float[] y=new float[7];

  float l=y2-y1;

  leftx[0]=x+l/6;
  leftx[1]=x;
  leftx[2]=x-l/6;
  leftx[3]=x-l/8+l*(mouseX-300)/2400;
  leftx[4]=x-l/16-l*(mouseX-300)/1200;
  leftx[5]=x;
  leftx[6]=x+l*(mouseX-300)/600;

  rightx[0]=x-l/6;
  rightx[1]=x;
  rightx[2]=x+l/6;
  rightx[3]=x+l/8+l*(mouseX-300)/2400;
  rightx[4]=x+l/16-l*(mouseX-300)/1200;
  rightx[5]=x;
  rightx[6]=x+l*(mouseX-300)/600;

  y[0]=y2-l/4;
  y[1]=y2-l/12;
  y[2]=y2-l/4;
  y[3]=y2-l/2;
  y[4]=y2-3*l/4;
  y[5]=y1;
  y[6]=y1+l/8;
  for (int i=0; i<=3; i+=1) {
    beginShape();
    for (float t1=0; t1<=1; t1+=0.02) {
      float t2=t1*t1;
      float t3=t2*t1;

      float X;
      float Y;

      X=(-.5*leftx[i] + 1.5*leftx[i+1]  -1.5*leftx[i+2] + .5*leftx[i+3])*t3 + (leftx[i] -2.5*leftx[i+1] +2*leftx[i+2] -.5*leftx[i+3])*t2 + (-.5*leftx[i] + .5*leftx[i+2])*t1 + leftx[i+1];
      Y=(-.5*y[i] + 1.5*y[i+1]  -1.5*y[i+2] + .5*y[i+3])*t3 + (y[i] -2.5*y[i+1] +2*y[i+2] -.5*y[i+3])*t2 + (-.5*y[i] + .5*y[i+2])*t1 + y[i+1];  

      vertex(X, Y, z);
    }
    endShape();
  }

  for (int i=0; i<=3; i+=1) {
    beginShape();
    for (float t1=0; t1<=1; t1+=0.02) {
      float t2=t1*t1;
      float t3=t2*t1;

      float X;
      float Y;

      X=(-.5*rightx[i] + 1.5*rightx[i+1]  -1.5*rightx[i+2] + .5*rightx[i+3])*t3 + (rightx[i] -2.5*rightx[i+1] +2*rightx[i+2] -.5*rightx[i+3])*t2 + (-.5*rightx[i] + .5*rightx[i+2])*t1 + rightx[i+1];
      Y=(-.5*y[i] + 1.5*y[i+1]  -1.5*y[i+2] + .5*y[i+3])*t3 + (y[i] -2.5*y[i+1] +2*y[i+2] -.5*y[i+3])*t2 + (-.5*y[i] + .5*y[i+2])*t1 + y[i+1];  

      vertex(X, Y, z);
    }
    endShape();
  }


  for (int i=0; i<=3; i+=1) {
    for (float t1=0; t1<=1; t1+=0.05) {
      float t2=t1*t1;
      float t3=t2*t1;

      float rightX;
      float leftX;
      float Y;

      leftX=(-.5*leftx[i] + 1.5*leftx[i+1]  -1.5*leftx[i+2] + .5*leftx[i+3])*t3 + (leftx[i] -2.5*leftx[i+1] +2*leftx[i+2] -.5*leftx[i+3])*t2 + (-.5*leftx[i] + .5*leftx[i+2])*t1 + leftx[i+1];
      rightX=(-.5*rightx[i] + 1.5*rightx[i+1]  -1.5*rightx[i+2] + .5*rightx[i+3])*t3 + (rightx[i] -2.5*rightx[i+1] +2*rightx[i+2] -.5*rightx[i+3])*t2 + (-.5*rightx[i] + .5*rightx[i+2])*t1 + rightx[i+1];
      Y=(-.5*y[i] + 1.5*y[i+1]  -1.5*y[i+2] + .5*y[i+3])*t3 + (y[i] -2.5*y[i+1] +2*y[i+2] -.5*y[i+3])*t2 + (-.5*y[i] + .5*y[i+2])*t1 + y[i+1];  

      translate((rightX+leftX)/2, Y, z);

      float r=(rightX-leftX)/2;

      beginShape();
      for (float angle=0; angle<=360; angle+=10) {
        float theta=radians(angle);
        float X=r*cos(theta);
        float Z=r*sin(theta);
        vertex(X, 0, Z);
      }
      endShape();

      translate(-(rightX+leftX)/2, -Y, -z);
    }
  }
}

float up=0;
float right=0;


void draw() {
  background(255);

  if (keyPressed) {
    if (key=='a')
      right-=5;
    if (key=='d')
      right+=5;
    if (key=='w')
      up-=5;
    if (key=='s')
      up+=5;
  }


  stroke(random(105)+150, 0, 0);
  CatmullRom(300+right, 0+up, 550+random(50)+up, 0);
  stroke(0, 50, random(100)+105);
  CatmullRom(150, 400, 550, 100);
  stroke(random(155)+100, 100, 0);
  CatmullRom(450, 300, 550, 100);
  stroke(100, random(105)+100, 0);
  CatmullRom(200, 100, 200, -50);
  stroke(150, random(50)+130, 0);
  CatmullRom(100, 275, 325, 0);
  stroke(50, 50, random(105)+105);
  CatmullRom(450, 50, 200, -100);
}

