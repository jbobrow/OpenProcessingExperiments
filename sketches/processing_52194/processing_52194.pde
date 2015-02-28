
float spin = 0.0;
int[] xpos=new int[50];
int[] ypos=new int[50];

void setup() 
{
  size(1200, 800, P3D);
  noStroke();
  smooth();
}

void draw() 
{

  background(220);
  lights();
  
  spin += 0.001;
  shiftpos(xpos,mouseX);
  shiftpos(ypos,mouseY);
  for(int t = 0;t<xpos.length;t++)
  {
    translate(mouseX,mouseY);
    fill(255,255-t*255/xpos.length,0);
    rotateX(PI+spin);
    rotateY(5);
    box(xpos[t],ypos[t],t);
  }

  
//  pushMatrix();
}
//void cube()
//{
//  translate(mouseX,mouseY);
//  rotateX(PI+spin);
//  rotateY(5);
//  fill(0,255,0);
//  box(120);
////  popMatrix();
//}
void shiftpos(int[] name,int filler)
{
  for(int i =0;i<name.length-1;i++)
    name[i]=name[i+1];
  name[name.length-1]=filler;
}






