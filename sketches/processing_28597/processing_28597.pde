
import processing.opengl.*;
//import ddf.minim.*;
//import ddf.minim.analysis.*;
int tam=10,d=100,cont=0;
color cal=0;
PVector[][][] a = new PVector[tam][tam][tam];
linea[] b = new linea[tam*tam*tam];
//Minim minim;
//AudioInput song;
void setup()
{
  size(900,450,P3D);
  background(0);
  for(int x=0;x<tam;x++)
    for(int y=0;y<tam;y++)
      for(int z=0;z<tam;z++)
        a[x][y][z]= new PVector(d*x,d*y,d*z);
   for(int y=0;y<tam*tam*tam;y++)
     b[y] = new linea(a[int(random(tam))][int(random(tam))][int(random(tam))],a[int(random(tam))][int(random(tam))][int(random(tam))],color(random(255),random(255),random(255)),random(100));  
  noFill();
  noCursor();
}
void draw()
{
  background(255);
  if(mousePressed)
    background(0);
  translate(width/2,height/2,0);
  rotateY(map(mouseX,0,width,0,2*PI));
  rotateX(map(mouseY,0,height,0,2*PI));
  stroke(cal,50);
  strokeWeight(1);
  if(key!='a')
  for(int x=0;x<tam;x++)
    for(int y=0;y<tam;y++)
      for(int z=0;z<tam;z++)
      {
        pushMatrix();
        translate(a[x][y][z].x,a[x][y][z].y,a[x][y][z].z);
        if(mousePressed&&mouseButton==LEFT)
          fill(random(255),random(255),random(255));
        else
          noFill();
        box(20);
        popMatrix();
      }
       // point(a[x][y][z].x,a[x][y][z].y,a[x][y][z].z);
  strokeWeight(1);
  for(int x=0;x<cont;x++)
    b[x].accion();
  if(mousePressed)
  {
  
    cont++;
    if(cont>=tam*tam*tam)
      cont=tam*tam*tam-1;
  }
  if(key=='h')
    cont=tam*tam*tam-1;
  
}

class linea
{
  PVector ori,dest;
  color col;
  float t;
  linea(PVector o,PVector d,color c,float tr)
  {
    ori=o;
    dest=d;
    col=c;
    t=tr;
  }
  public void accion()
  {
    stroke(col,t);
    beginShape(LINES);
    vertex(ori.x,ori.y,ori.z);
    vertex(dest.x,dest.y,dest.z);
    endShape();
  }
}

