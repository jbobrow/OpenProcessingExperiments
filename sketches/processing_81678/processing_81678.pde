
float theta=50,r,g,b,separacion=50;
int h=10;
void setup()
{
size(500,200,P3D);
r=random(255);
g=random(255);
b=random(255);
}
void draw()
{
   
   background(255,20);
  if(mousePressed)
   background(0,20);
   translate(0,height/4,-500);
   stroke(239,247,17,100);
  for(int e=1;e<=6;e++){
    separacion=map(mouseX,0,width,0,30);
     pushMatrix();
     translate(e*width/6,0,0);
     if(e==3)  
  {
   rotateY(-theta);
   rotateX(theta);
   rotateZ(theta);
   }
  if(e==2)  
  {
   rotateY(theta);
   rotateX(-theta);
   rotateZ(theta);
  }
  if(e==1)
  {
   rotateY(theta);
   rotateX(-theta);
   rotateZ(-theta);
  }
  if(e==4)
  {
   rotateY(-theta);
   rotateX(-theta);
   rotateZ(-theta);
  }
  if(e==5)
  {
   rotateY(theta);
   rotateX(theta);
   rotateZ(-theta);
  }
  if(e==6)
  {
   rotateY(-theta);
   rotateX(-theta);
   rotateZ(theta);
  }
// rotateY(theta);
 
  drawSphere(10,height/4,20,mouseY/4,r,g,b,separacion);
  
 
 
   popMatrix();
}
theta+=0.02;
h+=100;
if(h==10000)
h=0;
}
 
void drawSphere(float x,float y,float z,float radio,float r,float g,float b,float divisor)
{
  pushMatrix();
  translate(x*20,y*4,z*10);
  if(mousePressed)
    stroke(100,60);
  else
  stroke(0,60);
 

  box(radio);
  if(radio>50)
  {
   

  }
  popMatrix();
}


