
PGraphics b;
float theta=0.1;
int tam=100;
punto[] a = new punto[tam],c = new punto[tam],d = new punto[tam],e = new punto[tam];
void setup()
{
  size(900,450,P3D);
  b = createGraphics(width,height,P3D);
  for(int x=0;x<tam;x++)
  {
    int j=x*width/tam;
    a[x]=new punto(j,j^3,-j^2,color(random(255),random(255),random(255)));
    c[x]=new punto(j,height,0,color(random(255),random(255),random(255)));
    d[x]=new punto(width-j,height-j^3,-j^2,color(random(255),random(255),random(255)));
    e[x]=new punto(width-j,0,0,color(random(255),random(255),random(255)));
  }
  smooth();
}
void draw()
{
  if(mousePressed)
      b.strokeWeight(random(10)); 
  else
    b.strokeWeight(1);
    for(int r=0;r<tam;r++)
    {
      a[r].x+=width/tam;
      c[r].x+=width/tam;
      e[r].x-=width/tam;
      d[r].x-=width/tam;
    }
  b.beginDraw();
 // b.background(random(255),random(255),random(255),60);
  b.background(0,50);
  b.fill(255,50);
  b.beginShape(POLYGON);
  for(int r=0;r<tam;r++)
  {
    int j = r*width/tam;
    a[r].y=j^3;
    a[r].z=-j^2;
    d[r].y=height-j^3;
    d[r].z=-j^2;
    if(a[r].x>width)
      a[r].x=0;
    if(c[r].x>width)
      c[r].x=0;
    if(d[r].x<0)
      d[r].x=width;
    if(e[r].x<0)
      e[r].x=width;
    b.stroke(a[r].c);
    b.noFill();
    b.curveVertex(a[r].x,a[r].y,a[r].z);
    b.stroke(c[r].c);
    b.noFill();
    b.curveVertex(c[r].x,c[r].y,c[r].z);
    b.stroke(d[r].c);
    b.noFill();
    b.curveVertex(d[r].x,d[r].y,d[r].z);
    b.stroke(e[r].c);
    b.noFill();
    b.curveVertex(e[r].x,e[r].y,e[r].z);
    b.pushMatrix();
    b.translate(width/2,0,0);
    b.rotateY(theta);
    b.popMatrix();
  }
     b.endShape();
  b.endDraw();
  image(b,0,0);
  theta+=0.1;
}
class punto
{
  float x,y,z;
  color c;
  punto(float x_,float y_,float z_,color c_)
  {
    c=255;
    x=x_;
    y=y_;
    z=z_;
  }
}

