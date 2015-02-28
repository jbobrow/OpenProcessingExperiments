
Node [] myNodes;
float rotX, rotY = 0.0;
int nodeNumber=200;
float dragMotionConstant = 0.01;
float tx=0;
float ty=0;
float zoom=1;
int r=300;

void setup ()
{
  size(500, 500, P3D);
  smooth();
  fill(255);
  myNodes = new Node [nodeNumber];
  for (int i=0;i<nodeNumber;i++){
    color cc = color(i*3*20%255,i*5*20%255,i*7*20%255);
    float ri = random(5);
    float theta = random(0,TWO_PI);
    float u = random(-1,1);
    myNodes[i]=new Node(cc,ri,theta, u);
  }
  
}

void draw ()
{
  background(0);
  translate(width/2, height/2);
  rotateX(rotX);
  rotateY(rotY);
  for (int i = 0; i < nodeNumber; i++)  {
     if (mousePressed & mouseButton==LEFT) {
         rotY += (pmouseX - mouseX) * -0.0002;
         rotX += (pmouseY - mouseY) * +0.0002;  
         }
     if (mousePressed & mouseButton==RIGHT) {
          tx += (pmouseX - mouseX) * dragMotionConstant;
          ty += (pmouseY - mouseY) * dragMotionConstant;  
         }
          myNodes[i].display();
  }
  rotY += 0.01;
  //control camera
  if (keyPressed & key == 'd') {zoom += 0.01;}
  if (keyPressed & key == 'a') {zoom += -0.01;}
  camera(0, 0, 500*zoom, tx, ty, 0, 0, 1, 0);
   
}



class Node {
  color c;
  float r;
  float x;
  float y;
  float z;
  int s=150;

  Node(color tempC, float tempR, float tempTheta, float tempU) {  
  c=tempC;
  r=tempR;
  x=s*cos(tempTheta)*sqrt(1-(tempU*tempU));
  y=s*sin(tempTheta)*sqrt(1-(tempU*tempU));
  z=s*tempU;  
  }
  
  void display() {    
    strokeWeight(r);
    stroke(c);
    point(x,y,z);    
  }
}


