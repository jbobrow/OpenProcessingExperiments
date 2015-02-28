
//import processing.opengl.*;
int cant=1000,flecha=0;
puntos[] a1 = new puntos[cant];
color col=0,cal=255;
float t=0.1,n=2;
void setup()
{
  size(900,450,P3D);
  background(255);
  translate(width,0,0);
  for(int e=0;e<cant;e++)
  {
    a1[e] = new puntos(int(random(-width,width)),int(random(-height,height)),int(random(-width,width)),color(random(255),random(255),random(255)),1);
  }
  
}
void draw()
{
  translate(width/2,height/2,width/2+flecha);
  rotateX(map(mouseY,0,height,-2*PI,2*PI));
  rotateY(map(mouseX,0,width,-2*PI,2*PI));
  background(col,50);
  for(int u=0;u<cant;u++)
  {
    a1[u].imprimir();
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
    a1[u].cambio();
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
class puntos
{
  int x,y,z;
  float tem;
  color fil;
  puntos(int q,int w,int te,color a,float e)
  {
    x=q;
    y=w;
    z=te;
    fil=a;
    tem=e;
  }
  
  void imprimir()
  {
    if(mousePressed)
    fill(0,50);
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
    if(tem>=50||tem<=1)
    {
    n*=-1;
    }
  }
  void cambio()
  {
    if(x<-width)
    x=-width+10;
    else
    if(x>(height))
    x=height-10;
    else
    x=x+int(random(-5,5));
    if(y<-height)
    y=-height+10;
    else
    if(y>(width))
    y=width-10;
    else
    y=y+int(random(-5,5));  
    if(z>width)
      z=width-10;
    else
    z=z+int(random(-5,5));
    if(z<-width)
      z=-width+10;
    
  }
}
void keyPressed()
{
if(keyCode==40)
  flecha-=300;
if(keyCode==38)
  flecha+=300;
}

