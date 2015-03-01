
int cant=1000,arrow=0;
points[] a1 = new points[cant];
color col=0,cal=255;
float t=0.1,n=2;
float i=30;
void setup()
{
  size(1400,700,P3D);
  background(255);
  translate(width,0,0);
  frameRate(i);
  for(int e=0;e<cant;e++)
  {
    a1[e] = new points(int(random(-width,width)),int(random(-height,height)),int(random(-width,width)),color(0,50),10);
  }
   
  
}
void draw()
{
  translate(width/2,height/2,width/2+arrow);
  rotateX(map(mouseY,0,height,-2*PI,2*PI));
  rotateY(map(mouseX,0,width,-2*PI,2*PI));
  background(col,50);
  for(int u=0;u<cant;u++)
  {
    a1[u].printa();
      for(int v=0;v<cant;v++)
      {
          if(abs(a1[u].z-a1[v].z)<200)
          if(abs(a1[u].x-a1[v].x)<200)
          if(abs(a1[u].y-a1[v].y)<200)
          {
            stroke(cal,50);
            beginShape(LINES);
            vertex(a1[u].x,a1[u].y,a1[u].z);
            vertex(a1[v].x,a1[v].y,a1[v].z);
            endShape();
          }
      }
    a1[u].change();
  }
 
 if(mousePressed)
 {
  col=255;
  cal=color(255,0,0);
 }
 else
 {
  col=0;
  cal=255;
 }
}
class points
{
  int x,y,z;
  float tem;
  color fil;
  points(int q,int w,int te,color a,float e)
  {
    x=q;
    y=w;
    z=te;
    fil=a;
    tem=e;
  }
   
  void printa()
  {
    if(mousePressed)
    fill(0,random(255),255,70);
    else
    fill(cal,50);
    noStroke();
    pushMatrix();
    translate(x,y,z);
    box(tem);
    fill(fil);
    box(tem/5);
    popMatrix();
    tem+=n;
    if(tem>=100||tem<=1)
    {
    n*=-1;
    }
    
  }
  void change()
  {
    if(x<-width)
    x=-width+100;
    else
    if(x>(height))
    x=height-100;
    else
    x=x+int(random(-5,5));
    if(y<-height)
    y=-height+100;
    else
    if(y>(width))
    y=width-100;
    else
    y=y+int(random(-5,5)); 
    if(z>width)
      z=width-100;
    else
    z=z+int(random(-5,5));
    if(z<-width)
      z=-width+100;
     
  }
}
void keyPressed()
{
if(keyCode==40)
  arrow-=300;
if(keyCode==38)
  arrow+=300;
  
  if (key == '1') 
  i+=5;
  if (key == '2') 
  i-=5;
}
