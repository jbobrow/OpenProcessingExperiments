
//Eli N-M, CP1 4-5, Rotating Sphere 
float h=0.3;
float g=0.3;
float cx=300;
float cy=-300;
float change=-5;
float G=0.08;
float H=0;
void setup()
{
  size(500,500,P3D);
  
}

void draw()
{
  
  
    if(cy==0 || cy==1000)
  {
    background(150);
  }
  else
  {
    background(0);
  }
  
 
  camera(cx,cy,250,mouseX-250,mouseY-250,0,0,1,0);
  background(0);
  rotateX(g);
  rotateY(h);
  
  if(mousePressed)
  {
    fill(random(0,256),random(0,256),random(0,256));
  
  }
  sphere(100);
  lights();
  g=g+G;
  h=h+H;
  
  if(keyPressed==true && key==' ')
  {
    H=0.5;
    G=-0.08;
  }
  else
  {
    H=0;
    G=0.08;
  }
  
  
  cy=cy+change;
 
  if(cy<-1000)
  {
    change=5;
  }
  else if(cy>1000)
  {
    change=-5;
  }
  
}
