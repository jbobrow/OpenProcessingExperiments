
int w=100;
color col=255;
float theta=0.1,t=0.1;

void setup()  //individually creates boxes that rotate in different directions
{
  size(800,800,P3D);
  background(0);
  fill(0);
  stroke(255,100,30);
}  

void draw()  //draws the rotated boxes
{
  stroke(0,0,255);
  strokeWeight(3);
  background(0);
   translate(width/2,height/2,-1000);
   //biggers
  rotateX(t);
  for(float x=0; x<2*PI; x+=PI/int(map(100,0,width,1,200)))
  {
    rotateY(theta);
    rotate(x*2);
    pushMatrix();
    translate(600,0,0);
    box(map(200,0,height,1,280));
    popMatrix();
  }
   rotateY(PI);
    for(float x=0;x<2*PI; x+=PI/int(map(100,0,width,1,200)))
  {
    rotateY(theta);
    rotate(x*2);
    pushMatrix();
    translate(600,0,0);
    box(map(200,0,height,1,280));
    popMatrix();
  }
 
  //smalls
  stroke(2,198,245);
    rotateX(t);
  for(float x=0;x<3*PI;x+=PI/int(map(100,0,width,1,200)))
  {
    rotateY(theta);
    rotate(x*2);
    pushMatrix();
    translate(500,0,0);
    box(map(100,0,height,1,100));
    popMatrix();
  }
   rotateY(PI);
    for(float x=0;x<3*PI;x+=PI/int(map(100,0,width,1,200)))
  {
    rotateY(theta);
    rotate(x*2);
    pushMatrix();
    translate(500,0,0);
    box(map(100,0,height,1,100));
    popMatrix();
  }
  
    theta+=0.008;
  t+=0.01;
}
